set -U fish_greeting

if status is-interactive
    # --- Vi Mode Settings ---
    fish_vi_key_bindings
    set fish_cursor_default block blink
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual block

    # --- Plugin Initializations ---
    if type -q starship
        starship init fish | source
    end

    if type -q atuin
        atuin init fish | source
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q rbw
        rbw gen-completions fish | source
    end

    # --- Hooks ---

    # Auto-run onefetch when entering a git repo
    # This function registers an event handler on the variable PWD
    function __run_onefetch_on_dir_change --on-variable PWD
        if test -d .git
            onefetch --nerd-fonts
        end
    end
    __run_onefetch_on_dir_change

    # Startup fetch
    sysfetch
end
