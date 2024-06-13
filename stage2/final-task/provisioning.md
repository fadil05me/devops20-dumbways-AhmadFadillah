-----
# Provisioning
-----

-----
## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- Local machine w/ Ansible & Terraform
- Biznet GIO NEO Lite Servers
  - Appserver - 2 CPU, 2GB RAM
  - Gateway - 1 CPU, 1GB RAM

**Instructions**
- Attach SSH keys & IP configuration to all VMs
- Server Configuration using Ansible:

[ *All Servers* ]
- Docker Engine
- Node Exporter

[ *Appserver* ]
  - git repo (dumbmerch)
  - Prometheus & Grafana

[ *Gateway* ]
  - NGINX/Apache2/Lightspeed
  - Reverse Proxy
  - Wildcard SSL Certificate 
-----


