# Service Failed to Start – Troubleshooting
## Problem
Systemd service fails to start after creation. 
Error Example:
```text
Failed to start my-service.service: Unit my-service.service not found.
```
---
## Possible Causes

- Wrong paths or commands inside service file.
- Bad permissions (ExecStart not executable).
- YAML/service syntax error.
---
## Solutions

1. **Check Service File Syntax**
Open the service:
```bash
sudo nano /etc/systemd/system/<your-service>.service
```
✅ Confirm:
- Correct paths (WorkingDirectory, ExecStart)
- No typos.
2. **Permissions**
Make sure your startup script is executable:
```bash
chmod +x /path/to/startup-script.sh
```
3. **Daemon Reload and Restart**
After editing:
```bash
sudo systemctl daemon-reload
sudo systemctl restart <your-service>
```
4. **Check Logs**
See service logs:
```bash
journalctl -u <your-service>
```
✅ Logs usually show exactly what failed.
