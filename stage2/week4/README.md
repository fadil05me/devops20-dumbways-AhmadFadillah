-----------------------------
# WEEK 4 - KUBERNETES
-----------------------------

## Task 1: Intall k3s menggunakan ansible:

Script bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week4/ansible)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d9ace299-09a7-4c9b-8d6a-dbee16c8bfb8)

## Task 2: Install ingress nginx using helm or manifest

Jalankan command berikut untuk menginstall helm:
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f3cfb728-609b-40d4-88ea-9da59be0dceb)

Uninstall traefik using helm:
```
sudo rm -rf /var/lib/rancher/k3s/server/manifests/traefik.yaml;
helm uninstall traefik traefik-crd -n kube-system
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/93925fe9-fa08-4422-bd0b-0edfab015e1b)

Buat namespace baru:
```
kubectl create ns fadil
```
Install ingress-nginx using helm:
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace fadil
```

Cek apakah sudah terinstall
```
kubectl get all -n fadil
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c847c044-23c2-44ab-bf1b-c78ec5ecb9b5)

<br>

Akses menggunakan browser:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/13732278-01af-42b2-b96d-23ee12c2bccd)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fc80674e-4e83-4af3-b0e0-09e5a97ccedd)


## Task 3: Deploy frontend, Backend kalian ke kubernetes. (bebas menggunakan apps apa)

Deploy menggunakan helm:
Scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week4/deploy-helm)

Buat helm dengan nama ```wayshub```
```
helm create wayshub
```
Pindahkan semua script .yaml tadi ke dalam folder wayshub/templates

Jika sudah, untuk menginstallnya jalankan command berikut:

```
helm install wayshub ./wayshub --namespace fadil
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d7be05d5-fd73-4b98-88a4-8c575a5192aa)

Cek dengan menjalankan command berikut:
```
kubectl get all -n fadil
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ba5e5ecf-90e9-4676-af34-eaeb6273108f)

<br>

Akses menggunakan browser:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/51187075-7c93-43a2-941e-82a2499aa43f)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/02cf10ab-2ab1-46ac-aae7-6c7319fcbe87)


## Task 4: Setup persistent volume on k3s config

Pada node master:
```
sudo nano /etc/rancher/k3s/config.yaml
```

Masukkan config berikut:
```
cluster-init: true
disable: servicelb
disable: traefik
default-local-storage-path: /mnt/disk1
```

Jika sudah restart service k3s:
```
sudo systemctl restart k3s
kubectl get storageclasses
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a3d9b290-be33-4f04-8bee-e0dc7fbdea9a)


Pada node worker:
```
sudo nano /etc/rancher/node/config.yaml
```

Masukkan config berikut:
```
disable: servicelb
disable: traefik
default-local-storage-path: /mnt/
```

Jika sudah restart service k3s-agent:
```
systemctl restart k3s-agent
kubectl get storageclasses
```

## Task 5: Deploy database mysql with statefullset and use secrets
