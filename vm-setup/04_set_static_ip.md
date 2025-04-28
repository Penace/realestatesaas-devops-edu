# 04 – Set Static IP for Web Server VM

## Objective
Manually configure a static IP address for the Web Server VM to ensure consistent network communication across your infrastructure.

## Network Interface Detected
Based on `ip a`, the primary interface is:
- Example: `ens160`
(You may have a different name. Always check using `ip a`.)
---
## Static IP Plan
Example Static IP Plan for Web Server:
- Static IP: `192.168.32.10`
- Subnet: `255.255.255.0 (/24)`
- Gateway: `192.168.32.1`
- DNS Servers: `8.8.8.8`, `1.1.1.1`

> ⚡ **Important:**
> Always match your IP subnet to your NAT/Host-Only network setup.

---

## Step-by-Step Static IP Configuration

1. View current network info:
- Show IP address: `ip a`
- Show default gateway: `ip route`
- Optionally: [🧠 Quick Network Check Script Exercise](../exercises/quick_network_check_script.md)

2. Choose a free IP address.
- Ping an IP before assigning it: `ping 192.168.32.10`
- If no response → safe to use.

3. Check existing Netplan files:
- List available files: `ls /etc/netplan/`
- Edit the correct YAML:
  - `sudo nano /etc/netplan/*.yaml`
  - If editing an existing file (e.g., `50-cloud-init.yaml`), modify it carefully.
  - Alternatively, create a clean new `01-static-ip-config.yaml` if preferred.

4. Update the YAML file (example):
```yaml
network:
  version: 2
  ethernets:
    ens160:
      dhcp4: no 
      addresses:
      - 192.168.32.10/24
      gateway4: 192.168.32.2
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

> **⚠ Important:**
> - YAML is indentation-sensitive (**use spaces only**).
> - **Match** your detected interface name (`ens160`, `enp0s3`, etc.)
> - Ensure you use the correct gateway IP address. (**Only one default gateway should exist**.)
> - Each VM must have a **unique static IP**.

5. Apply new configuration:
	- `sudo netplan apply`

6. Verify:
	- `ip a` → Static IP set correctly
	- `ping 8.8.8.8` → Internet connectivity test
	- Or run network info script from [exercise](../exercises/quick_network_check_script).

---
## Post-Configuration Checklist
- [ ] Confirm static IP is set (`ip a`)
- [ ] Confirm you can ping outside (`ping 8.8.8.8`)
- [ ] Confirm VM reachable from your host if needed

✅ Once confirmed, your Web Server VM is ready for SSH setup.

---

## Troubleshooting
If network fails after applying Netplan:
- `sudo netplan try` → Allows temporary application with auto-revert on failure.
- Fix YAML errors if needed.

See also: [Static IP Not Working Troubleshooting](../errors-and-troubleshooting/static_ip_not_working.md)

---

## Additional Resources

- [🛠️ Full Ubuntu Server Installation Checklist](../vm-setup/ubuntu_server_installation_checklist.md)
- [🧠 Quick Network Check Script Exercise](quick_network_check_script.md)
- [🚑 Static IP Not Working Troubleshooting](../errors-and-troubleshooting/static_ip_not_working.md)
- [📋NetInfo CLI Tool - Cross Platform Networking Script](../scripts/netinfo.sh)