# 01 – Git Basics: Init, Clone, Connect to GitHub
## Objective
Prepare each VM for Git-based deployment workflows.

---

## Git Setup

1. Install Git:
```bash
sudo apt install git
```

2. Configure Git:
```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

---

## Clone Repositories

On each VM:
- Web Server:
```bash
git clone git@github.com:yourgithub/realestatesaas-frontend.git
```

- API Server:
```bash
git clone git@github.com:yourgithub/realestatesaas-backend.git
```

✅ SSH connection must work — see [Configure SSH Access](../vm-setup/05_configure_ssh.md).