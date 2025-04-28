# SSH Connection Refused – Troubleshooting

## Problem
Trying to SSH into VM fails with:
`ssh: connect to host <IP> port 22: Connection refused`

---

## Possible Causes

- OpenSSH Server not installed.
- Firewall blocking SSH port (22).
- Static IP misconfigured — wrong IP address.
- SSH service not running.

---

## Solutions

1. **Verify OpenSSH is Installed**

Login locally to the VM and check:
```bash
systemctl status ssh
```

If missing, install:
```bash
sudo apt update
sudo apt install openssh-server
```

2. **Check Firewall Rules**

Ensure SSH port is open:
```bash
sudo ufw allow OpenSSH
sudo ufw reload
```

3. **Confirm Static IP and Gateway**

Use:
```bash
ip a
ip route
```

Optionally: [Network Info Exercise](quick_network_check_script) 
Make sure IP is correct and reachable.

4. **Restart SSH Service**

```bash
sudo systemctl restart ssh
```

---

✅ After correcting the issue, retry SSH from your desktop.

```bash
ssh deployer@<static-ip-address>
```