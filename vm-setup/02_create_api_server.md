# 02 – Create API Server VM

## Objective
Create the second Virtual Machine that will serve the **API Server** for the RealEstateSaaS infrastructure.

This machine will host the backend API (initially using `json-server`), and later can be upgraded to a real backend.

---

## VM Settings
- **Name:** `realestatesaas-api`
- **OS Version:** Ubuntu Server 24.04.2 LTS
- **Architecture:** x86_64 (or ARM64 for Mac users)
- **CPU:** 2 cores
- **RAM:** 2 GB
- **Disk Size:** 20–30 GB

✅ This mirrors the Web Server VM setup, ensuring consistent architecture.

---

## Setup Steps

1. Create a new Virtual Machine.
2. Attach the Ubuntu Server ISO.
3. Boot into the installer.
4. Install Ubuntu Server:
   - Set hostname: `realestatesaas-api`
   - Create user: `deployer`
   - Install OpenSSH Server
   - No need to install any featured snaps.

✅ For detailed steps, see:
- [🛠️ Full Ubuntu Server Installation Checklist](../vm-setup/ubuntu_server_installation_checklist.md)

---

## Post-Installation Tasks

After Ubuntu installation:

- [ ] Set a Static IP on the Host-Only Adapter.

  - Use `ip a` and `ip route` to find your interface and gateway.
  - Configure static IP manually via Netplan.

  > Example Static IP Plan:
  > - Static IP: `192.168.32.11`
  > - Subnet: `255.255.255.0 (/24)`
  > - Gateway: `192.168.32.2`
  > - DNS Servers: `8.8.8.8`, `1.1.1.1`
  
- [ ] Verify network:
  - `ip a`
  - `ping 8.8.8.8`
  - (Optional) Use [🧠 Quick Network Check Script](quick_network_check_script.md)

✅ For detailed static IP instructions, see:
- [🛠️ Set Static IP Guide](../vm-setup/04_set_static_ip.md)

---

## Optional

- Install VMware Tools (open-vm-tools) or VirtualBox Guest Additions.
- Update your system:
  `sudo apt update && sudo apt upgrade -y`

---

## **Additional Resources**

- [🛠️ Ubuntu Server Installation Checklist](../vm-setup/ubuntu_server_installation_checklist.md)
    
- [🛠️ Static IP Setup Guide](../vm-setup/04_set_static_ip.md)
    
- [🧠 Quick Network Check Script Exercise](quick_network_check_script.md)

---