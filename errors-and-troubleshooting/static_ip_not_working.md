# Static IP Not Working – Troubleshooting

## Problem
After setting Static IP, VM loses network or cannot reach internet.

---
## Possible Causes

- YAML syntax error (bad spacing or missing fields).
- Wrong gateway IP.
- IP conflict (another machine using same IP).
- Multiple default routes.
---  
## Solutions

1. **Check YAML File Syntax**
View the YAML:
```bash
sudo nano /etc/netplan/*.yaml
```
✅ Remember: YAML must use spaces, not tabs.

2. **Correct Gateway Address**
Verify gateway with:
```bash
ip route
```
It should match your network (e.g., `192.168.32.2`).

3. **Check for Duplicate IPs**
Ping test:
```bash
ping 192.168.32.x
```
If another machine responds, pick another IP.

4. **Only One Default Gateway**
Run:
```bash
ip route
```
✅ Only one `default via` line should exist.

5. **Reapply Netplan**
```bash
sudo netplan apply
```
If stuck, try:
```bash
sudo netplan try
```