#!/bin/bash

echo "Setting up sudoers..."
## Superuser passwordless sudo
# Get the current user
USER_NAME=$(whoami)

# Define the sudoers file path
SUDOERS_FILE="/etc/sudoers.d/${USER_NAME}_nopasswd"

# Check if the rule already exists
if [[ -f "$SUDOERS_FILE" ]]; then
  echo "✅ NOPASSWD rule already exists in $SUDOERS_FILE"
else
  echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" | sudo tee "$SUDOERS_FILE"
  chmod 0440 "$SUDOERS_FILE"
  echo "✅ NOPASSWD rule added for user '$USER_NAME'"
fi