# DAILY TASK - DAY 1 - WEEK 2

## DOCKER

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
