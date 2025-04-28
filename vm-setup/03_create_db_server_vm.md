# 03 – Create Database Server VM

## Objective
Create the third Virtual Machine that will serve as the **Database Server** for the RealEstateSaaS infrastructure.

Initially it will simulate a database (filesystem or mock data), and later can be upgraded to a real database server.

---

## VM Settings
- **Name:** `realestatesaas-db`
- **OS Version:** Ubuntu Server 24.04.2 LTS
- **CPU:** 1–2 cores
- **RAM:** 1–2 GB
- **Disk Size:** 20–30 GB

---

## Setup Steps

- Create the VM with Ubuntu Server ISO.
- Set hostname: `realestatesaas-db`
- Create user: `deployer`
- Install OpenSSH Server.
- No featured server snaps.

✅ Full Ubuntu install guide:  
- [🛠️ Ubuntu Server Installation Checklist](../vm-setup/ubuntu_server_installation_checklist.md)

---

## Post-Installation Tasks

- Set a Static IP.

Example Static IP Plan:
- Static IP: `192.168.32.12`
- Subnet: `255.255.255.0 (/24)`
- Gateway: `192.168.32.2`
- DNS Servers: `8.8.8.8`, `1.1.1.1`

✅ Static IP setup guide:  
- [🛠️ Set Static IP Guide](../vm-setup/04_set_static_ip.md)

---

## Additional Resources
- [🧠 Quick Network Check Script](quick_network_check_script.md)