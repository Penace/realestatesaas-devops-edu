# Set Static IP Script – Exercise

## Objective
Create a Bash script to automatically configure a Static IP address on Ubuntu Server systems using Netplan.

---

## Instructions (Or try it yourself)

1. Create a new script file:
```bash
nano set-static-ip.sh
```

2. Paste the following starter template:
```script
#!/bin/bash
# Set Static IP Configuration Script

INTERFACE="$1"
STATIC_IP="$2"
GATEWAY="$3"
DNS1="$4"
DNS2="$5"

if [[ -z "$INTERFACE || -z "$STATIC_IP" || -z "$GATEWAY" || -z "$DNS1" ]]; then
echo "Usage: ./set-static-ip.sh <interface> <static_ip/cidr> <gateway> <dns1> [dns2]"
exit 1
fi

echo "Configuring static IP for $INTERFACE..."

# Backup old netplan file
sudo cp /etc/netplan/*.yaml /etc/netplan/backup-config.yaml

#Write new Netplan config
sudo tee /etc/netplan/01-static-ip-config.yaml > /dev/null <<EOF
network:
  version: 2
  ethernets:
    $INTERFACE:
      dhcp4: no
      addresses: [$STATIC_IP]
      gateway4: $GATEWAY
      nameservers:
        addresses: [$DNS1, $DNS2]
EOF

# Apply changes
sudo netplan apply

echo "Static IP configuration applied successfully!"
```

---
## How to Use

Make the script executable:
```bash
chmod +x set-static-ip.sh 
```

Run the script with your desired values:
```bash
sudo ./set-static-ip.sh ens160 192.168.32.11/24 192.168.32.2 8.8.8.8 1.1.1.1
```

✅ This will:
- Backup the old Netplan file.
- Create a new static configuration.
- Apply it immediately.

---
## Requirements

- Must run as sudo or root
- Must know your correct network interface name. [Network Info Script](quick_network_check_script.md)
- Test after applying with:
	- ip a or ./netinfo.sh
	- ping 8.8.8.8
---
> ⚡ Tip:
> Always manually check /etc/netplan/01-static-ip-config.yaml after running the script if troubleshooting is needed.

---
## Important Notes

- Only **one** YAML file should configure each network interface (ens160).
-  If a YAML (e.g., 50-cloud-init.yaml) already configures the interface:
	- You must **either** edit it, 
	- **Or** disable/remove its config if you create a new 01-static-ip-config.yaml.
- Netplan **merges** all YAML files in /etc/netplan/ **alphabetically** during `netplan apply`.
✅ Always double-check with:
```bash
ls /etc/netplan/
```
---
## **⚡ Syntax Glossary** 
| **Term**         | **Meaning**                                                     |
| ---------------- | --------------------------------------------------------------- |
| chmod +x         | Make a file executable.                                         |
| sudo             | Run command as superuser (root).                                |
| tee              | Write text into a file (acts like > but shows output too).      |
| $1, $2, etc.     | Script arguments. $1 is the first argument, $2 the second, etc. |
| cp               | Copy a file (backup important configs).                         |
| netplan apply    | Apply new network configuration.                                |
| YAML addresses   | List of IP addresses (must be inside [ ] brackets).             |
| YAML gateway4    | Sets the default IPv4 gateway for your machine.                 |
| YAML nameservers | Sets the DNS servers your machine will use.                     |
✅ Study these — these basic Bash and YAML concepts are everywhere in DevOps.
