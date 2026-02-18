if status is-interactive
    # Modern Unix Replacements
    alias cat bat
    alias du dust
    alias df duf
    alias grep rg
    alias cp xcp
    alias find fd
    alias top btm
    alias htop btm
    alias burn rm
    alias rm rip
    # Convenience aliases
    alias free "free -m"
    alias npkg "nano -w PKGBUILD"
    alias q exit
    alias :q exit
    alias c clear
    alias h history
    alias lsa "ls -a"
    alias lsl "ls -l"
    alias lsla "ls -la"
    # Python / Poetry
    alias pip-upgrade "python -m pip install --upgrade pip"
    alias pypy pypy3
    alias poem "poetry run python"
    alias bashpoem "poetry run bash"
    alias nupoem "poetry run nu"
    alias fishpoem "poetry run fish"
    alias jupyterpoem "poetry run jupyter"
    # Misc
    alias vim nvim
    alias vi nvim
    alias nix-fish "nix-shell --command fish"

    abbr --add .. cd ..
    abbr --add ... cd ../..
    abbr --add .... cd ../../..
    abbr --add ..... cd ../../../..
end
