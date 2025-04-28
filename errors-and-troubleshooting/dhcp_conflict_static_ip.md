# DHCP Conflict with Static IP – Troubleshooting

## Problem
After setting a static IP manually, the VM still shows two IP addresses or networking behaves strangely.

Symptoms:
- `ip a` shows two IP addresses on the same interface.
- Netplan or networking tools report device errors.
- Internet sometimes works, sometimes breaks.
- arp-scan errors like "no such device".

---

## Root Cause

- DHCP was **still enabled** (`dhcp4: true`) on the interface.
- Static IP was manually assigned at the same time.
- Result: Interface tries to maintain both DHCP and static IP at once.

---

## How to Detect

1. Check current IPs:
```bash
ip a
```

✅ If you see two `inet` lines for the same interface → problem detected.

2. Check Netplan YAML:
```bash
sudo nano /etc/netplan/*.yaml
```

Look for this mistake:
```yaml
dhcp4: true
addresses:
  - 192.168.32.12/24
```

✅ DHCP must be **disabled** (`dhcp4: no`) when using static IP.

---

## How to Fix

1. Edit Netplan YAML.

Example corrected config:
```yaml
network:
  version: 2
  ethernets:
    ens160:
      dhcp4: no
      addresses:
        - 192.168.32.12/24
      gateway4: 192.168.32.2
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

2. Apply Netplan:
```bash
sudo netplan apply
```

3. Verify:
```bash
ip a
```
✅ Only your static IP should appear now.

✅ Network should behave normally.

---

## Important Notes

- Never mix DHCP and Static IP on the same interface.
- Always **disable** DHCP explicitly when setting static IP.
- If unsure, **backup old YAML files** before editing.

---
## Additional Resources:
- [Static IP Configuration Script Exercise](../exercises/set_static_ip_script)
- [VM Static IP Guide](../vm-setup/04_set_static_ip)