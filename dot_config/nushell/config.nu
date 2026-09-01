# Imports of custom modules from init to help keep my config file clean
use default_config.nu
use init.nu *
# Combine config records, merging onto nushell's built-in defaults
$env.config = (
    $env.config | merge (default_config) | merge (theme) | merge (my_config)
)
# Initialise the plugins
source nu_scripts.nu
# initialise the external integrations
source integrations/zoxide.nu
source integrations/atuin.nu
source integrations/rip.nu
# Finally, we run a system info fetch
if not (in-devenv?) {
    sysfetch
}
