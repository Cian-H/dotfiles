module completions {

  # rip: a safe and ergonomic alternative to rm
  export extern rip [
    ...targets: path          # Files and directories to remove
    --graveyard: path         # Directory where deleted files rest
    --decompose(-d)           # Permanently deletes the graveyard
    --seance(-s)              # Prints files that were deleted in the current directory
    --unbury(-u)              # Restore the specified files or the last file if none are specified
    --inspect(-i)             # Print some info about FILES before burying
    --force(-f)               # Non-interactive mode
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Generate shell completions file
  export extern "rip completions" [
    shell: string             # The shell to generate completions for
    --help(-h)                # Print help
  ]

  # Print the graveyard path
  export extern "rip graveyard" [
    --seance(-s)              # Get the graveyard subdirectory of the current directory
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rip help" [
  ]

  # Generate shell completions file
  export extern "rip help completions" [
  ]

  # Print the graveyard path
  export extern "rip help graveyard" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "rip help help" [
  ]

}

export use completions *
