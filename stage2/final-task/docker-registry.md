-----
# **DOCKER REGISTRY**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- Docker Registry Private

**Instructions**

[ *Docker Registry* ]

- Deploy Docker Registry Private on this server
- Push your image into Your Own Docker Registry
- reverse proxy registry-$name.studentdumbways.my.id

[*Referention*]
[Docker Registry Private](https://hub.docker.com/_/registry)

-----

## Deploy docker registry private

Buat file ```docker-compose.yaml```
Disini saya juga menambahkan frontend untuk registry
```
version: '3.8'

services:
  registry:
    container_name: registry
    image: registry:2
    ports:
      - "7000:5000"
    volumes:
      - ./registry-data:/var/lib/registry
    restart: always

  frontend:
    container_name: registry-frontend
    image: konradkleine/docker-registry-frontend:v2
    ports:
      - "8080:80"
    environment:
      ENV_DOCKER_REGISTRY_HOST: registry
      ENV_DOCKER_REGISTRY_PORT: 5000
    restart: always
    depends_on:
      - registry

volumes:
  registry-data:
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7d406c56-6ebe-4a94-8726-63a0e63c2c16)


Jalankan docker compose
```
docker compose up -d
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2d730607-2a84-4175-a8fe-e84225574fb5)


**Reverse Proxy**


Pada file nginx.conf, tambahkan limit upload sebesar max 500MB dan tambahkan juga SSL Cert:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed5b3940-2fce-4fa2-898a-885af445fccd)


Konfigurasi untuk subdomain registry.fadil.studentdumbways.my.id:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/483d1297-ef46-4d8c-8a75-80ff8efaf188)

Konfigurasi untuk subdomain hub.fadil.studentdumbways.my.id:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7a4da88d-0093-41c7-aad2-9a2c8e376554)


Setup basic auth untuk hub.fadil.studentdumbways.my.id:

install apache2-utils
```
sudo apt-get update
sudo apt-get install apache2-utils
```

Di dalam folder nginx generate .htpasswd, ganti fadil menjadi nama user lalu enter dan masukkan password yang diinginkan:
```
sudo htpasswd -c .htpasswd fadil
```

Nginx folder tree
```
root@gateway:/home/finaltask-fadil/nginx# tree -a
.
├── .htpasswd
├── conf.d
│   ├── f.api-staging.conf
│   ├── f.api.conf
│   ├── f.api.conf.save
│   ├── f.be-staging.conf
│   ├── f.conf
│   ├── f.exporter.conf
│   ├── f.fe-staging.conf
│   ├── f.hub.conf
│   ├── f.monitoring.conf
│   ├── f.pgadmin.conf
│   ├── f.pipeline.conf
│   ├── f.prom.conf
│   ├── f.registry.conf
│   └── f.staging.conf
├── letsencrypt
│   ├── accounts
│   │   └── acme-v02.api.letsencrypt.org
│   │       └── directory
│   │           └── 68d7fdf8da8231f8812d4a2f75eea244
│   │               ├── meta.json
│   │               ├── private_key.json
│   │               └── regr.json
│   ├── archive
│   │   └── fadil.studentdumbways.my.id
│   │       ├── cert1.pem
│   │       ├── chain1.pem
│   │       ├── fullchain1.pem
│   │       └── privkey1.pem
│   ├── letsencrypt.log
│   ├── letsencrypt.log.1
│   ├── live
│   │   ├── README
│   │   └── fadil.studentdumbways.my.id
│   │       ├── README
│   │       ├── cert.pem -> ../../archive/fadil.studentdumbways.my.id/cert1.pem
│   │       ├── chain.pem -> ../../archive/fadil.studentdumbways.my.id/chain1.pem
│   │       ├── fullchain.pem -> ../../archive/fadil.studentdumbways.my.id/fullchain1.pem
│   │       └── privkey.pem -> ../../archive/fadil.studentdumbways.my.id/privkey1.pem
│   ├── renewal
│   │   ├── cloudflare.ini
│   │   └── fadil.studentdumbways.my.id.conf
│   └── renewal-hooks
│       ├── deploy
│       ├── post
│       └── pre
└── nginx.conf

15 directories, 33 files
```

**Hasil:**



![Screenshot 2024-06-12 121023](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3471629e-ed27-43a8-945b-bc4eb212b17a)



![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/51bc6a58-760d-40ed-9f2b-0004d9726754)




![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/56e74c9f-7db0-4528-a8d3-93d55bde5033)




## Push Image to Docker Private Registry

Build imagenya terlebih dahulu
```
docker build -t registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:1.0 .
```

Selanjutnya push ke registry
```
docker push registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:1.0
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bb02f0ff-4bb0-4d65-bc72-bb833f22dee8)
