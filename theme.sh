#!/bin/bash

# Install required packages
pkg install -y figlet lolcat neofetch cmatrix termux-api jq

# Create theme directory
mkdir -p ~/.deepeye && cd ~/.deepeye

# Create custom bashrc
cat << EOF > deepeye_bashrc
#----- Deep Eye Crypto Theme -----#
#- https://github.com/DeepEyeCrypto -#

# Custom Colors
CYAN='\033[1;36m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
WHITE='\033[1;37m'
NC='\033[0m'

# System Info Function
sys_info() {
    echo -e "\${CYAN}System Monitor\${NC}"
    echo -e "\${GREEN}Uptime:\${NC} \$(uptime -p)"
    echo -e "\${GREEN}CPU Load:\${NC} \$(uptime | awk -F 'load average:' '{print \$2}')"
    echo -e "\${GREEN}Memory Usage:\${NC} \$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", \$3,\$2,\$3*100/\$2 }')"
    echo -e "\${GREEN}Storage Usage:\${NC} \$(df -h / | awk 'NR==2{print \$3"/"\$2" ("\$5")"}')"
}

# Crypto Price Checker
crypto_price() {
    echo -e "\${YELLOW}Crypto Prices:\${NC}"
    curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,monero&vs_currencies=usd" | \\
    jq -r '. | to_entries[] | "\(.key | ascii_upcase): \$\(.value.usd)"' | \\
    while read -r line; do echo -e "\${GREEN}\$line\${NC}"; done
}

# Network Monitor
net_monitor() {
    echo -e "\${BLUE}Network Status:\${NC}"
    echo -e "Public IP: \${GREEN}\$(curl -s ifconfig.me)\${NC}"
    echo -e "Local IP: \${GREEN}\$(ip route get 1 | awk '{print \$7}')\${NC}"
}

# Main Interface
clear
figlet -f slant "DEEP EYE" | lolcat
figlet -f small "CRYPTO SYSTEM" | lolcat
echo -e "\${WHITE}Version 2.3.1 | Secure Terminal Active\${NC}"
echo -e "\${RED}----------------------------------------\${NC}"
sys_info
echo -e "\${RED}----------------------------------------\${NC}"
net_monitor
echo -e "\${RED}----------------------------------------\${NC}"
crypto_price
echo -e "\${RED}----------------------------------------\${NC}"

# Custom Prompt
PS1="\${CYAN}[ \${YELLOW}JARVIS \${CYAN}] \${GREEN}➔ \${NC}"
EOF

# Add to bash.bashrc
if ! grep -q "deepeye_bashrc" ~/.bashrc; then
    echo "source ~/.deepeye/deepeye_bashrc" >> ~/.bashrc
fi

# Apply theme
source ~/.deepeye/deepeye_bashrc

echo -e "\n${GREEN}Deep Eye Crypto Theme installed!${NC}"
echo -e "Restart Termux or run: source ~/.bashrc\n"
