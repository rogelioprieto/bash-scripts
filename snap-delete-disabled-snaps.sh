#/bin/bash
# ✍️Rogelio Prieto
# 🗓️February 2026
# 🎯️Objective: removes old revisions of snaps
# 💻️Tested: Release 24.04.4 LTS


# ⚠️ CLOSE ALL SNAPS BEFORE RUNNING THIS
# Source, based in the script: https://superuser.com/a/1330590




COUNT=$(LANG=C snap list --all | tail +2 | grep 'disabled' | wc -l)
if [ $COUNT -eq 0 ]; then
    echo "No disabled snap packages found. Your system is already clean!"
    exit 0
fi

set -eu # Reference: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html

# Show the disabled snap list
LANG=C snap list --all | grep --color=always  disabled
echo "-------"
# Ask to user
read -p "Proceed to delete ALL these disabled snap apps (Y/N)? " response
# Convert response to lowercase for easier comparison
#response=${response,,}
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

if [ "$response" = "y" ]; then
    Ensure the script is run with root privileges
    if [[ $EUID -ne 0 ]]; then
    if [ "$(id -u)" -ne 0 ]; then #0 if you're root, another (like 1000) for normal user.
        echo "Please run this script as root (use sudo)."
        exit 1
    fi
    
    echo "Starting deleting the disabled snaps..."
    LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
    echo "Deleting cache"
    sudo sh -c 'rm /var/lib/snapd/cache/*'
    echo -e "---\nDeleted complete."
else
    echo "Cancelled. None of the snap apps were deleted."
fi