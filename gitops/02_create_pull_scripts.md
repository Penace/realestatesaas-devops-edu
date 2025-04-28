# 02 – Create Git Pull and Deploy Scripts
## Objective

Automate pulling latest code and restarting services on VMs.

  

---

  

## Sample Pull Script (`pull-latest.sh`)

```bash

#!/bin/bash

cd /path/to/project

git pull

npm install

npm run build   # For frontend

# Or restart API server if backend
```
---
## Setup

1. Create the script inside your project folder
2. Make executable:
```bash
chmod +x pull-latest.sh
```

3. (Optional) Schedule with cron or run manually after updates.