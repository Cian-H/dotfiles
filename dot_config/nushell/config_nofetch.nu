# Imports of custom modules from init to help keep my config file clean
use default_config.nu
use init.nu *
# Combine config records, merging onto nushell's built-in defaults
$env.config = (
    $env.config | merge (default_config) | merge (theme) | merge (my_config)
)
# Initialise the plugins
source nu_scripts.nu
# Finally, initialise the completion plugins
source integrations/atuin.nu
source integrations/rbw.nu
