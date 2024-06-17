-----
# Provisioning
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


## Creating VM in Biznetgio

1. Pada Dashboard BIZNETGIO, pilih Compute -> NEO Lite, Lalu Klik tombol ```CREATE NEW```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6a6d486f-8f72-42c9-98da-0a2460aecbef)

2. Pada bagian "Neo Lite Servide Name", masukkan nama server yang diinginkan.

3. Pada bagian "Region" Pilih ```West Java```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/461bf306-1a15-45db-ad1e-de5be1ae12f0)

4. Pada bagian "Product" pilih tipe _spec_ produk yang diinginkan.

5. Pada bagian "Cycle" pilih waktu pembayaran yang diinginkan, baik Bulanan (Monthly) atau Tahunan (Yearly).

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/85e45b2f-1df6-46de-9d29-6b97b1bf3e74)

6. Pada bagian "Operating System" Pilih Sistem Operasi yang diinginkan.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cedf2d01-029a-4a34-b0a1-90d2217b45e2)

7. Pada bagian "SSH Key" Klik ```CREATE SSH KEY```, lalu masukkan nama yang diinginkan dan Klik ```CREATE```.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3371b27e-37b3-448e-a3b8-e4bccecfac1e)

8. Nantinya akan terdownload file sshkey tadi.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b22183b9-ca9f-4d52-8b11-6df7a008055a)

9. Selanjutnya masukkan Username dan Password yang diinginkan, lalu klik Next.

 ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0ab718bf-ae42-4115-89ca-6d67cc7fd5bd)

10. Selanjutnya akan masuk ke metode pembayaran.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e391f26b-4882-4315-8f5a-4eccadd3a933)

11. Jika sudah bayar dan selesai mengorder, maka akan tampil seperti ini.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f6c3237e-802f-4ee1-bef2-f4a92e111bac)

12. Tunggu sampai Statusnya berubah menjadi Active.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2c955c90-7f0a-41d2-9bbd-e3637045f498)

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c0fa9c4-910d-4bfd-8171-f4558ef6b5ff)



## Creating AZURE VM Using Terraform

### 1. Install Terraform

Untuk cara installnya bisa dilihat [DISINI](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Untuk ubuntu, cara installnya cukup dengan menjalankan command berikut:
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

Selanjutnya buat script terraform, bisa dilihat di [dokumentasi resmi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) yang ada.

Untuk scriptnya sudah saya buat, dan bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/final-task/terraform).



### 2. Install Azure CLI

Selanjutnya, Install Azure CLI di ubuntu dengan menjalankan command berikut atau untuk OS yang lainnya [DISINI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt):
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

![Screenshot 2024-06-11 120028](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d54350fa-384a-4804-974c-9209d90ffdf4)


Jika sudah diinstall, login ke azure dengan menjalankan command berikut:
```
az login --use-device-code
```

![Screenshot 2024-06-11 120304](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/99dc5aee-fa53-429d-93b0-045324fc8ddd)


Selanjutnya pergi ke alamat tersebut dengan browser dan pastekan kodenya.

![Screenshot 2024-06-11 120331](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/66aab4c8-4cc8-41ee-bcc4-843b392910bb)


Login ke akun yang sudah mempunyai microsoft azure.

![Screenshot 2024-06-11 120345](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1446e1ff-609d-4f02-94bc-7c0cde0aad9c)



Jika sudah login, nanti akan muncul seperti ini, disini saya hanya ada 1 subscription. Jadi saya pilih no.1

![Screenshot 2024-06-11 120416](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ad42e4a3-9c14-41e5-82e5-3a7b0969f1e7)


Jika sudah, cek apakah akunnya sudah terhubung.
```
az account show
```

Nanti hasilnya seperti ini:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a095bb43-c63d-4c85-9baa-1ccf9cc4eeec)


### 3. Start Terraform


Selanjutnya, jalankan command berikut:
```
terraform init;
terraform plan;
```

Nanti akan muncul seperti ini:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0204e782-6bb7-4422-abfe-1cc21e8a9b8c)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/894fe463-2961-4ab6-8b13-c41d2351f6fd)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/417dad94-844a-44ab-bf16-ffd28a3e36b6)



Jika sudah, jalankan command:

```
terraform apply
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b9f1ff23-d79a-4731-b02f-6a4f9be126e7)

Jika sukses, nanti akan muncul seperti ini:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7ea6860f-ca6d-4327-88c8-7f1869065285)


Cek di Dashboard Azure:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6c77f613-9e8b-4e4f-94e5-3f39995925cb)



## Setup All servers using Ansible


Untuk cara installnya bisa dilihat [DISINI](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu).

Untuk Ubuntu, cara installnya cukup dengan menjalankan command berikut:
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

Disini saya sudah install Ansible:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4e5be541-bf1f-4c47-ae2f-9c3b790e1a4c)

Dan untuk scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/final-task/ansible).

Selanjutnya, untuk menjalankan scriptnya bisa satu persatu seperti ini:

```
ansible-playbook 1install_docker.yaml;
ansible-playbook 2create_user.yaml;
ansible-playbook 3setup_ufw.yaml;
ansible-playbook 4install_mon.yaml;
ansible-playbook 5reverse_proxy.yaml;
ansible-playbook 6clone_repo.yaml;
ansible-playbook 7install_k3s.yaml;
ansible-playbook 8install_jenkins.yaml;
```


Atau dengan menjalankan semua script sekaligus dengan menggunakan command berikut:

```
ansible-playbook main.yaml
```


Jika sukses nanti hasilnya kurang lebih seperti ini:

![Screenshot 2024-06-11 161223](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cd24fe96-cc21-4279-a046-134b015697a8)

