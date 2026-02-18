function sysfetch
    if type -q fastfetch
        if begin
                string match -q "*kitty*" "$TERM"
                or string match -q "*ghostty*" "$TERM"
            end
            and test -f "$HOME/.config/fastfetch/kitty.jsonc"

            fastfetch --config "$HOME/.config/fastfetch/kitty.jsonc"
        else
            fastfetch
        end
    else if type -q neofetch
        echo "Why are you still using neofetch? It's deprecated!"
        neofetch
    else if type -q screenfetch
        screenfetch
    else if type -q archey
        archey
    else if type -q lsb_release
        lsb_release -a
    else if type -q uname
        uname
    end
end
