package main

import (
    "bufio"
    "flag"
    "fmt"
    "os"
    "path/filepath"
    "strings"
)

const valueToChange = "kb_layout"

// readLayouts reads the available keyboard layouts from a file.
func readLayouts(layoutFile string) ([]string, error) {
    file, err := os.Open(layoutFile)
    if err != nil {
        return nil, err
    }
    defer file.Close()

    var layouts []string
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        layout := strings.TrimSpace(scanner.Text())
        if layout != "" {
            layouts = append(layouts, layout)
        }
    }

    if err := scanner.Err(); err != nil {
        return nil, err
    }

    // To prevent index out of range error in toggleLine function,
    // we add the first layout to the end to create a cycle.
    if len(layouts) > 0 {
        layouts = append(layouts, layouts[0])
    } else {
        return nil, fmt.Errorf("no layouts found in %s", layoutFile)
    }


    return layouts, nil
}

// isTargetLine checks if a line contains the configuration key we want to change.
func isTargetLine(line string) bool {
    return strings.Contains(line, valueToChange)
}

// readCurrentConfig reads all lines from the configuration file.
func readCurrentConfig(configFile string) ([]string, error) {
    file, err := os.Open(configFile)
    if err != nil {
        return nil, err
    }
    defer file.Close()

    var lines []string
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }

    return lines, scanner.Err()
}

// writeNewConfig writes the updated lines back to the configuration file.
func writeNewConfig(lines []string, configFile string) error {
    file, err := os.Create(configFile)
    if err != nil {
        return err
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    for _, line := range lines {
        if _, err := writer.WriteString(line + "\n"); err != nil {
            return err
        }
    }
    return writer.Flush()
}

// toggleLine finds the current layout in a line, and replaces it with the next one from the list.
func toggleLine(line string, layouts []string) string {
    var builder strings.Builder

    // Preserve indentation
    indentLength := len(line) - len(strings.TrimLeft(line, " \t"))
    builder.WriteString(strings.Repeat(" ", indentLength))

    // Separate code from comments
    codeAndComments := strings.SplitN(line, "#", 2)
    code := strings.TrimSpace(codeAndComments[0])
    tokens := strings.Fields(code)
    currentLayout := tokens[len(tokens)-1]

    // Find the index of the current layout and get the next one
    currentIndex := -1
    for i, layout := range layouts {
        if layout == currentLayout {
            currentIndex = i
            break
        }
    }

    // The last element is a duplicate of the first, so (currentIndex+1) is always safe.
    if currentIndex != -1 {
        tokens[len(tokens)-1] = layouts[currentIndex+1]
    }

    builder.WriteString(strings.Join(tokens, " "))

    // Re-append the comment if it exists
    if len(codeAndComments) > 1 {
        builder.WriteString(" # ")
        builder.WriteString(strings.TrimSpace(codeAndComments[1]))
    }

    return builder.String()
}

// cycleKbLayout orchestrates the entire process of reading, modifying, and writing the config.
func cycleKbLayout(configFile, layoutFile string) error {
    layouts, err := readLayouts(layoutFile)
    if err != nil {
        return err
    }

    lines, err := readCurrentConfig(configFile)
    if err != nil {
        return err
    }

    var newLines []string
    for _, line := range lines {
        if isTargetLine(line) {
            line = toggleLine(line, layouts)
        }
        newLines = append(newLines, line)
    }

    return writeNewConfig(newLines, configFile)
}

// expandPath resolves file paths by handling the '~' shorthand for the home directory
// and converting relative paths to absolute paths based on the executable's location.
func expandPath(path string) (string, error) {
    // --- Step 1: Handle tilde expansion ---
    if strings.HasPrefix(path, "~") {
        homeDir, err := os.UserHomeDir()
        if err != nil {
            return "", fmt.Errorf("could not get user home directory: %w", err)
        }
        // Replace "~" with the actual home directory path.
        // filepath.Join correctly handles path separators.
        path = filepath.Join(homeDir, path[1:])
    }

    // --- Step 2: Handle relative paths ---
    // If the path is still not absolute after potential tilde expansion,
    // join it with the executable's directory.
    if !filepath.IsAbs(path) {
        exeDir, err := filepath.Abs(filepath.Dir(os.Args[0]))
        if err != nil {
            return "", fmt.Errorf("could not get executable directory: %w", err)
        }
        path = filepath.Join(exeDir, path)
    }

    return path, nil
}


// Define flags for the input files
var configFile = flag.String("c", "inputs.conf", "Path to the configuration file (e.g., ~/.config/hypr/inputs.conf)")
var layoutFile = flag.String("l", "kb_layouts.txt", "Path to the keyboard layout file (e.g., ~/.config/hypr/kb_layouts.txt)")

func main() {
    // Parse command-line flags
    flag.Parse()

    // Resolve the full, absolute path for the config file, handling '~'
    configFilePath, err := expandPath(*configFile)
    if err != nil {
        fmt.Printf("Error processing config file path: %v\n", err)
        return
    }

    // Resolve the full, absolute path for the layout file, handling '~'
    layoutFilePath, err := expandPath(*layoutFile)
    if err != nil {
        fmt.Printf("Error processing layout file path: %v\n", err)
        return
    }

    // Call the main logic with the fully resolved paths
    if err := cycleKbLayout(configFilePath, layoutFilePath); err != nil {
        fmt.Printf("Error cycling keyboard layout: %v\n", err)
    }
}

