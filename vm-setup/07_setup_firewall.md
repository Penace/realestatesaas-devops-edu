# 07 – Basic Firewall Setup (`ufw`)

  

## Objective

Harden each VM with simple firewall rules using `ufw` (Uncomplicated Firewall).

  

---

  

## Setup Steps
1. Install `ufw` if missing:
```bash
sudo apt install ufw
```

2. Allow only essential services
```bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp     # HTTP for Web Server
sudo ufw allow 3000/tcp   # JSON-Server API (API Server)
# (Allow DB ports later if needed)
```

3. Enable the firewall:
```bash
sudo ufw enable
```

4. Check status:
```bash
sudo ufw status
```

✅ Firewall will now block all other ports except approved ones.