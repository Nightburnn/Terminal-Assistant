terminal_assistant() {
    HOUR=$(date +"%H")
    if [ $HOUR -lt 12 ]; then
        GREETING="Good morning, Night"
    elif [ $HOUR -lt 18 ]; then
        GREETING="Good afternoon, Night"
    else
        GREETING="Good evening, Night"
    fi

    echo -e "\n${GREETING}! It's currently $(date +"%I:%M %p")."
    echo -e "I am your terminal assistant.\n"

    while true; do
        PS3="What would you like to do today? Select an option: "
        options=(
            "Create Directory"
            "Create File"
            "List Files"
            "Check Disk Usage"
            "Weather Update"
            "System Stats"
            "Search for File/Directory"
            "Motivational Quote"
            "Git Shortcuts"
            "Network Info"
            "Automated Backup"
            "Clear Logs"
            "Check Internet Speed"
            "Check Currency Value (USD to NGN)"
            "Shutdown/Restart"
            "Exit"
        )
        select opt in "${options[@]}"; do
            case $opt in
               "Create Directory")
    read -p "Enter directory name: " dir_name
    if mkdir -p "$dir_name"; then
        echo -e "\nDirectory '$dir_name' created successfully."
        echo "Switching to '$dir_name'..."
        cd "$dir_name" || exit
        return  # Exit the script
    else
        echo -e "\nFailed to create directory.\n"
    fi
    break
    ;;

"Create File")
    read -p "Enter file name (with extension): " file_name
    echo -e "\nChoose an option:"
    echo "1. Open file for writing now"
    echo "2. Just create an empty file"
    read -p "Your choice: " file_choice
    case $file_choice in
        1)
            echo -e "\nCreating and opening file '$file_name' for editing..."
            cat > "$file_name"
            ;;
        2)
            if touch "$file_name"; then
                echo -e "\nFile '$file_name' created successfully."
            else
                echo -e "\nFailed to create file."
            fi
            ;;
        *)
            echo -e "\nInvalid option."
            ;;
    esac
    return  # Exit the script
    ;;



                "List Files")
                    echo -e "\nHere are the files in $(pwd):"
                    ls 
                    echo
                    break
                    ;;

                "Check Disk Usage")
                    echo -e "\nDisk Usage:"
                    df -h
                    echo
                    break
                    ;;

                "Weather Update")
                    read -p "Enter location: " location
                    result=$(curl -s "http://wttr.in/${location}?format=3")
                    if [[ -z "$result" || $result == *"Unknown location"* ]]; then
                        echo -e "\nWeather data for '$location' is not available.\n"
                    else
                        echo -e "\n$result\n"
                    fi
                    break
                    ;;

                "System Stats")
                    echo -e "\nCPU Usage:"
                    top -bn1 | grep "Cpu(s)"
                    echo -e "\nMemory Usage:"
                    free -h
                    echo -e "\nUptime:"
                    uptime
                    echo
                    break
                    ;;

               "Search for File/Directory")
    read -p "Enter name to search (file or directory): " search_name
    echo "Searching for '$search_name' in your home directory..."
    # Exclude unnecessary directories like .local and node_modules
    result=$(find ~ -name "$search_name" \
        -not -path "*/.local/*" \
        -not -path "*/node_modules/*" 2>/dev/null)
    if [ -z "$result" ]; then
        echo -e "\nNo file or directory named '$search_name' found in your home directory.\n"
    else
        echo -e "\nFound the following matches:\n$result\n"
    fi
    break
    ;;

                "Motivational Quote")
                    echo -e "\nHere's a motivational quote for you:"
                    curl -s https://zenquotes.io/api/random | jq -r '.[0].q + " -" + .[0].a'
                    echo
                    break
                    ;;

                "Git Shortcuts")
                    echo -e "\n1. Initialize Git Repository"
                    echo "2. Clone Repository"
                    echo "3. Commit Changes"
                    read -p "Choose an option: " git_opt
                    case $git_opt in
                        1) git init && echo -e "\nGit repository initialized.\n" ;;
                        2) read -p "Enter repository URL: " repo_url
                           git clone "$repo_url" && echo -e "\nRepository cloned.\n" ;;
                        3) read -p "Enter commit message: " commit_msg
                           git add . && git commit -m "$commit_msg" && echo -e "\nChanges committed.\n" ;;
                        *) echo -e "\nInvalid option.\n" ;;
                    esac
                    break
                    ;;

                "Network Info")
                    echo -e "\nPublic IP: $(curl -s ifconfig.me)"
                    echo "Local IP: $(hostname -I | awk '{print $1}')"
                    echo -e "\nActive Network Connections:"
                    netstat -tuln
                    echo
                    break
                    ;;

                "Automated Backup")
                    read -p "Enter source directory to back up: " source_dir
                    read -p "Enter destination directory: " dest_dir
                    if rsync -av --delete "$source_dir" "$dest_dir"; then
                        echo -e "\nBackup completed successfully.\n"
                    else
                        echo -e "\nBackup failed. Check your paths.\n"
                    fi
                    break
                    ;;


                "Clear Logs")
                    echo -e "\nClearing system logs..."
                    sudo rm -rf /var/log/* ~/.cache/*
                    echo -e "\nLogs cleared.\n"
                    break
                    ;;

                "Check Internet Speed")
                    if command -v speedtest-cli > /dev/null; then
                        echo
                        speedtest-cli
                        echo
                    else
                        echo -e "\nPlease install speedtest-cli to use this feature.\n"
                    fi
                    break
                    ;;

                "Check Currency Value (USD to NGN)")
                    exchange_rate=$(curl -s "https://api.exchangerate-api.com/v4/latest/USD" | jq -r '.rates.NGN')
                    if [[ -z "$exchange_rate" ]]; then
                        echo -e "\nFailed to fetch currency exchange rate.\n"
                    else
                        echo -e "\n1 USD = $exchange_rate NGN\n"
                    fi
                    break
                    ;;

                "Shutdown/Restart")
                    echo -e "\n1. Shutdown"
                    echo "2. Restart"
                    read -p "Choose an option: " power_opt
                    case $power_opt in
                        1) echo -e "\nShutting down..."
                           sudo shutdown now || echo -e "\nFailed to shut down. Ensure your system uses systemd and you have the necessary permissions.\n"
                           ;;
                        2) echo -e "\nRestarting..."
                           sudo reboot || echo -e "\nFailed to restart. Ensure your system uses systemd and you have the necessary permissions.\n"
                           ;;
                        *) echo -e "\nInvalid option.\n" ;;
                    esac
                    break
                    ;;

                "Exit")
                    echo -e "\nUnderstood. Have a productive day, Night!\n"
                    return
                    ;;

                *)
                    echo -e "\nInvalid option. Please try again.\n"
                    ;;
            esac
        done
    done
}

terminal_assistant
