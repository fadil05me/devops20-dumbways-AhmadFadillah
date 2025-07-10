# MONITORING

## TASK

**Before you start the task, please read this:**
- Capture step-by-step screenshots of the commands.
- Describe the process in your final task repository.

**Requirements**
- Deployments running on Docker

**Instructions**
- Add Basic Auth to Prometheus
- Monitor resources for *App server, Gateway, and Registry server*
- Create a fully working Grafana dashboard that includes:
  - Disk usage
  - Memory usage
  - CPU usage
  - VM network metrics
  - Monitoring of all container resources running on the VM
- Implement alerting via Grafana/Prometheus Alertmanager to:
  - Send notifications to Telegram
  - Alert on CPU usage
  - Alert on RAM usage
  - Alert on low free storage
  - Alert on Network I/O (NGINX monitoring)

---

## Setup Monitoring

For the monitoring installation, I used Ansible.  
The script is available here: [4install_mon.yaml](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/4install_mon.yaml).


### Adding Basic Auth

Add the Basic Auth snippet into NGINX on the gateway server:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ca7d81cb-ef7a-41c8-b6a6-e1b991fc9c7b)


After deploying the monitoring stack via Ansible, open the Grafana dashboard in a browser.  
Go to **Connections** and add Prometheus as a data source:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ec821881-dab4-4b2e-9c45-81f30bb16fa9)



Under **Connection**, enter the Prometheus URL. Under **Authentication**, select **Basic authentication**, then input the username and password you've created:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e98b8e23-57aa-459e-a90f-e74b176b8053)




Click **Save**:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ea77b30a-3eae-496c-8c32-edd2f9a87a88)


Then create a new folder in Grafana:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2e18f50-18f9-49e1-b066-f7317bb7533f)


Create a new dashboard and select the Grafana option:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/73e5087c-e1db-4c30-be86-03e5fab86070)


Change the data source to Prometheus:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6be88166-38a7-4c71-8e8b-1d092b351f9c)


Switch from **Builder** to **Code**, enter your custom query, and adjust the panel design:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/693211b3-077c-4781-8668-0dabba72fd35)


Once done, click **Save** and **Apply**.

Add a new row to group panels for all servers:



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/22380f81-27d3-43b4-9d10-d40efd457793)


To rename the row, click the gear icon next to its name:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6c4675c-d6d2-4b91-9048-970ea1d2327d)


For **Disk usage**, use the **Gauge** visualization and apply the following settings:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed9842db-5fed-4dba-93fe-28881f12b892)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c65bd0a-c022-4a9e-9382-1ac37b7c23ab)



Then add a new **Visualization** panel for each server.  
When complete, the dashboard looks like this:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bbcea647-55bd-463a-83e5-33d9ebc7bd0e)


### Example PromQL Queries

Query CPU Usage
```
sum(rate(node_cpu_seconds_total{instance="52.187.151.49:9100", mode!="idle"}[15s])) by (instance)
/ count(node_cpu_seconds_total{instance="52.187.151.49:9100", mode="idle"}) by (instance) * 100
```

Query Memory Usage
```
(1 - (node_memory_MemAvailable_bytes{instance="52.187.151.49:9100"} / node_memory_MemTotal_bytes{instance="52.187.151.49:9100"})) * 100
```

Query Disk Usage
```
(1 - (node_filesystem_avail_bytes{instance="52.187.151.49:9100", mountpoint="/"} / node_filesystem_size_bytes{instance="52.187.151.49:9100", mountpoint="/"})) * 100
```

CPU Container
```
sum(rate(container_cpu_usage_seconds_total{image!="", instance="52.187.151.49:8181"}[1m])) by (name)
```

Memory Usage Container
```
sum(container_memory_usage_bytes{image!="", instance="52.187.151.49:8181"}) by (name) / 1024 / 1024
```

Network Usage
```
(sum(rate(node_network_receive_bytes_total{instance="52.187.151.49:9100", device="eth0"}[15s])) by (device, instance) + sum(rate(node_network_transmit_bytes_total{instance="52.187.151.49:9100", device="eth0"}[15s])) by (device, instance)) * 8 / 1000000
```

Nginx Container Network Usage
```
sum(rate(container_network_receive_bytes_total{name="nginx-reverse-proxy"}[1m])) + sum(rate(container_network_transmit_bytes_total{name="nginx-reverse-proxy"}[1m]))
```


## Alerting

### Creating a Telegram Bot

Open Telegram and search for **@BotFather**, then click **Start**:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3263d337-ae9e-4afa-aaa4-99624f99a637)


Send `/newbot` and follow the prompts to obtain your **Access Token**:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3e51d244-f98e-49d9-ad6b-1dc0c8a77efe)


Search **@getmyid_bot**, click **Start**, and save your **Chat ID**:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f174bbd5-46d5-4da3-975c-c8e6025efe8f)


In Grafana:
- Go to `Contact Points` → `Add contact point`
- Choose **Telegram**
- Enter your **Access Token** and **Chat ID**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1d289a2a-f135-49a0-819c-a8196a917849)



In **Optional Telegram Settings**, enter:

```
**🚨 Alert Firing 🚨**

**Alert Name:** {{ .CommonLabels.alertname }}
**Severity:** High

**Details:**
- **Instance:** {{ .CommonLabels.instance }}
- **Folder:** {{ .CommonLabels.grafana_folder }}

**Description:**
{{ .CommonAnnotations.description }}

**Summary:**
{{ .CommonAnnotations.summary }}


[View in Grafana]
https://monitoring.fadil.studentdumbways.my.id/d/bdoybug3x9hxcc/dashboard?orgId=1
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/235ba9fb-9794-4ec2-9571-069be8956b1e)



Click `Test` → `Send test notification`:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7d1cb4e7-23be-4565-a497-fcb54b9cef31)



Then click `Save contact point`.


---

### Configuring Notification Policies

Go to **Notification Policies**, edit the default policy:
- Set contact point to **Telegram Notif**
- Adjust **Timing Options** as needed
- Click `Update default policy`


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bc6f7878-7a5a-4654-8f02-4c7d4107210f)



---

### Creating Alert Rules

Add the **CPU usage** query as used in the dashboard:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6c2da929-7b9e-48b5-880f-055245f823fe)



Under **Expressions**:
- Set input to `A`
- Set condition to `IS ABOVE 70`  
→ This will trigger an alert if CPU usage exceeds 70%.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/671c1cf8-fe59-45e6-9eb6-c5b6b3e5bbe0)


Create:
- A new **folder**
- A new **evaluation group**


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d1a58a5b-a88c-444e-bfe4-cab5f475319e)


Set the **Contact Point** to `Telegram Notif`:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/28905928-3bdb-45fb-827e-aa48c0aa88a8)


In **Annotations**, fill in the relevant alert details:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7e367c99-82cf-41d6-a68a-f13f5f5e8552)


---

## Alert Test Result


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c79d0530-f068-4e51-905e-120301e842b3)



Also create alerts for:
- **RAM Usage**
- **Free Storage**
- **Network I/O** (NGINX Monitoring)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7785e6bb-dc9d-4da1-aacd-6213136657bb)
