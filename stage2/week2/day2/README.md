# DAILY TASK - DAY 2 - WEEK 2 | CICD using JENKINS 

## INSTALLASI JENKINS ON TOP OF DOCKER

Disini saya akan menginstall jenkins dengan menggunakan docker compose.

Langkah pertama yaitu buat folder baru bernama jenkins. Lalu masuk ke dalam folder tersebut dan buat file baru bernama docker-compose.yaml

```
mkdir jenkins; cd jenkins; nano docker-compose.yaml;
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/859c0e4d-bba7-4d83-9b63-9784e02d3c9e)


Masukkan script ini kedalamnya:
```
version: '3.8'

services:
  jenkins:
    image: jenkins/jenkins:lts
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - jenkins_data:/var/jenkins_home
    restart: unless-stopped

volumes:
  jenkins_data:

```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/51b0818e-150f-4654-9857-80a240701ea6)

Selanjutnya jalankan command berikut
```
docker compose up -d
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/85133316-9602-41b0-a864-7cad4ac713bc)

Jika sudah, cek apakah jenkins berjalan
```
docker compose ps -a
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0782cca4-a588-40d1-8846-8e1240f29235)

Akses servernya menggunakan browser dengan menggunakan port 8080, jika muncul seperti ini maka sudah berhasil

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cbcda62b-9904-4c18-a5ab-6d56a9a0f4dc)

Selanjutnya, masuk ke bash dari jenkins

```
docker compose exec -it jenkins-jenkins-1 bash
```

Lalu jalankan command berikut
```
cat /var/jenkins_home/secrets/initialAdminPassword
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b5d7807d-bd48-42ca-8894-99b7877e4dc9)

Copy paste password tersebut ke browser tadi, lalu klik continue

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c0ad945-3cc6-4b33-ad69-d88c48a692ac)

Pilih yang ```install suggested plugins```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8643114d-627e-4785-bc30-f5ffc8c85418)

Lalu tunggu sampai proses setup selesai

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2e79aa31-cf42-436b-94e5-0febebce8bc8)

Selanjutnya, buat akun admin

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f8fc93ed-82cd-4a12-a7e6-782b06e8a6f4)

Disini kita langsung save dulu

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cd25978a-0a2b-43d4-afcd-cbe9f286f8a3)

Proses setup selesai

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f508f22-d290-47e9-a501-e8bbc09b3d0a)
