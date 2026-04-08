module completions {

  # Unofficial Bitwarden CLI
  export extern rbw [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Get or set configuration options
  export extern "rbw config" [
    --help(-h)                # Print help
  ]

  # Show the values of all configuration settings
  export extern "rbw config show" [
    --help(-h)                # Print help
  ]

  # Set a configuration option
  export extern "rbw config set" [
    key: string               # Configuration key to set
    value: string             # Value to set the configuration option to
    --help(-h)                # Print help
  ]

  # Reset a configuration option to its default
  export extern "rbw config unset" [
    key: string               # Configuration key to unset
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rbw config help" [
  ]

  # Show the values of all configuration settings
  export extern "rbw config help show" [
  ]

  # Set a configuration option
  export extern "rbw config help set" [
  ]

  # Reset a configuration option to its default
  export extern "rbw config help unset" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rbw config help help" [
  ]

  # Register this device with the Bitwarden server
  export extern "rbw register" [
    --help(-h)                # Print help (see more with '--help')
  ]

  # Log in to the Bitwarden server
  export extern "rbw login" [
    --help(-h)                # Print help
  ]

  # Unlock the local Bitwarden database
  export extern "rbw unlock" [
    --help(-h)                # Print help
  ]

  # Check if the local Bitwarden database is unlocked
  export extern "rbw unlocked" [
    --help(-h)                # Print help
  ]

  # Update the local copy of the Bitwarden database
  export extern "rbw sync" [
    --help(-h)                # Print help
  ]

  # List all entries in the local Bitwarden database
  export extern "rbw list" [
    --fields: string          # Fields to display. Available options are id, name, user, folder. Multiple fields will be separated by tabs.
    --raw                     # Display output as JSON
    --help(-h)                # Print help
  ]

  # Display the password for a given entry
  export extern "rbw get" [
    needle: string            # Name, URI or UUID of the entry to display
    user?: string             # Username of the entry to display
    --folder: string          # Folder name to search in
    --ignorecase(-i)          # Ignore case
    --field(-f): string       # Field to get
    --full                    # Display the notes in addition to the password
    --raw                     # Display output as JSON
    --clipboard(-c)           # Copy result to clipboard
    --help(-h)                # Print help
  ]

  # Search for entries
  export extern "rbw search" [
    term: string              # Search term to locate entries
    --fields: string          # Fields to display. Available options are id, name, user, folder. Multiple fields will be separated by tabs.
    --folder: string          # Folder name to search in
    --raw                     # Display output as JSON
    --help(-h)                # Print help
  ]

  # Display the authenticator code for a given entry
  export extern "rbw code" [
    needle: string            # Name, URI or UUID of the entry to display
    user?: string             # Username of the entry to display
    --folder: string          # Folder name to search in
    --ignorecase(-i)          # Ignore case
    --clipboard               # Copy result to clipboard
    --help(-h)                # Print help
  ]

  # Add a new password to the database
  export extern "rbw add" [
    name: string              # Name of the password entry
    user?: string             # Username for the password entry
    --uri: string             # URI for the password entry
    --folder: string          # Folder for the password entry
    --help(-h)                # Print help (see more with '--help')
  ]

  # Generate a new password
  export extern "rbw generate" [
    len: string               # Length of the password to generate
    name?: string             # Name of the password entry
    user?: string             # Username for the password entry
    --uri: string             # URI for the password entry
    --folder: string          # Folder for the password entry
    --no-symbols              # Generate a password with no special characters
    --only-numbers            # Generate a password consisting of only numbers
    --nonconfusables          # Generate a password without visually similar characters (useful for passwords intended to be written down)
    --diceware                # Generate a password of multiple dictionary words chosen from the EFF word list. The len parameter for this option will set the number of words to generate, rather than characters.
    --help(-h)                # Print help (see more with '--help')
  ]

  # Modify an existing password
  export extern "rbw edit" [
    needle: string            # Name, URI or UUID of the entry to display
    user?: string             # Username of the entry to display
    --folder: string          # Folder name to search in
    --ignorecase(-i)          # Ignore case
    --help(-h)                # Print help (see more with '--help')
  ]

  # Remove a given entry
  export extern "rbw remove" [
    needle: string            # Name, URI or UUID of the entry to display
    user?: string             # Username of the entry to display
    --folder: string          # Folder name to search in
    --ignorecase(-i)          # Ignore case
    --help(-h)                # Print help
  ]

  # View the password history for a given entry
  export extern "rbw history" [
    needle: string            # Name, URI or UUID of the entry to display
    user?: string             # Username of the entry to display
    --folder: string          # Folder name to search in
    --ignorecase(-i)          # Ignore case
    --help(-h)                # Print help
  ]

  # Lock the password database
  export extern "rbw lock" [
    --help(-h)                # Print help
  ]

  # Remove the local copy of the password database
  export extern "rbw purge" [
    --help(-h)                # Print help
  ]

  # Terminate the background agent
  export extern "rbw stop-agent" [
    --help(-h)                # Print help
  ]

  def "nu-complete rbw gen-completions shell" [] {
    [ "bash" "zsh" "fish" "powershell" "elvish" "nushell" "fig" ]
  }

  # Generate completion script for the given shell
  export extern "rbw gen-completions" [
    shell: string@"nu-complete rbw gen-completions shell"
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rbw help" [
  ]

  # Get or set configuration options
  export extern "rbw help config" [
  ]

  # Show the values of all configuration settings
  export extern "rbw help config show" [
  ]

  # Set a configuration option
  export extern "rbw help config set" [
  ]

  # Reset a configuration option to its default
  export extern "rbw help config unset" [
  ]

  # Register this device with the Bitwarden server
  export extern "rbw help register" [
  ]

  # Log in to the Bitwarden server
  export extern "rbw help login" [
  ]

  # Unlock the local Bitwarden database
  export extern "rbw help unlock" [
  ]

  # Check if the local Bitwarden database is unlocked
  export extern "rbw help unlocked" [
  ]

  # Update the local copy of the Bitwarden database
  export extern "rbw help sync" [
  ]

  # List all entries in the local Bitwarden database
  export extern "rbw help list" [
  ]

  # Display the password for a given entry
  export extern "rbw help get" [
  ]

  # Search for entries
  export extern "rbw help search" [
  ]

  # Display the authenticator code for a given entry
  export extern "rbw help code" [
  ]

  # Add a new password to the database
  export extern "rbw help add" [
  ]

  # Generate a new password
  export extern "rbw help generate" [
  ]

  # Modify an existing password
  export extern "rbw help edit" [
  ]

  # Remove a given entry
  export extern "rbw help remove" [
  ]

  # View the password history for a given entry
  export extern "rbw help history" [
  ]

  # Lock the password database
  export extern "rbw help lock" [
  ]

  # Remove the local copy of the password database
  export extern "rbw help purge" [
  ]

  # Terminate the background agent
  export extern "rbw help stop-agent" [
  ]

  # Generate completion script for the given shell
  export extern "rbw help gen-completions" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rbw help help" [
  ]

}

export use completions *
