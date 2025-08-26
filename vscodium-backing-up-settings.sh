#!/bin/bash
#august/2025
#source:
#https://loopedline.com/post/backing-up-vs-code-settings-and-extensions-with-a-bash-script/

########################################################
## VS Codium Settings and Extensions backup/sync script
## Based on a script by Loupeznik (https://github.com/Loupeznik), which can be found at https://github.com/Loupeznik/utils/blob/master/backup_utils/vscodium-backup.sh
## Script prints all installed VS Code extensions into a txt file and backs up settings and keybindings config files.
########################################################


# VARIABLES
#vscodium_settings_directory="/home/$USER/.config/Code/User"
vscodium_settings_directory="/home/$USER/.config/VSCodium/User"
backup_top_directory="/home/$USER/backups/"
backup_instance_directory="vscodium-configuration-$(date +%Y-%m-%d)"

backup_filename_for_settings="vscodium-settings-archive"
backup_filename_for_extensions="vscodium-extensions-list.txt"


# VARIABLES, constructed
backup_output_directory=$backup_top_directory$backup_instance_directory


# FUNCTION
# Provides contextual output
script_info() {
	echo
	echo
	
	echo
	echo
	echo =============================================================
	echo ==================== script info - START ====================
	echo
	echo "Executing $BASH_SOURCE"
	echo
	echo "VS Code Settings and Extensions backup script"
	echo
	echo "This script will output backup files to $backup_output_directory"
	echo
	echo ===================== script info - END =====================
	echo =============================================================
	echo
	echo
}


# FUNCTION
# Tests for existing backup directory.  Prompts user if existing directory found.  Otherwise creates new backup directory.
create_backup_instance_directory() {

	echo "[GENERAL] Setting up output folder."

	if [ -d $backup_output_directory ]; then
		echo
		echo "[GENERAL] The directory $backup_output_directory already exists."
		echo "[GENERAL] DO YOU WISH TO PERMANENTLY DELETE IT? - Press y to continue, any other key to exit."
		echo
		while : ; do
			read -n 1 k <&1
		if [[ $k = y ]]; then
			echo ""
			echo "[GENERAL] Deleting the existing $backup_output_directory and creating a new directory with that name."
			rm -rf $backup_output_directory
			break
		else
			echo
			echo "[GENERAL] Exiting"
			echo
			exit 0
		fi
		done
	fi

	mkdir $backup_output_directory

}


# FUNCTION
# Creates backups of VSCodium (VS Codium) settings files.
backup_settings_files() {
	
	echo
	echo "[SETTINGS] Backing up your config files."
	
	if [ ! -f $vscodium_settings_directory/keybindings.json ]; then
		echo "[SETTINGS] Backing up settings.json file."
		echo "[SETTINGS] Keybindings config file not found."
		tar -czf $backup_output_directory/$backup_filename_for_settings.tar.gz -C $vscodium_settings_directory settings.json snippets
	else
		echo "[SETTINGS] Backing up settings.json file."
		echo "[SETTINGS] Backing up keybindings.json file."
		tar -czf $backup_output_directory/$backup_filename_for_settings.tar.gz -C $vscodium_settings_directory settings.json keybindings.json snippets
	fi

}


# FUNCTION
# Creates a list of installed Visual Studio Code (VS Code) extensions.
create_list_of_extensions() {

	echo
	echo "[EXTENSIONS] Exporting your extensions."
	codium --list-extensions | xargs -L 1 echo codium --install-extension > $backup_output_directory/$backup_filename_for_extensions
	
	echo
	echo "[GENERAL] Backup complete."
	echo

}


# MAIN program flow
script_info
create_backup_instance_directory
backup_settings_files
create_list_of_extensions
