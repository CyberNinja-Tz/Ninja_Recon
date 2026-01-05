#!/bin/bash

# ==========================================================
# TOOL: NINJA_RECON v2.0 (2026 Edition)
# CODED BY: Cyber Ninja
# DESCRIPTION: Advanced Reconnaissance Automator with Ninja Aesthetics
# ==========================================================

# Rangi za Msingi
RESET="\033[0m"

# Function ya kubadilisha rangi (Color Rotation)
rotate_color() {
    colors=("\033[01;32m" "\033[01;33m" "\033[01;34m" "\033[01;35m" "\033[01;36m" "\033[01;31m")
    RANDOM_COLOR=${colors[$RANDOM % ${#colors[@]}]}
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

# 1. BANNER YA NINJA_RECON
clear
rotate_color
echo -e "############################################################"
echo -e "#                                                          #"
echo -e "#   _   _ ___ _   _      _   ____  _____ ____ ___  _   _   #"
echo -e "#  | \ | |_ _| \ | |    | | |  _ \| ____/ ___/ _ \| \ | |  #"
echo -e "#  |  \| || ||  \| | _  | | | |_) |  _|| |  | | | |  \| |  #"
echo -e "#  | |\  || || |\  || |_| | |  _ <| |__| |__| |_| | |\  |  #"
echo -e "#  |_| \_|___|_| \_| \___/  |_| \_\_____\____\___/|_| \_|  #"
echo -e "#                                                          #"
echo -e "############################################################"
echo -e "          [>>] CODED BY CYBER NINJA - 2026 [<<]            "
echo -e "${RESET}"

sleep 1

# 2. MENU KWA MBWE MBWE
rotate_color
ninja_type "[*] INITIALIZING NINJA_RECON CORE..."
sleep 0.5
echo -e "\n$(rotate_color)[*] THIS TOOL WILL PERFORM THE FOLLOWING TASKS:${RESET}\n"

menu_items=(
    "[1]  WEB APPLICATION FIREWALL DETECTION"
    "[2]  FIND SHARED && NEW SERVERS"
    "[3]  FIND HTTP ERRORS"
    "[4]  RUNNING SERVICES (PORTS)"
    "[5]  EXTRACT EXIF DATA FROM PHOTOS"
    "[6]  ANONYMOUSLY SCAN"
    "[7]  SPOOFING & DECOY SCAN"
    "[8]  EVADING FIREWALL (BLOCK ALL FIREWALL)"
    "[9]  SCANNING WITH REASONS (ADVANCED)"
    "[10] OPERATING SYSTEM DETECTION"
    "[11] TURN OFF IDS EVASION"
    "[12] TEST IF A VICTIM IS VULNERABLE TO DOS"
    "[13] USE SCANNING METHOD TO PERFORM DOS"
    "[14] IP RANGES SCANNING (SUBNET SCANNER)"
    "[15] DNS WEB BRUTE-FORCING (COMING SOON)"
)

for item in "${menu_items[@]}"; do
    echo -e "$(rotate_color)$item${RESET}"
    sleep 0.05
done

echo -e "\n$(rotate_color)>>>>>>>>>>>>>>>>>>> coded by Cyber Ninja >>>>>>>>>>>>>>>>>>${RESET}"

# --- ANZA EXECUTION ZA TOOLS ---

echo -e "\n$(rotate_color) [1] WEB APPLICATION FIREWALL DETECTION SCANNING...${RESET}\n"
echo -ne "$(rotate_color)Enter target domain (e.g., example.com): ${RESET}"
read DOMAIN

if [ "$DOMAIN" ]; then
    nmap -p80,443 --script http-waf-detect --script-args="http-waf-detect.aggro,http-waf-detect.detectBodyChange" $DOMAIN
fi

echo -e "\n$(rotate_color) [2] FINDING SHARED && NEW SERVERS ${RESET}\n"
echo -ne "$(rotate_color)Enter victim website or press Enter to SKIP: ${RESET}"
read WEBSITE

if [ "$WEBSITE" ]; then 
    nmap -p80,443 --script dns-brute $WEBSITE
    echo -e "\n$(rotate_color) [3] FINDING HTTP ERRORS ${RESET}\n"
    nmap -p80,443 --script http-errors $WEBSITE
fi

echo -e "\n$(rotate_color) [4] FINDING RUNNING SERVICES (PORTS) ${RESET}\n"
echo -ne "$(rotate_color)Enter target Website: ${RESET}"
read TARGET_WEBSITE

if [ "$TARGET_WEBSITE" ]; then
    nmap -T4 -A -v $TARGET_WEBSITE
fi

echo -e "\n$(rotate_color) [5] EXTRACT EXIF DATA FROM PHOTOS ${RESET}\n"
echo -ne "$(rotate_color)Enter Target Website: ${RESET}"
read TARGET

if [ "$TARGET" ]; then
    nmap -p80,443 --script http-exif-spider $TARGET
fi

echo -e "\n$(rotate_color) [6] ANONYMOUSLY SCAN (PROXY DETECTION) ${RESET}\n"

if [ -e /usr/bin/proxychains ]; then
    echo -e "\033[01;32m[ ✔ ] proxychains ................[ found ]${RESET}"
else 
    echo -e "\033[01;31m[ X ] proxychains NOT FOUND! Installing...${RESET}"
    sudo apt-get install proxychains -y
fi

if [ -e /etc/tor ]; then
    echo -e "\033[01;32m[ ✔ ] tor ................[ found ]${RESET}"
else 
    echo -e "\033[01;31m[ X ] tor NOT FOUND! Installing...${RESET}"
    sudo apt-get install tor -y
fi

echo -ne "$(rotate_color)Enter Target for Anonymous Scan: ${RESET}"
read TARGET_SITE
if [ "$TARGET_SITE" ]; then
    sudo proxychains nmap -sT -PN -n -sV -p 80,443,21,22 $TARGET_SITE
fi

echo -e "\n$(rotate_color) [7] SPOOFING & DECOY SCAN ${RESET}\n"
echo -ne "$(rotate_color)Enter Target and Decoy IPs (e.g., target.com 1.1.1.1,2.2.2.2): ${RESET}"
read WEB_DECOY
if [ "$WEB_DECOY" ]; then
    nmap -sS $WEB_DECOY
fi

echo -e "\n$(rotate_color) [8] EVADING FIREWALL ${RESET}\n"
read -p "Enter Target IP: " HOST
if [ "$HOST" ]; then nmap -sS -P0 $HOST; fi

echo -e "\n$(rotate_color) [10] OPERATING SYSTEM DETECTION ${RESET}\n"
read -p "Enter Target IP: " HOST_IP
if [ "$HOST_IP" ]; then nmap -O $HOST_IP; fi

echo -e "\n$(rotate_color) [14] SUBNET SCANNER ${RESET}\n"
echo -ne "$(rotate_color)Enter subnet (e.g., 192.168.1): ${RESET}"
read SUBNET
if [ "$SUBNET" ]; then
    for IP in $(seq 1 255); do
        ping -c 1 -W 1 $SUBNET.$IP | grep "64 bytes" &
    done
    wait
fi

echo -e "\n$(rotate_color)MISSION ACCOMPLISHED. SYSTEM GOING OFFLINE...${RESET}"
exit 0
