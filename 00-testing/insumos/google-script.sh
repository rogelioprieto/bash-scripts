#!/usr/bin/env bash
# https://share.google/aimode/AJRPkYwz1QzdoVie2
# 2026-05-14

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script with sudo or as root." >&2
  exit 1
fi

# Define users to create (Format: "username:password:secondary_groups")
USER_LIST=(
  "alice:P@ssword123:sudo,docker"
  "bob:SecurePwd456:docker"
  "charlie:BobsSecret789:"
)

for entry in "${USER_LIST[@]}"; do
  # Split the entry into components
  IFS=":" read -r username password groups <<< "$entry"

  echo "--------------------------------------------------"
  echo "Processing user: $username"

  # Check if user already exists
  if id "$username" &>/dev/null; then
    echo "Warning: User '$username' already exists. Skipping." >&2
    continue
  fi

  # 1. Create user using high-level adduser
  if adduser --disabled-password --gecos "" "$username"; then
    
    # 2. Securely set the temporary password
    echo "$username:$password" | chpasswd
    echo "Successfully created user."

    # 3. Force password change on first login
    chage -d 0 "$username"
    echo "Password expired. User must change it upon first login."

    # 4. Add to secondary groups if specified
    if [ -n "$groups" ]; then
      IFS="," read -ra ADDR <<< "$groups"
      for group in "${ADDR[@]}"; do
        if getent group "$group" >/dev/null; then
          usermod -aG "$group" "$username"
          echo "Added $username to group: $group"
        else
          echo "Warning: Group '$group' does not exist. Skipping group assignment." >&2
        fi
      done
    fi

  else
    echo "Error: Failed to create user '$username'." >&2
  fi
done

echo "--------------------------------------------------"
echo "Batch user creation complete."

