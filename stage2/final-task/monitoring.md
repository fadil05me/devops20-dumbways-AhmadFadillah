-----
# **MONITORING**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- Deployments on top Docker

**Instructions**
- Create Basic Auth into your Prometheus
- Monitor resources for *Appserver & Gateway & Registry server*
- Create a fully working dashboard in Grafana
  - Disk
  - Memory Usage
  - CPU Usage
  - VM Network
  - Monitoring all of container resources on VM
- Grafana Alert/Prometheus Alertmanager for:
  - Send Notification to Telegram
  - CPU Usage
  - RAM Usage
  - Free Storage
  - Network I/O (NGINX Monitoring)


-----

## Setup Monitoring

Untuk installasi monitoring, saya menggunakan ansible. Untuk scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/4install_mon.yaml).


### **Adding Basic Auth**

Tambahkan script basic auth di nginx pada server gateway.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ca7d81cb-ef7a-41c8-b6a6-e1b991fc9c7b)


Setelah monitoring terdeploy dengan ansible, buka dashboard grafana di browser.

Ke connections, lalu tambahkan source dari prometheus.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ec821881-dab4-4b2e-9c45-81f30bb16fa9)



Pada bagian ```Connection```, Masukkan URL dari prometheus. Dan di bagian ```Authentication``` ganti menjadi ```Basic authentication```, lalu masukkan User dan Password yang sudah dibuat.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e98b8e23-57aa-459e-a90f-e74b176b8053)




Jika sudah Save.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ea77b30a-3eae-496c-8c32-edd2f9a87a88)


Lalu buat folder baru.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2e18f50-18f9-49e1-b066-f7317bb7533f)


Buat Dashboard baru, pilih grafana.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/73e5087c-e1db-4c30-be86-03e5fab86070)


Pada data source ganti menjadi prometheus.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6be88166-38a7-4c71-8e8b-1d092b351f9c)


Ganti dari ```Builder``` ke ```Code```, Selanjutnya masukkan query dan sesuaikan designnya.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/693211b3-077c-4781-8668-0dabba72fd35)


Jika sudah ```Save``` dan ```Apply```.


Buat Row baru dengan jumlah total dari server yang dimiliki. Klik ```Add``` -> ```Row```


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/22380f81-27d3-43b4-9d10-d40efd457793)


Untuk mengubah nama Row, Klik pada icon Gerigi disamping kanan nama Row.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6c4675c-d6d2-4b91-9048-970ea1d2327d)


Untuk Disk usage gunakan tipe ```Gauge``` dan ubah settingan seperti ini:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed9842db-5fed-4dba-93fe-28881f12b892)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c65bd0a-c022-4a9e-9382-1ac37b7c23ab)



Tambahkan ```Visualization``` baru untuk semua server. Jika sudah, hasilnya seperti ini:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bbcea647-55bd-463a-83e5-33d9ebc7bd0e)



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

### Membuat bot Telegram

Buka telegram dan cari BotFather ```@BotFather``` lalu klik Start.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3263d337-ae9e-4afa-aaa4-99624f99a637)


Selanjutnya kirim ```/newbot```, dan ikuti petunjuk selanjutnya. Nanti akan mendapatkan ```Access Token```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3e51d244-f98e-49d9-ad6b-1dc0c8a77efe)


Cari lagi bot dengan nama Get My ID ```@getmyid_bot``` lalu klik Start. Simpan ```Chat ID``` dan ```Access Token``` tadi


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f174bbd5-46d5-4da3-975c-c8e6025efe8f)


Ke ```Grafana``` -> ```Contact Points``` -> ```Add contact point``` -> Integration pilih ```Telegram``` -> Masukkan ```Access Token``` dan ```Chat ID``` tadi.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1d289a2a-f135-49a0-819c-a8196a917849)



Pada bagian ```Optional Telegram Settings```, isi Message:
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



Lakukan test dengan mengklik ```Test``` -> ```Send test notification```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7d1cb4e7-23be-4565-a497-fcb54b9cef31)



Jika sudah benar, Klik ```Save contact point```.


Selanjutnya ke ```Notification Policies```. Pada default policy klik tanda ```...``` -> ```Edit```.


Ganti ```Default contact point``` menjadi contanc point yang barusan dibuat yaitu ```Telegram Notif```.


Pada ```Timing Options``` sesuaikan dengan kebutuhan.


Jika sudah klik ```Update default policy```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bc6f7878-7a5a-4654-8f02-4c7d4107210f)



Selanjutnya buat ```Alert Rules```.


Masukkan Query yang sama dengan CPU Usage.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6c2da929-7b9e-48b5-880f-055245f823fe)



Pada bagian expressions, ganti input menjadi A dan IS ABOVE value menjadi 70. Jadi tiap cpu usage melebihi 70%, maka akan melakukan alerting.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/671c1cf8-fe59-45e6-9eb6-c5b6b3e5bbe0)


Buat ```new folder``` dan ```new evaluation group```


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d1a58a5b-a88c-444e-bfe4-cab5f475319e)


Pada contact point pilih ```Telegram Notif```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/28905928-3bdb-45fb-827e-aa48c0aa88a8)


Pada bagian ```Annotation``` isi sesuai keperluan.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7e367c99-82cf-41d6-a68a-f13f5f5e8552)



## Hasil Notif


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c79d0530-f068-4e51-905e-120301e842b3)



Buat juga untuk ```RAM Usage```, ```Free Storage```, dan ```Network I/O (NGINX Monitoring)```.



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7785e6bb-dc9d-4da1-aacd-6213136657bb)
