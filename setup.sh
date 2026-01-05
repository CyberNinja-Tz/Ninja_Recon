#!/bin/bash

# ==========================================================
# TOOL: NINJA_RECON SETUP (2026 Edition)
# CODED BY: Cyber Ninja
# DESCRIPTION: Automated Dependency Installer
# ==========================================================

RESET="\033[00m"

# Function ya kubadilisha rangi (Color Rotation)
rotate_color() {
    colors=("32" "33" "34" "35" "36" "31") # Kijani, Njano, Blue, Magenta, Cyan, Nyekundu
    RANDOM_COLOR="\033[01;${colors[$RANDOM % ${#colors[@]}]}m"
    echo -e "$RANDOM_COLOR"
}

# Function ya Maandisha ya Mbwe mbwe (Typewriter Effect)
ninja_type() {
    text="$1"
    delay=0.03
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

clear
# BANNER YA SETUP
echo -e "$(rotate_color)############################################################"
echo -e "#                                                          #"
echo -e "#   _   _ ___ _   _      _   ____  _____ ____ ___  _   _   #"
echo -e "#  | \ | |_ _| \ | |    | | |  _ \| ____/ ___/ _ \| \ | |  #"
echo -e "#  |  \| || ||  \| | _  | | | |_) |  _|| |  | | | |  \| |  #"
echo -e "#  | |\  || || |\  || |_| | |  _ <| |__| |__| |_| | |\  |  #"
echo -e "#  |_| \_|___|_| \_| \___/  |_| \_\_____\____\___/|_| \_|  #"
echo -e "#                                                          #"
echo -e "############################################################"
echo -e "          [>>] SYSTEM SETUP & INSTALLATION [<<]            "
echo -e "${RESET}"

# KUANZA KWA MBWE MBWE
echo -ne "$(rotate_color)"
ninja_type ">>> Welcome to Ninja_Recon setup v2.0..."
echo -ne "$(rotate_color)>>> Do you want to continue with installation? (yes/no): ${RESET}"
read YES

if [ "$YES" == "yes" ] || [ "$YES" == "y" ]; then
    echo -e "\n$(rotate_color)[+] INITIALIZING SYSTEM UPDATE... PLEASE WAIT${RESET}"
    sudo apt-get update -y && sudo apt-get upgrade -y

    echo -e "\n$(rotate_color)[+] INSTALLING CORE TOOLS (GIT, NMAP, PROXYCHAINS, TOR)${RESET}"
    
    # List ya tools za ku-install
    tools=("git" "nmap" "proxychains" "tor" "figlet")
    
    for tool in "${tools[@]}"; do
        echo -e "$(rotate_color)>>> Installing $tool...${RESET}"
        sudo apt-get install $tool -y
    done

    clear
    echo -e "$(rotate_color)"
    echo "##########################################################################"
    echo "#                                                                        #"
    ninja_type "# [✔] ALL TOOLS INSTALLED SUCCESSFULLY!                                  #"
    ninja_type "# [✔] EVERYTHING IS READY FOR RED TEAM OPERATIONS                        #"
    echo "#                                                                        #"
    echo "##########################################################################"
    
    echo -e "\n$(rotate_color)>>> To start the tool, run: ${RESET}chmod +x Ninja_Recon.sh && ./Ninja_Recon.sh"
    
    echo -e "\n$(rotate_color)----------------------------------------------------------"
    echo -e "FOLLOW ME: https://www.youtube.com/@nobodyerror-q7w2n"
    echo -e "----------------------------------------------------------${RESET}"

else
    echo -e "\n$(rotate_color)[!] INSTALLATION ABORTED BY USER. STAY SAFE NINJA!${RESET}"
fi

exit 0
