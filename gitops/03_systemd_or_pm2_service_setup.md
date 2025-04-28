# 03 – Manage Services with systemd or PM2

## Objective
Keep services running and restart automatically after VM reboot.

---

## systemd Service Example

Create a service file:
```bash
sudo nano /etc/systemd/system/frontend.service
```

Example content for frontend server:
```
[Unit]
Description=RealEstateSaaS Frontend
After=network.target

[Service]
WorkingDirectory=/path/to/project
ExecStart=pnpm run preview
Restart=always
User=deployer
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
```

Then:
```bash
sudo systemctl daemon-reload
sudo systemctl enable frontend
sudo systemctl start frontend
```

---
✅ API Server will have similar service (or use json-server as service.)