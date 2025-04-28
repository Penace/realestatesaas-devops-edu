# OpenSSH Server Missing – Troubleshooting

## Problem
SSH not working because OpenSSH Server was not installed during Ubuntu install.

---
## Solution
1. **Login Locally to the VM**
Using your VM console.
2. **Install OpenSSH Server**
```bash
sudo apt update
sudo apt install openssh-server
```
3. **Enable and Start SSH Service**
```bash
sudo systemctl enable ssh
sudo systemctl start ssh
```
4. **Allow SSH Through Firewall**
```bash
sudo ufw allow OpenSSH
sudo ufw reload
```
✅ After this, your VM should be reachable by SSH.

---
## Notes
- Always check if `ssh` service is **active**:
```bash
sudo systemctl status ssh
```
- Always open SSH port (22) on UFW if firewall is active.