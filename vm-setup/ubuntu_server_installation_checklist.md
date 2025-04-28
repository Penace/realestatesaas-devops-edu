# Ubuntu Server Installation Checklist

## Objective
Install and configure a clean Ubuntu Server instance for use in RealEstateSaaS infrastructure.

✅ This checklist is intended for **every VM**: Web Server, API Server, Database Server.

---

# Pre-Installation Preparation

- [ ] Download Ubuntu Server 24.04.2 LTS ISO.
- [ ] Verify you have a NAT network configured for internet access.
- [ ] Verify you have a Host-Only network if inter-VM communication is needed.
- [ ] Create the VM in your hypervisor (VirtualBox, VMware).

---

# Installation Steps

1. **Start VM and boot into Ubuntu Installer.**
2. **Keyboard Layout**: Choose appropriate layout.
3. **Network Setup**:
    - Let DHCP assign initial IP.
    - You will set Static IP later manually (do not configure static during install).

4. **Profile Setup**:
    - Your Name: (e.g., `Deployer`)
    - Server Name: (hostname: `realestatesaas-web`, `realestatesaas-api`, `realestatesaas-db`)
    - Username: `deployer`
    - Password: strong password

5. **SSH Setup**:
    - Enable OpenSSH server during installation.
    - No need to import SSH keys at install time.

6. **Storage Setup**:
    - Use the entire disk.
    - No need for custom partitioning unless you want LVM or ZFS (not required for our course).

7. **Featured Server Snaps**:
    - **DO NOT** select any additional packages or snaps.
    - Keep the system minimal for manual configuration later.

8. **Install System and Reboot**:
    - Confirm install summary.
    - Eject ISO and reboot.

✅ After reboot, login as `deployer`.

---

# Post-Installation Configuration

## 1. Update and Upgrade the System
```bash
sudo apt update && sudo apt upgrade -y
```

✅ Keeps the system fully patched.

---

## 2. View Network Details

Get IP address and gateway:
```bash
ip a
ip route
```

✅ Confirm current IP from DHCP.

Optionally: [Network Info Script Exercise](../exercises/quick_network_check_script)

---

## 3. Set Static IP Manually (After Install)

- Check existing Netplan files:
```bash
ls /etc/netplan/
```

- Edit existing YAML or create your own `01-static-ip-config.yaml`:
```bash
sudo nano /etc/netplan/01-static-ip-config.yaml
```

Example static IP configuration:
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

> ⚡ Important:
> - Only configure each interface **once** across all YAMLs.
> - If `50-cloud-init.yaml` configures the interface already, you must **either** edit it or **disable** it when creating a new YAML.
> - Always use correct gateway (only one default gateway).

✅ After editing:

Apply Netplan:
```bash
sudo netplan apply
```

Test network:
```bash
ping 8.8.8.8
```

✅ Internet access must work.

---

# Additional Resources

- [🛠️ Set Static IP Guide](../vm-setup/04_set_static_ip.md)
- [🧠 Quick Network Check Script Exercise](../exercises/quick_network_check_script.md)
- [🚑 Static IP Not Working Troubleshooting](../errors-and-troubleshooting/static_ip_not_working.md)
- [NetInfo CLI Tool - Cross-Platform](../scripts/netinfo.sh)

---