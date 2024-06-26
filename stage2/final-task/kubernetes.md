-----
# **KUBERNETES**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- k3s/ Vanilla /Docker Swarm
- Kubernetes Engine (VKE, GKE or EKS)

**Instructions**
- No 5 (Deployment) app runs inside a kubernetes cluster (include frontend, backend, and database)
- Apps running 100% with backend and db integration

-----

## Installasi K3s

Untuk Installasi K3s saya menggunakan Ansible, Scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/7install_k3s.yaml).


Setelah installasi selesai, cek apakah namespace sudah terbuat.
```
kubectl get ns
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ee9a380b-1553-475d-9712-41e3a1d53c24)

### Uninstall traefik using helm

Install Helm
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

Selanjutnya jalankan command berikut:
```
sudo rm -rf /var/lib/rancher/k3s/server/manifests/traefik.yaml;
helm uninstall traefik traefik-crd -n kube-system
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/93925fe9-fa08-4422-bd0b-0edfab015e1b)

### Setup persistent volume on k3s config

**Pada node master:**
```
sudo nano /etc/rancher/k3s/config.yaml
```

Masukkan config berikut:
```
cluster-init: true
disable: servicelb
disable: traefik
default-local-storage-path: /home/finaltask-fadil/pg-data
```

Jika sudah restart service k3s:
```
sudo systemctl restart k3s
```

**Pada node worker:**
```
sudo nano /etc/rancher/node/config.yaml
```

Masukkan config berikut:
```
disable: servicelb
disable: traefik
default-local-storage-path: /home/finaltask-fadil/pg-data
```

Jika sudah restart service k3s-agent:
```
sudo systemctl restart k3s-agent
```

## Deploy Postgres Database

Buat folder database, dan buat file baru dengan nama pg.yaml
```
apiVersion: v1
kind: Secret
metadata:
  name: postgres-secrets
  namespace: dumbmerch
type: Opaque
data:
  POSTGRES_DB: ZHVtYm1lcmNo
  POSTGRES_USER: ZmFkaWw=
  POSTGRES_PASSWORD: RmFkaWw5OTk=

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-pvc
  namespace: dumbmerch
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: local-path

---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgresql
  namespace: dumbmerch
spec:
  serviceName: postgresql
  replicas: 1
  selector:
    matchLabels:
      app: postgresql
  template:
    metadata:
      labels:
        app: postgresql
    spec:
      containers:
        - name: postgresql
          image: postgres:latest
          env:
            - name: POSTGRES_DB
              valueFrom:
                secretKeyRef:
                  name: postgres-secrets
                  key: POSTGRES_DB
            - name: POSTGRES_USER
              valueFrom:
                secretKeyRef:
                  name: postgres-secrets
                  key: POSTGRES_USER
            - name: POSTGRES_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: postgres-secrets
                  key: POSTGRES_PASSWORD
          ports:
            - containerPort: 5432
          volumeMounts:
            - name: postgres-storage
              mountPath: /var/lib/postgresql/data
      volumes:
        - name: postgres-storage
          persistentVolumeClaim:
            claimName: postgres-pvc

---
apiVersion: v1
kind: Service
metadata:
  name: postgresql
  namespace: dumbmerch
spec:
  type: NodePort
  ports:
    - port: 5432
      targetPort: 5432
      nodePort: 30432
  selector:
    app: postgresql
```

Deploy Database dengan menjalankan command berikut:
```
kubectl apply -f pg.yaml
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/db679fea-f250-474b-846f-9e2c84619d67)


## Deploy Backend Production

Edit file .env:
```
DB_HOST=db.fadil.studentdumbways.my.id
DB_USER=fadil
DB_PASSWORD=Fadil999
DB_NAME=dumbmerch
DB_PORT=5432
```

Buat folder dumbmerch di home, lalu buat file backend.yaml:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
  namespace: dumbmerch
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
        - name: backend
          image: registry.fadil.studentdumbways.my.id/be-dumbmerch-production:latest
          ports:
            - containerPort: 5000
---
apiVersion: v1
kind: Service
metadata:
  name: backend-service
  namespace: dumbmerch
spec:
  type: LoadBalancer
  ports:
    - port: 5000
      targetPort: 5000
      nodePort: 30500
  selector:
    app: backend
```


Deploy Backend:
```
kubectl apply -f backend.yaml
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bbfd72b4-afcc-4508-a997-5f6bcbb55e38)



## Deploy Frontend

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  namespace: dumbmerch
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
  template:
    metadata:
      labels:
        app: frontend
    spec:
      containers:
        - name: frontend
          imagePullPolicy: Always
          image: registry.fadil.studentdumbways.my.id/fe-dumbmerch-production:latest
          ports:
            - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: frontend-service
  namespace: dumbmerch
spec:
  type: LoadBalancer
  ports:
    - port: 3000
      targetPort: 3000
      nodePort: 30300
  selector:
    app: frontend
```


Deploy Frontend:
```
kubectl apply -f frontend.yaml
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b543ece6-7d82-4319-8ab0-d925edb112d7)


## Deploy Pgadmin

Kembali ke folder database, lalu buat file pgadmin.yaml:
```
apiVersion: v1
kind: Secret
metadata:
  name: pgadmin-secrets
  namespace: dumbmerch
type: Opaque
data:
  PGADMIN_DEFAULT_EMAIL: ZmFkaWwwNW1lQGdtYWlsLmNvbQ==
  PGADMIN_DEFAULT_PASSWORD: RmFkaWw5OTk=

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pgadmin
  namespace: dumbmerch
spec:
  replicas: 1
  selector:
    matchLabels:
      app: pgadmin
  template:
    metadata:
      labels:
        app: pgadmin
    spec:
      containers:
        - name: pgadmin
          image: dpage/pgadmin4:latest
          env:
            - name: PGADMIN_DEFAULT_EMAIL
              valueFrom:
                secretKeyRef:
                  name: pgadmin-secrets
                  key: PGADMIN_DEFAULT_EMAIL
            - name: PGADMIN_DEFAULT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: pgadmin-secrets
                  key: PGADMIN_DEFAULT_PASSWORD
          ports:
            - containerPort: 80
              name: pgadmin-http

---
apiVersion: v1
kind: Service
metadata:
  name: pgadmin
  namespace: dumbmerch
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30777
  selector:
    app: pgadmin
```

Deploy Pgadmin:
```
kubectl apply -f pgadmin.yaml
```

Login ke Pgadmin, ```Add New Server```.
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1668e9a4-388d-4552-94ab-8eed42196a17)

Masukkan Ip address, Port, Username dan Password. Lalu klik Save.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f80bad50-d000-46b9-9983-2417784afa51)



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8d3a7357-0e7a-41e4-9d6c-af3abf5e6db0)



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4880720d-3c28-4552-bf62-9bf6b4833c7e)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/eb354ffe-4ea5-40bc-af4f-413672a013ee)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ac6bcdb9-9d5b-4dc3-861c-450a2e7c37b9)



## Load Balancing

**PosgreSQL Load balancing**

Buat folder baru di home dengan nama HAProxy, lalu buat file haproxy.cfg.
```
global
    log stdout format raw local0
    maxconn 4096
    user haproxy
    group haproxy
    daemon

defaults
    log     global
    mode    tcp
    option  tcplog
    retries 3
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms

frontend postgres_frontend
    bind *:5432
    default_backend postgres_backend

backend postgres_backend
    balance roundrobin
    server primary_server 52.187.151.49:30432 check
    server secondary_server 52.187.151.75:30432 check
```


File docker-compose.yaml

```
services:
  haproxy:
    image: haproxy:latest
    container_name: haproxy
    volumes:
      - ./haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg
    ports:
      - "5432:5432"
```

Selanjutnya jalankan ```docker compose up -d```


Cek koneksi ke database:


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/da46624c-b45f-4133-b8ea-f41c542b1490)


**Backend Load Balancing**

Edit file configurasi dari server backend.

Tambahkan Ip address backend pada upstream:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e75deda7-d1f0-4fe2-9b35-91a262fe5c49)



**Frontend Load Balancing**

Caranya sama seperti Backend:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/412b7174-33ba-42c3-bd71-1f3ef98de5da)
