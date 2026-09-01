export def main [] {
    let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans | from json
    }

    {
        show_banner: false # disable the welcome banner at startup
        shell_integration: {
            osc2: true
            osc7: true
            osc8: true
            # OSC9.9 causes swaync to notify end of every command under kitty
            osc9_9: (not (("TERM" in $env) and ("kitty" in $env.TERM)))
            osc133: true
            osc633: true
            reset_application_mode: true
        }
        # use kitty protocol when running inside kitty or wezterm
        use_kitty_protocol: (
            (
                ("TERM" in $env) and ("ghostty" in $env.TERM)
            ) or (
                ("TERM" in $env) and ("kitty" in $env.TERM)
            ) or (
                "WEZTERM_EXECUTABLE" in $env
            )
        )
        history: {
            file_format: "sqlite"
            isolation: true # isolate up-arrow history per session, shared search still works
        }
        completions: {
            algorithm: "fuzzy" # match anywhere in completion candidates, not just prefix
            external: {
                completer: $carapace_completer
            }
        }
        render_right_prompt_on_last_line: true
        hooks: {
            env_change: {
                PWD: [
                    {|before, after| # This hook runs onefetch when entering a new git repository
                        if (not (in-devenv?)) and ($after | path join ".git" | path exists) {
                            let repo_root = (^git -C $after rev-parse --show-toplevel | str trim)
                            let last_repo = ($env | default "" __last_onefetch_repo | get __last_onefetch_repo)
                            if $repo_root != $last_repo {
                                try { ^timeout 2.5 onefetch --nerd-fonts | print }
                                $env.__last_onefetch_repo = $repo_root
                            }
                        }
                    },
                    {||
                        if $env.__has_direnv {
                            try { direnv export json | from json | default {} | load-env }
                        }
                    }
                ]
            }
            command_not_found: {|cmd_name|
                try {
                    let pkgs = (
                        nix-locate --minimal --no-group --type x --type s
                            --top-level --whole-name --at-root $"/bin/($cmd_name)"
                        | str trim | lines
                    )
                    if ($pkgs | is-not-empty) {
                        $"(ansi yellow)($cmd_name)(ansi reset) is available in: ($pkgs | str join ', ')"
                    }
                }
            }
        }
        cursor_shape: {
            emacs: line
            vi_normal: blink_block
            vi_insert: blink_line
        }
    }
}
