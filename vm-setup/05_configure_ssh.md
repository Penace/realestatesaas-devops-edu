# 05 – Configure SSH Access for VMs

## Objective

Enable passwordless SSH access for easier GitOps, administration, and automation.

---
## Setup Steps

1. Generate SSH keypair on your Windows/Mac:
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
(Press Enter through all prompts.)

2. Copy your public key to each VM
```bash
ssh-copy-id deployer@192.168.32.10 # Web Server
ssh-copy-id deployer@192.168.32.11 # API Server
ssh-copy-id deployer@192.168.32.12 # DB Server
```

Important:
> Use the static IP addresses you set in the previous step.

✅ You can now SSH without entering passwords.

---

## **GitHub SSH Setup**

- Add your SSH public key to your GitHub account.
- Guide: [Adding a new SSH key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
✅ Needed for Git cloning/pulling via SSH later.

---

