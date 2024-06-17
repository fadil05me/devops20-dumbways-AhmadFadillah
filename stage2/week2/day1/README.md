# DAILY TASK - DAY 1 - WEEK 2 - Docker

## Rebuild Server Biznet

Pertama kita lakukan rebuild server.

Masuk ke dashboard biznetgio -> Pilih server mana yang ingin di rebuild -> Klik Stop.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8119bc8b-15ae-4dd3-9cd1-30a8b04761c4)

Jika server sudah stop, Klik tombol ```Rebuild```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2aa0671f-fb18-4169-82f7-f5f644046414)

Selanjutnya pilih OS yang diinginkan, Lalu klik ```Confirm```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58f65d20-39bc-40e4-ba70-eaad160f82dd)

Jika sudah benar, Klik ```Rebuild```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/319dca25-2244-4e04-a1f3-6e70681429a6)

Tunggu sampai proses rebuild selesai, lakukan _Refresh_ secara berkala. Jika sudah berhasil statusnya akan menjadi _Active_.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1fd8cbfb-1979-42ef-b6a3-348bb6e1325a)


## Installasi Docker

Jika sudah aktif, konek ke server menggunakan SSH. Lalu buat user baru.
```
sudo adduser namauser
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/368be14d-e26d-4405-9314-2fae9ccb0ca9)

Lakukan setting SSH Key user baru tadi. Untuk caranya sudah pernah dibahas di Week 1 - Day 1 ada di [SINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week1/day1).

Selanjutnya login menggunakan akun baru tadi. Lalu buat file ```docker_installer.sh```. Isi dengan script berikut:

```
#!/bin/bash

# Cek Update
echo -e "\n\n~~~Step 1: Cek Update!~~~\n\n"
sudo apt-get update

# Upgrade
echo -e "\n\n~~~Step 2: Melakukan Upgrade!~~~\n\n"
sudo apt-get upgrade -y

# Selesai Update & Upgrade
echo -e "\n\n~~~Selesai Update & Upgrade!~~~\n\n"

# Add Docker's official GPG key:
echo -e "\n\n~~~Step 3: Menambahkan GPG key!~~~\n\n"
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo -e "\n\n~~~Selesai menambahkan GPG key!~~~\n\n"

# Add the repository to Apt sources:

echo -e "\n\n~~~Step 4: Menambahkan Docker ke repository APT!~~~\n"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sleep 1
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."

echo -e "\n\n~~~Selesai menambahkan Docker ke repository APT!~~~\n\n"

echo -e "\n\n~~~Step 5: Cek Update!~~~\n\n"
sudo apt-get update

echo -e "\n\n~~~Step 6: Install Docker!~~~\n\n"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Cek versi Docker
echo -e "\n\n~~~Cek versi Docker!~~~\n\n"
docker -v

echo -e "\n\n~~Selesai!~~~\n\n"
```

Jika sudah disimpan, jalankan command berikut agar file bisa di execute.

```
chmod +x docker_installer.sh
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cc9b3bb0-4a56-4e0d-935d-6bb60f7d5651)

Jalankan script tadi dengan menggunakan command berikut:
```
./docker_installer.sh
```
Tunggu sampai proses installasi docker selesai.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4122d056-389d-4582-9d02-349440ad22c2)

Jika sukses, akan tampil seperti ini.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fe5d7b92-2b4f-47ff-bf67-fd7378f4f8c3)

Selanjutnya, di server ini saya akan gunakan untuk backend dan mysql server.

Clone repo [wayshub-backend](https://github.com/dumbwaysdev/wayshub-backend.git).
```
git clone https://github.com/dumbwaysdev/wayshub-backend.git
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/92b3069c-346e-44fd-bb60-675e9f451e3c)

Masuk ke folder ```wayshub-backed```.
```
cd wayshub-backed
```

Selanjutnya copy file ```env.example```. Dan edit file konfigurasi dari backend.
```
cp env.example .env
```

Edit file ```config/config.json```. Lalu ganti sesuai dengan settingan database yang nanti akan dibuat.
```
nano config/config.json
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b42321ae-0c97-4a41-a597-22b505874b2f)


Buat file dengan nama ```Dockerfile```. Lalu isi dengan script berikut.
```
FROM node:14-alpine

WORKDIR /app

COPY . .

RUN npm i sequelize-cli -g
RUN npm install pm2 -g
RUN npm install

EXPOSE 5000

CMD [ "pm2-runtime", "ecosystem.config.js" ]
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/457e3a7f-2313-45fb-9844-c8d7551ee11b)

Buat file baru lagi dengan nama ```ecosystem.config.js```
```
module.exports = {
  apps: [
    {
      name: 'wayshub-backend',
      script: 'npm',
      args: ['run', 'start'],
    }
  ]
};
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/40b4ded2-1eb6-418b-8038-2e6f463cf6ce)


Selanjutnya build dengan menjalankan command berikut. Tunggu sampai proses selesai.
```
docker build -t wayshub-backend:1.0 .
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6e3e7eec-f2ee-4685-81e1-215836e7b65a)


Kembali ke folder home, lalu buat file baru dengan nama ```Docker-compose.yaml```. Pada bagian Database ganti menjadi settingan database tadi.
```
cd && nano docker-compose.yaml
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6014b964-09af-4beb-99cf-b84ffb2a48e9)


Jika sudah disimpan, Jalankan command berikut:
```
docker compose up -d
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/85f3f977-0d16-4fac-b826-c03bacdf6bac)


Selanjutnya, masuk ke docker dari backend.
```
docker exec -it wayshub-backend bash
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9d0e7474-bfb3-460c-a8ba-053bb663739f)

Jalankan command berikut untuk migrasi database.
```
sequelize db:migrate
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b83b4be9-51b1-40e4-b7b7-348e0791c8a7)


Jika sudah, kita pindah ke server untuk frontend dan webserver. Lalu install docker seperti cara diatas tadi.

Selanjutnya clone repo [wayshub-frontend](https://github.com/dumbwaysdev/wayshub-frontend.git)
```
git clone https://github.com/dumbwaysdev/wayshub-frontend.git
```

Setelah clone masuk ke directory frontend, Lalu buat file ```ecosystem.config.js```.
```
module.exports = {
  apps: [
    {
      name: 'wayshub-frontend',
      script: 'npm',
      args: ['run', 'start'],
    }
  ]
};
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a85d374b-ac87-4786-91fe-2d2b7a4f1ac3)


Buat lagi file baru bernama ```Dockerfile```. Lalu isi dengan script ini:
```
FROM node:14-alpine

WORKDIR /app

COPY . .

RUN npm install pm2 -g
RUN npm install

EXPOSE 3000

CMD [ "pm2-runtime", "ecosystem.config.js" ]
```

Edit file configurasi.
```
nano src/config/api.js
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f317b1fd-691b-4db0-a230-bf8e37349fb6)


Ubah pada baseURL menjadi alamat url dari backend.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a3640076-7dfe-406d-97f2-a15af7cceedb)


Selanjutnya, build images docker dengan command berikut:
```
docker build -t wayshub-frontend:1.0 .
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b647fc34-bf12-49ca-a201-b1410dfc902f)

Jika sudah selesai, Cek dengan menggunakan command:
```
docker images
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e30eb816-7a92-4dce-a1c4-82837fd12134)

Selanjutnya kembali ke directory home. Lalu buat file ```docker-compose.yaml```. Isi dengan script berikut:
```
version: '3.8'

services:

  webserver:
    container_name: webserver
    image: nginx:latest
    ports:
        - "80:80"
        - "443:443"
    restart: always
    volumes:
        - ./nginx/conf:/etc/nginx/conf.d
        - ./certbot/www/:/var/www/certbot
        - ./certbot/conf/:/etc/letsencrypt
    depends_on:
        - certbot
    networks:
      - team2

  certbot:
    container_name: certbot
    image: certbot/dns-cloudflare:latest
    volumes:
      - ./certbot/certbot.ini:/etc/letsencrypt/renewal/renewal.conf:ro
      - ./certbot/www/:/var/www/certbot
      - ./certbot/conf/:/etc/letsencrypt
    networks:
      - team2

  frontend:
    container_name: wayshub-frontend
    image: wayshub-frontend:1.0
    stdin_open: true
    ports:
      - "3000:3000"
    depends_on:
      - webserver
    networks:
      - team2

networks:
 team2:
```

Buat folder baru bernama ```certbot``` lalu buat file baru didalamnya dengan nama ```certbot.ini```.
```
mkdir certbot; cd certbot; nano certbot.ini
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/76272454-4d10-44d8-86c3-dae1dda44331)


Masukkan email dan apikey dari cloudflare ke dalam file ```certbot.ini```
```
dns_cloudflare_email = "youremail@example.com"
dns_cloudflare_api_key = "your_api_key"
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f2f42577-33b8-448f-90a2-3cc3b7919537)

Lalu lakukan chmod.
```
sudo chmod 400 certbot.ini
```
 
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/257531b7-6e3d-452f-b931-46bb837e9621)

Selanjutnya buat folder baru bernama ```nginx``` dan buat lagi didalamnya bernama ```conf```, lalu didalam folder tersebut buat file dengan nama bebas berextensi ```.conf```.
```
mkdir nginx; cd nginx; mkdir conf; cd conf; nano fadil.conf
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/21001eac-8620-4208-98b8-782ffc1f0b53)

Simpan script ini didalamnya:
```
server {
        server_name fadil.studentdumbways.my.id;

        listen 443 ssl;
        ssl_certificate /etc/letsencrypt/live/fadil.studentdumbways.my.id/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/fadil.studentdumbways.my.id/privkey.pem;

        location / {
               proxy_pass http://103.xxx.xxx.xxx:3000;
        }
}
server {
        server_name api.fadil.studentdumbways.my.id;

        listen 443 ssl;
        ssl_certificate /etc/letsencrypt/live/fadil.studentdumbways.my.id/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/fadil.studentdumbways.my.id/privkey.pem;

        location / {
               proxy_pass http://103.xxx.xxx.xxx:5000;
        }
}
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/64dadc17-3cde-4fb9-94d3-c94b174c6cbb)


Selanjutnya jalankan docker compose.
```
cd && docker compose up -d
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/66e9dec0-af2d-4e26-871f-db772bb493fb)

Generate SSL Certificate.
```
docker compose run --rm certbot certonly --dns-cloudflare
```
ketika diminta nama domain, Masukkan ```namadomain.com, *.namadomain.com```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/57102811-d7fd-45ee-b55b-c6b8e2f38f08)


Jika diminta file .ini, masukkan: ```/etc/letsencrypt/renewal/renewal.conf```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/061a0272-9809-4847-a76e-792c1aaab290)


Jika selesai, lakukan reload nginx.
```
docker compose exec webserver nginx -s reload
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/456272b6-68ab-4ea6-b0a9-529805c3ec11)


Lalu akses menggunakan browser.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/861941cc-e00d-4eef-bd8a-c460911607d9)

