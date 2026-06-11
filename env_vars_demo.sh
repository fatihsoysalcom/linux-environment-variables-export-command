#!/bin/bash

# This script demonstrates the usage of the 'export' command in Linux
# to manage environment variables.

# --- Defining and Exporting Variables ---

# Define a variable locally (not exported)
LOCAL_VAR="This is a local variable."

# Define and export a variable
# The 'export' command makes the variable available to child processes.
export MY_APP_NAME="MyAwesomeApp"
export MY_APP_VERSION="1.0.0"

# You can also export variables that are already defined
export ANOTHER_VAR="This is another exported variable."

# --- Displaying Variables ---

echo "--- Displaying Variables ---"

# Displaying a local variable (only available in the current shell)
echo "Local variable (LOCAL_VAR): $LOCAL_VAR"

# Displaying exported variables
echo "Exported variable (MY_APP_NAME): $MY_APP_NAME"
echo "Exported variable (MY_APP_VERSION): $MY_APP_VERSION"
echo "Exported variable (ANOTHER_VAR): $ANOTHER_VAR"

# Using 'printenv' to list all environment variables (including exported ones)
# This will show many system variables as well.
echo "
--- All Environment Variables (using printenv) ---"
printenv | grep MY_APP_ # Filter to show only our app variables for clarity

# --- Demonstrating Exported Variable in a Subshell ---

echo "
--- Demonstrating Exported Variable in a Subshell ---"

# Execute a command in a subshell (e.g., another bash instance)
# Exported variables are inherited by child processes.
bash -c 'echo "Inside subshell: MY_APP_NAME is $MY_APP_NAME"'

# Local variables are NOT inherited by child processes.
bash -c 'echo "Inside subshell: LOCAL_VAR is $LOCAL_VAR"' # This will be empty

# --- Unsetting Variables ---

echo "
--- Unsetting Variables ---"

# Unset an exported variable
unset MY_APP_VERSION
echo "MY_APP_VERSION has been unset."

# Verify it's gone from the current shell
echo "MY_APP_VERSION after unset: $MY_APP_VERSION"

# Verify it's gone from a new subshell
bash -c 'echo "Inside subshell after unset: MY_APP_VERSION is $MY_APP_VERSION"' # This will be empty

exit 0
