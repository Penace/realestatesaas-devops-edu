# 06 – Set Up Hostnames and Local Hosts Files

## Objective
Configure human-readable hostnames across all VMs to simplify access and deployment.

---

## Hostname Setup

Each VM should already have the correct hostname:

| VM Role | Hostname |
|:---|:---|
| Web Server | realestatesaas-web |
| API Server | realestatesaas-api |
| DB Server | realestatesaas-db |

---

## Local `/etc/hosts` File Update (optional)

On each VM, edit:
```bash
sudo nano /etc/hosts
```

Add lines:
```text
192.168.32.10 realestatesaas-web
192.168.32.11 realestatesaas-api
192.168.32.12 realestatesaas-db
```

✅ This allows you to ping VMs by name instead of IP.

---
