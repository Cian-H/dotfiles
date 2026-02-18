set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx PIPENV_VERBOSITY -1
set -gx MAKEFLAGS "-j"(math (nproc) + 1)
set -gx JULIA_NUM_THREADS (nproc)
set -gx YAOURT_COLORS "nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx PASSWORD_STORE_DIR "$HOME/.cache/password-store"
set -gx GLAMOUR_STYLE "$XDG_CONFIG_HOME/glamour/tokyo_night.json"

if test (uname) != "Windows_NT"
    set -gx GPG_TTY (tty)
end

set -gx LESS_TERMCAP_mb (printf "\e[01;31m")
set -gx LESS_TERMCAP_md (printf "\e[01;31m")
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_so (printf "\e[01;44;36m")
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_us (printf "\e[00;36m")
set -gx LESS_TERMCAP_ue (printf "\e[0m")

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.poetry/bin
fish_add_path ~/.ghcup/bin
fish_add_path ~/.nix-profile/bin
fish_add_path /nix/var/nix/profiles/default/bin
fish_add_path /opt/miniconda3/bin
