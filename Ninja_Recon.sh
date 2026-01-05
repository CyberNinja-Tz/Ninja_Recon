#!/bin/bash

# ==========================================================
# TOOL: NINJA_RECON v3.0 (Professional Logging Edition)
# CODED BY: Cyber Ninja
# DESCRIPTION: Advanced Reconnaissance with Auto-Reporting
# ==========================================================

# Rangi za Msingi
RESET="\033[0m"
RED="\033[01;31m"

# Tengeneza folder la ripoti kama halipo
LOG_DIR="Ninja_Logs"
mkdir -p $LOG_DIR

# Function ya kubadilisha rangi (Color Rotation)
rotate_color() {
    colors=("\033[01;32m" "\033[01;33m" "\033[01;34m" "\033[01;35m" "\033[01;36m" "\033[01;31m")
    RANDOM_COLOR=${colors[$RANDOM % ${#colors[@]}]}
    echo -e "$RANDOM_COLOR"
}

# Function ya Maandisha ya Mbwe mbwe
ninja_type() {
    text="$1"
    delay=0.01
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# --- MAIN MENU LOOP ---
while true; do
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
    echo -e "          [>>] LOGS SAVED IN: $LOG_DIR/      [<<]            "
    echo -e "${RESET}"

    echo -e "\n$(rotate_color)[*] SELECT A TASK TO PERFORM:${RESET}\n"

    echo -e "$(rotate_color)[1]  WEB APPLICATION FIREWALL DETECTION"
    echo -e "[2]  FIND SHARED && NEW SERVERS"
    echo -e "[3]  FIND HTTP ERRORS"
    echo -e "[4]  RUNNING SERVICES (PORTS)"
    echo -e "[5]  EXTRACT EXIF DATA FROM PHOTOS"
    echo -e "[6]  ANONYMOUSLY SCAN (Proxychains + Tor)"
    echo -e "[7]  SPOOFING & DECOY SCAN"
    echo -e "[8]  EVADING FIREWALL (BLOCK ALL FIREWALL)"
    echo -e "[9]  SCANNING WITH REASONS (ADVANCED)"
    echo -e "[10] OPERATING SYSTEM DETECTION"
    echo -e "[11] TURN OFF IDS EVASION"
    echo -e "[12] TEST IF A VICTIM IS VULNERABLE TO DOS"
    echo -e "[14] IP RANGES SCANNING (SUBNET SCANNER)"
    echo -e "[0]  EXIT TOOL${RESET}"

    echo -e "\n$(rotate_color)>>>>>>>>>>>>>>>>>>> coded by Cyber Ninja >>>>>>>>>>>>>>>>>>${RESET}"
    echo -ne "$(rotate_color)ninja_recon# Select Option: ${RESET}"
    read OPTION

    # Jina la file la ripoti kulingana na muda
    REPORT="$LOG_DIR/scan_$(date +%Y%m%d_%H%M%S).txt"

    case $OPTION in
        1)
            echo -ne "Enter target domain: "
            read DOMAIN
            if [ "$DOMAIN" ]; then
                echo -e "\n--- WAF SCAN FOR $DOMAIN ---" >> $REPORT
                nmap -p80,443 --script http-waf-detect $DOMAIN | tee -a $REPORT
            fi
            read -p "Press Enter to return..."
            ;;
        2)
            echo -ne "Enter target: "
            read WEBSITE
            if [ "$WEBSITE" ]; then
                echo -e "\n--- SHARED SERVER SCAN FOR $WEBSITE ---" >> $REPORT
                nmap -p80,443 --script dns-brute $WEBSITE | tee -a $REPORT
            fi
            read -p "Press Enter to return..."
            ;;
        4)
            echo -ne "Enter target Website: "
            read TARGET_WEBSITE
            if [ "$TARGET_WEBSITE" ]; then
                echo -e "\n--- SERVICE SCAN FOR $TARGET_WEBSITE ---" >> $REPORT
                nmap -T4 -A -v $TARGET_WEBSITE | tee -a $REPORT
            fi
            read -p "Press Enter to return..."
            ;;
        10)
            echo -ne "Enter target IP: "
            read HOST_IP
            if [ "$HOST_IP" ]; then
                echo -e "\n--- OS DETECTION FOR $HOST_IP ---" >> $REPORT
                nmap -O $HOST_IP | tee -a $REPORT
            fi
            read -p "Press Enter to return..."
            ;;
        14)
            echo -ne "Enter subnet (e.g., 192.168.1): "
            read SUBNET
            if [ "$SUBNET" ]; then
                echo -e "\n--- SUBNET SCAN FOR $SUBNET.X ---" >> $REPORT
                for IP in $(seq 1 255); do
                    ping -c 1 -W 1 $SUBNET.$IP | grep "64 bytes" | tee -a $REPORT &
                done
                wait
            fi
            read -p "Press Enter to return..."
            ;;
        0)
            echo -e "\n$(rotate_color)GOODBYE NINJA. LOGS ARE SECURED.${RESET}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[!] INVALID OPTION!${RESET}"
            sleep 1
            ;;
    esac
done
