#!/bin/bash

# Save the current PS1 to restore later (optional)
OLD_PS1="$PS1"

# Set a new prompt style
export PS1="MyCustomPrompt> "

# Execute some commands or functions
echo "This is a command executed with the custom prompt."

# Restore the original prompt (optional)
export PS1="$OLD_PS1"
