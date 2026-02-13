# Imports of custom modules from init to help keep my config file clean
use default_config.nu
use init.nu *
# Combine config records to create the final config
$env.config = (
    (default_config) | merge (theme) | merge (my_config)
)
# Initialise the plugins
source nu_scripts.nu
# initialise the completion plugins
source completions/atuin.nu
source completions/nu_scripts.nu
source completions/rbw.nu
# Finally, we run a system info fetch
sysfetch
