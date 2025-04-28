# Quick Network Check Script – Exercise

## Objective
Learn how to write a basic Bash script that shows your VM's IP address, gateway, and scans the network for active devices. 

---

## Instructions (Or try it yourself)

1. Create a new script file:

`nano netinfo.sh`

2. Copy the following content into the file:

Script:
```script
#!/bin/bash  
echo "----- Your IP Address and Interface Info -----"  
ip -4 addr show | grep inet  

echo ""  
echo "----- Your Default Gateway -----"  
ip route | grep default  

echo ""  
echo "----- Active IP Addresses on Your Network -----"  
echo "(If 'arp-scan' is not installed, run: sudo apt install arp-scan)"  
sudo arp-scan --interface=ens160 --localnet
```

3. Make the script executable:

`chmod +x netinfo.sh`

4. Run the script:

`./netinfo.sh`

✅ This script will:
- Show your current IP address and interface.
- Show your default gateway.
- Scan your network for already active IPs (using `arp-scan`).

---

## Requirements
- `arp-scan` package (install with `sudo apt install arp-scan`)

> ⚡ Tip:  
> Always verify your interface name (`ens160`, `enp0s3`, etc.) before running the scan.

---

✅ Complete this exercise before assigning static IPs to avoid IP conflicts.

My script:
[NetInfo CLI Tool - Cross-Platform](../scripts/netinfo.sh)