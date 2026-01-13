$env.NU_LIB_DIRS = [
    ($env.FILE_PWD | path join "scripts"),
    $env.FILE_PWD
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join "plugins")
]

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.config = {
    show_banner: false
    ls: {
        use_ls_colors: false # Disabling colors is a small optimization for the LSP
    }
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "prefix"
        external: {
            enable: true
            max_results: 100
        }
    }
}
