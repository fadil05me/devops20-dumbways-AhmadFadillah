-----------------------------
# WEEK 3 - DAY 1 - TERRAFORM
-----------------------------

## Install Terraform
Untuk cara installnya bisa dilihat [DISINI](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Untuk ubuntu, cara installnya cukup dengan menjalankan command berikut:
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/47fbbe5a-0946-4a63-a2a6-94ce81e7f60f" width="70%"/>

## Buat Script Terraform Untuk Microsoft Azure

Dengan mengikuti [dokumentasi resmi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) yang ada.

Untuk scriptnya saya sudah buat, dan bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week3/Terraform).


Selanjutnya, Install Azure CLI di ubuntu dengan menjalankan command berikut atau untuk OS yang lainnya [DISINI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt):
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/347f373d-6429-4436-b54e-34988e70e1bd" width="70%"/>
<br><br><br>

Jika sudah diinstall, login ke azure dengan menjalankan command berikut:
```
az login --use-device-code
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1e5e2673-8a97-4fe0-8ade-d047e7d1a5e4" width="70%"/>
<br><br><br>


Selanjutnya pergi ke alamat tersebut dengan browser dan pastekan kodenya.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ecfb82ff-6f3a-4fb5-915a-4db6b773a1f2" width="45%"/>
<br><br><br>
Nanti akan muncul seperti ini, disini saya hanya ada 1 subscription. Jadi saya pilih no.1
<br>
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5dc5bab4-5024-4555-ab89-5107e50d8000" width="70%"/>
<br><br><br>

Jika sudah, cek apakah akunnya sudah terhubung.
```
az account show
```

Nanti hasilnya seperti ini:
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a095bb43-c63d-4c85-9baa-1ccf9cc4eeec" width="70%"/>
<br><br><br>

Selanjutnya, jalankan command berikut:
```
terraform init;
terraform plan;
```
<br>
Nanti akan muncul seperti ini:
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0204e782-6bb7-4422-abfe-1cc21e8a9b8c" width="70%"/>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/894fe463-2961-4ab6-8b13-c41d2351f6fd" width="70%"/>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/417dad94-844a-44ab-bf16-ffd28a3e36b6" width="70%"/>

<br><br><br>

Jika sudah, jalankan command:

```
terraform apply
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b9f1ff23-d79a-4731-b02f-6a4f9be126e7" width="70%"/>
<br><br><br>
Jika sukses, nanti akan muncul seperti ini:
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7ea6860f-ca6d-4327-88c8-7f1869065285" width="70%"/>
<br><br><br>
Cek di Dashboard Azure:
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6c77f613-9e8b-4e4f-94e5-3f39995925cb"/>
<br><br><br><br>

--------------------------
# WEEK 3 - DAY 2 - ANSIBLE
--------------------------

Untuk cara installnya bisa dilihat [DISINI](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu).

Untuk Ubuntu, cara installnya cukup dengan menjalankan command berikut:
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```
<br>
Disini saya sudah install Ansible:
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4e5be541-bf1f-4c47-ae2f-9c3b790e1a4c" width="70%"/><br><br>

Dan untuk scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week3/ansible).

<br>
Selanjutnya, untuk menjalankan scriptnya gunakan command berikut:
<br>

```
ansible-playbook main.yaml
```

<br>
Jika sukses nanti hasilnya seperti ini:
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/35c0062b-5239-4477-888b-fcd4bbb01aac" width="85%"/><br><br>



-------------------------------------
# WEEK 3 - DAY 3 - MONITORING SERVER
-------------------------------------

Setelah monitoring terdeploy dengan ansible, buka dashboard grafana di browser.

Ke connections, lalu tambahkan source dari prometheus.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ec821881-dab4-4b2e-9c45-81f30bb16fa9" width="75%"/><br><br>

Masukkan url dari prometheus.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/de4d9a62-3e18-4abd-bc34-8cbf03502935" width="75%"/><br><br>

Jika sudah Save.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ea77b30a-3eae-496c-8c32-edd2f9a87a88" width="75%"/><br><br>
Lalu buat folder baru.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2e18f50-18f9-49e1-b066-f7317bb7533f" width="75%"/><br><br>
Buat Dashboard baru, pilih grafana.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/73e5087c-e1db-4c30-be86-03e5fab86070" width="75%"/><br><br>
Pada data source ganti menjadi prometheus.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6be88166-38a7-4c71-8e8b-1d092b351f9c" width="30%"/><br><br>
Selanjutnya masukkan query dan sesuaikan designnya.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8f886f5b-8d30-466e-af5c-644eda4289c7" width="100%"/><br><br>
Jika sudah save.
<br><br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/beeb3a81-d56c-45be-a414-cfb8a76bbbc8" width="30%"/><br><br>

Query CPU Usage
```
sum(rate(node_cpu_seconds_total{instance="13.64.9.70:9100", mode!="idle"}[15s])) by (instance)
/ count(node_cpu_seconds_total{instance="13.64.9.70:9100", mode="idle"}) by (instance) * 100
```

Query Memory Usage
```
(1 - (node_memory_MemAvailable_bytes{instance="13.64.9.70:9100"} / node_memory_MemTotal_bytes{instance="13.64.9.70:9100"})) * 100
```

Query Disk I/O
```
100 * rate(node_disk_io_time_seconds_total{instance="13.64.9.70:9100", device="sda"}[15s])
```

Query Disk Usage
```
100 - ((node_filesystem_avail_bytes{instance="13.64.9.70:9100", mountpoint="/"} / node_filesystem_size_bytes{instance="13.64.9.70:9100", mountpoint="/"}) * 100)
```



## Alerting

CPU

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/df15a0ae-7de9-4a4e-9640-5ce031bac2c8)


MEMORY
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/720b7a39-87f6-4a7d-99bb-9a75bf8d36d5)



Notification Template

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/45e893e4-cf03-4db2-a8dc-196296800bc1" width="50%"/><br><br>

