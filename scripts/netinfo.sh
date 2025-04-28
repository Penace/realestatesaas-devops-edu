#!/bin/bash
# Penace NetInfo CLI Tool - Cross Platform Version
# Version: 2.0
# Detects Linux, macOS, Windows (basic) and adapts.

# ---- Configurable Colors ----
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ---- Detect OS ----
OS_TYPE="$(uname)"

# ---- Detect Interface ----
if [[ "$OS_TYPE" == "Linux" ]]; then
    INTERFACE=$(ip route | grep default | awk '{print $5}')
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    INTERFACE=$(route get default 2>/dev/null | grep interface | awk '{print $2}')
elif [[ "$OS_TYPE" =~ "MINGW" || "$OS_TYPE" =~ "CYGWIN" || "$OS_TYPE" =~ "MSYS" ]]; then
    echo -e "${RED}Windows detected. This script currently supports Linux and macOS.${NC}"
    exit 1
else
    echo -e "${RED}Unsupported Operating System: $OS_TYPE${NC}"
    exit 1
fi

# ---- Header ----
echo -e "${CYAN}"
echo "====================================="
echo "         Penace NetInfo CLI Tool      "
echo "          OS Detected: $OS_TYPE        "
echo "====================================="
echo -e "${NC}"

# ---- IP Address Info ----
echo -e "${YELLOW}IP Address(es) on Interface: ${GREEN}$INTERFACE${NC}"

if [[ "$OS_TYPE" == "Linux" ]]; then
    ip -4 addr show "$INTERFACE" | grep inet | awk '{print "- " $2}'
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    ipconfig getifaddr "$INTERFACE"
fi

echo ""

# ---- Public IP Address ----
echo -e "${YELLOW}Public IP Address:${NC}"
if command -v curl &> /dev/null; then
    PUBLIC_IP=$(curl -s ifconfig.me)
    echo -e "- $PUBLIC_IP"
else
    echo -e "${RED}curl not installed. Cannot fetch public IP.${NC}"
fi

echo ""

# ---- Default Gateway ----
echo -e "${YELLOW}Default Gateway:${NC}"
if [[ "$OS_TYPE" == "Linux" ]]; then
    ip route | grep default | awk '{print "- " $3}'
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    route -n get default | grep gateway | awk '{print "- " $2}'
fi
echo ""

# ---- DNS Servers ----
echo -e "${YELLOW}DNS Servers:${NC}"
if [[ "$OS_TYPE" == "Linux" ]]; then
    grep nameserver /etc/resolv.conf | awk '{print "- " $2}'
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    scutil --dns | grep nameserver | awk '{print "- " $3}'
fi
echo ""

# ---- ARP Table ----
echo -e "${YELLOW}ARP Table (Local Network Devices):${NC}"
if [[ "$OS_TYPE" == "Linux" ]]; then
    ip neigh
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    arp -a
fi
echo ""

# ---- Active Network Scan (Optional on Linux) ----
if [[ "$OS_TYPE" == "Linux" ]]; then
    echo -e "${YELLOW}Scanning active IP addresses on local network...${NC}"
    if command -v arp-scan &> /dev/null; then
        sudo arp-scan --interface="$INTERFACE" --localnet
    else
        echo -e "${RED}arp-scan not installed. Skipping active scan.${NC}"
    fi
fi

# ---- Footer ----
echo -e "${CYAN}"
echo "====================================="
echo "          Scan Complete               "
echo "====================================="
echo -e "${NC}"

# ---- Ending ----
echo -e "${GREEN}Network check finished.${NC}"