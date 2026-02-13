source nu_scripts/modules/background_task/task.nu
source nu_scripts/modules/formats/from-cpuinfo.nu
source nu_scripts/modules/formats/from-dmidecode.nu
source nu_scripts/modules/formats/from-env.nu
source nu_scripts/modules/formats/to-ini.nu
source nu_scripts/modules/formats/to-number-format.nu
source nu_scripts/modules/network/sockets/sockets.nu
source nu_scripts/modules/network/ssh.nu
source nu_scripts/modules/nix/nix.nu
use nu_scripts/modules/nvim/mod.nu [
    tcd,
    nvim-lua,
    nve,
    nvc,
    nvs,
]
