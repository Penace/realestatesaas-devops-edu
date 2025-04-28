# 01 – Create Web Server VM

## Objective
Create the first Virtual Machine that will serve as the **Web Server** for the RealEstateSaaS infrastructure.

We will install Ubuntu Server manually to practice core Linux installation and configuration skills.

## VM Settings
- **Name:** `realestatesaas-web`
- **OS Version:** Ubuntu Server 24.04.2 LTS
- **Architecture:** x86_64 (Intel/AMD CPUs) or ARM64 (Apple Silicon)
- **CPU:** 2 cores
- **RAM:** 2 GB
- **Disk Size:** 30 GB

## Setup Steps
1. Open your virtualization software (VirtualBox, VMware, or equivalent).
2. Create a new Virtual Machine:
   - Select **Ubuntu (64-bit)** or **Ubuntu ARM64** depending on your CPU.
   - Allocate the CPU, RAM, and Disk space according to the settings above.
3. Attach the Ubuntu Server ISO as the boot media.
   - ⚡ *Note:*  
     You must select the correct version for your CPU architecture.  
     → **(Intel/AMD = Standard ISO)**  
     → **(Mac M1/M2 = ARM ISO)**
4. Boot the VM and follow the installation process:
   - Set your hostname (e.g., `realestatesaas-web`).
   - Create a user account (`deployer`) and password.
   - Enable **OpenSSH Server** during installation.
5. Complete installation and reboot into the VM.
6. Confirm that you can log in to your VM's terminal.

## Notes
- Don't select any additional package or `Featured server snaps`
- Ensure you can login with your `deployer` user locally.
- Remote SSH will be configured in the next phase.
- Use only **Long Term Support (LTS)** releases for server stability.

---

## Additional Resources

- [Ubuntu Server Download Page (x86_64)](https://ubuntu.com/download/server)
- [Ubuntu Server ARM Download Page (ARM64)](https://ubuntu.com/download/server/arm)
- [🛠️ Step-by-Step Ubuntu Server Installation Checklist](../vm-setup/ubuntu_server_installation_checklist.md)
- [🚑 Troubleshooting OpenSSH Server Not Installed](../errors-and-troubleshooting/troubleshooting_ssh_server_missing.md)

⚡ **Tip:** Always verify you are downloading the LTS version and the correct architecture for your machine.

---

✅ Once the VM is installed, booted, and accessible through its local shell, this phase is complete, proceed to Static IP configuration.