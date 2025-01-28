def get_env [s: string]: string -> string {
    try { $env | get --ignore-errors $s } catch { "" }
}

def get_status []: nothing -> string {
    match (get_env "LAST_EXIT_CODE") {
        "0" => "0",
        _ => "1",
    }
}

export def create_left_prompt []: nothing -> string  {
    ^starship prompt --cmd-duration (get_env "CMD_DURATION_MS") --status (get_status) --terminal-width (term size).columns
}

export def create_right_prompt []: nothing -> string  {
    ^starship prompt --right --cmd-duration (get_env "CMD_DURATION_MS") --status (get_status) --terminal-width (term size).columns
}

export def create_continuation_prompt []: nothing -> string  {
    ^starship prompt --continuation --cmd-duration (get_env "CMD_DURATION_MS") --status (get_status) --terminal-width (term size).columns
}

def parse_ms_to_human_readable [ms: string]: string -> string  {
    if $ms == "" {
        $ms
    } else {
        let $time_in_ms = $ms | into int;
        if $time_in_ms < 1000 {
            $"($time_in_ms | into string)ms"
        } else if $time_in_ms < 1000 * 60 {
            $"(($time_in_ms / 1000) | into string --decimals 2)s"
        } else if $time_in_ms < 1000 * 60 * 60 {
            $"(($time_in_ms / (1000 * 60)) | into string --decimals 2)m"
        } else if $time_in_ms < 1000 * 60 * 60 * 24 {
            $"(($time_in_ms / (1000 * 60 * 60)) | into string --decimals 2)h"
        } else {
            $"(($time_in_ms // (1000 * 60 * 60 * 24)) | into string)d/(parse_ms_to_human_readable ($time_in_ms mod (1000 * 60 * 60 * 24)))"
        } | into string
    }
}

export def create_transient_prompt_left []: nothing -> string  {
    if (get_env "LAST_EXIT_CODE") == "0" {
        $"(ansi green_bold)󱔳(ansi reset)"
    } else {
        $"(ansi red_bold)󱔷(ansi reset)"
    }
}
export def create_transient_prompt_indicator []: nothing -> string {
    $"(ansi blue_bold) 󰔛 (parse_ms_to_human_readable (get_env "CMD_DURATION_MS")) (if (get_env "LAST_EXIT_CODE") == "0" { ansi green_bold } else { ansi red_bold })(ansi reset) "
}
