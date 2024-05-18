# DAILY TASK - DAY 2 - WEEK 2

## CICD using JENKINS

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

Klik save

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cd25978a-0a2b-43d4-afcd-cbe9f286f8a3)

Proses setup selesai

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f508f22-d290-47e9-a501-e8bbc09b3d0a)

Masuk ke cloudflare dan buat subdomain baru dengan mempointing ke ip webserver

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ff42dc51-9121-49b6-8a7f-f689bcb2562e)

Di webserver, buat konfigurasi baru untuk subdomain jenkins

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cf892bce-fa0f-4be8-b75c-1058d88e4674)

Masukkan script konfigurasi berikut

```
upstream jenkins {
  keepalive 32; # keepalive connections
  server 103.127.134.73:8080; # ip address + port server jenkins
}

# Required for Jenkins websocket agents
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

server {
  listen          80;       # Listen on port 80 for IPv4 requests
  listen 443 ssl;
  ssl_certificate /etc/letsencrypt/live/fadil.studentdumbways.my.id/fullchain.pem; # lokasi ssl cert
  ssl_certificate_key /etc/letsencrypt/live/fadil.studentdumbways.my.id/privkey.pem; # lokasi ssl cert

  server_name     pipeline.fadil.studentdumbways.my.id;  # subdomain yang tadi

  # this is the jenkins web root directory
  # (mentioned in the output of "systemctl cat jenkins")
  root            /var/run/jenkins/war/;

  access_log      /var/log/nginx/jenkins.access.log;
  error_log       /var/log/nginx/jenkins.error.log;

  # pass through headers from Jenkins that Nginx considers invalid
  ignore_invalid_headers off;

  location ~ "^/static/[0-9a-fA-F]{8}\/(.*)$" {
    # rewrite all static files into requests to the root
    # E.g /static/12345678/css/something.css will become /css/something.css
    rewrite "^/static/[0-9a-fA-F]{8}\/(.*)" /$1 last;
  }

  location /userContent {
    # have nginx handle all the static requests to userContent folder
    # note : This is the $JENKINS_HOME dir
    root /var/lib/jenkins/;
    if (!-f $request_filename){
      # this file does not exist, might be a directory or a /**view** url
      rewrite (.*) /$1 last;
      break;
    }
    sendfile on;
  }

  location / {
      sendfile off;
      proxy_pass         http://jenkins;
      proxy_redirect     default;
      proxy_http_version 1.1;

      # Required for Jenkins websocket agents
      proxy_set_header   Connection        $connection_upgrade;
      proxy_set_header   Upgrade           $http_upgrade;

      proxy_set_header   Host              $http_host;
      proxy_set_header   X-Real-IP         $remote_addr;
      proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Proto $scheme;
      proxy_max_temp_file_size 0;

      #this is the maximum upload size
      client_max_body_size       10m;
      client_body_buffer_size    128k;

      proxy_connect_timeout      90;
      proxy_send_timeout         90;
      proxy_read_timeout         90;
      proxy_request_buffering    off; # Required for HTTP CLI commands
  }

}
```


Simpan lalu reload webserver nginx
```
docker compose exec webserver nginx -s reload
```

Selanjutnya ke jenkins -> Manage Jenkins -> System

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/62dce9ce-7098-4a5b-96f8-3d1ece1fb687)

Pastikan di bagian ```Jeknins URL``` sudah sesuai. Lalu Apply & Save.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/019dc304-6ce5-4792-a46a-973b532a5de5)

Selanjutnya ke Plugins -> Available Plugins -> cari ```SSH Agent``` -> Install

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bcc039c2-2e55-455b-8a25-4a6c1895cbce)

Jika terdapat error, Install ulang pluginnya sampai berhasil. Dan pastikan ceklist pada ```Restart Jenkins when installation is complete...```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6a2300f-3be2-4602-afe4-21c599eea567)

Satu lagi install Plugin ```Discord Notifier```. Caranya sama seperti tadi.

Kembali ke Manage Jenkins -> Credentials

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c802ddb5-5ca2-4615-b860-66c2ef8f04b5)

Lalu pilih ```Add Credentials```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/98f47676-3fb7-4461-915c-c4c3e0adcfa1)

- Pada bagian Kind, pilih ```SSH Username with private key```.
- Pada bagian ID, masukan id yang nantinya akan dipakai pada file Jenkinsfile.
- Pada bagian Username, masukkan username dari server backend.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/55671652-72f7-4664-bc95-b534a20e5ae0)

- Pada bagian Privat Key, Klik ```Enter Directly``` Lalu klik ```Add```. Masukkan privat key dari server backend.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3229f231-b365-4333-b4cd-26664b981b09)

Jika sukses, akan tampil seperti ini.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9c920886-edae-43fe-bf47-830e055aac0d)

Masuk ke github, lalu tambahkan Public key dari ssh tadi.
Ke Settings -> SSH and GPG keys -> New SSH Key.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bf39b46d-8d64-4df2-addb-ffcee3bda3b9)

Masukkan Public keynya lalu klik ```Add SSH Key```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8ef840b7-1fed-435d-a9ab-555896be1fac)

Jika sudah, tes koneksi ke github.
```ssh -T git@github.com```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ae592f0c-2783-46a9-be86-58e9158c88bc)

Selanjutnya buat repository baru di github.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/50d9bcef-f113-4ec5-b73e-12ca183b5f08)

Jika sudah dibuat, jalankan command berikut.
```
git config --global user.email "alamat email" && git config --global user.name "username github"
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9294598e-ab05-4e65-9540-2a9020d034c8)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6f205d2-4d4b-470a-9e7f-0fa66b7f5f7c)


Selanjutnya pergi ke folder wayshub-backend dan buat file baru dengan nama Jenkinsfile. Berikut adalah isi dari file Jenkinsfile. Silahkan edit sesuai kebutuhan
```
def secret = 'k2-appserver'
def server = 'k2@103.127.134.73'
def directory = '/home/k2/wayshub-backend'
def branch = 'master'
def namebuild = 'wayshub-backend:1.0'

pipeline {
    agent any
    stages {
        stage ('pull new code') {
            steps {
                sshagent([secret]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${server} << EOF
                            cd ${directory}
                            git pull origin ${branch}
                            echo "Selesai Pulling!"
                            exit
                        EOF
                    """
                }
            }
        }

        stage ('build the code') {
            steps {
                sshagent([secret]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${server} << EOF
                            cd ${directory}
                            docker build -t ${namebuild} .
                            echo "Selesai Building!"
                            exit
                        EOF
                    """
                }
            }
        }

        stage ('deploy') {
            steps {
                sshagent([secret]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${server} << EOF
                            cd ${directory}
                            docker compose down
                            docker compose up -d
                            echo "Selesai Men-Deploy!"
                            exit
                        EOF
                    """
                }

            }
        }
    }
}

```

Jika sudah simpan dan jalankan command berikut, sesuaikan dengan nama branch dan repository yang barusan dibuat.
```
git remote set-url branch git-repo && git add .
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cea3f289-03de-4169-bcf6-980455dbca83)

```
git commit -m "chore: Adding Jenkins and Docker" && git push origin main
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cf4a1894-272f-4215-9ca4-b737dfdfa3d2)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4294dde1-d8bf-4610-9a17-dfc3866b72d5)

Cek kembali repository tadi.
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d274f07d-489b-4a15-8469-c0a786da998d)

Ke Dashboard Jenkins. Klik ```New Item```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/255a215b-84b3-4aeb-bb1a-4308ab6dccc7)

Masukkan nama yang diinginkan, lalu pilih yang ```Pipeline``` -> Klik OK.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9b178d64-06d0-4658-9929-d574dc910d8b)

Ceklist pada bagian ```GitHub hook triger for GITScm polling.```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/70794b98-f54a-4155-95a5-9f9bdb6cafca)

Scroll kebawah,
- Pada bagian Definition ganti menjadi ```Pipeline script from SCM```
- Pada bagian SCM ganti menjadi ```Git```
- Pada bagian Repository, masukkan alamat repository tadi.
- Pada bagian Credentials, pilih credentials yang barusan dibuat.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/13996710-afae-4361-83ed-62a3909f230a)

Scroll kebawah lagi, Sesuaikan untuk branch dan Script path.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/97ea377d-493f-4668-8dba-1fc392407a59)

Jika sudah, coba untuk menjalankannya dengan klik ```Build Now```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/eec0fc0f-87d0-468f-8842-29a34797c279)

Jika sukses tanpa error, akan tampil seperti ini, jika ada error cek kembali file ```Jenkinsfile``` tadi.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c9c0e395-2a4c-4e02-94cb-6e6bdce2b1b6)

Selanjutnya Login ke docker hub dan buat repository baru. Pastikan visibility ```Public```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c69e73f2-db12-43eb-ac41-9473dd503cb3)

Buat credentials baru di jenkins. Masukkan username dan password dari akun docker. Dan pada bagian ID masukkan ```docker-hub-credentials```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6e22d274-28e4-44a0-b8c8-a017f2dcf3b6)

Jika sudah, edit kembali script Jenkinsfile tadi. Lalu tambahkan stage Test, Push ke Docker hub dan tambakan script notif ke Discord. _Sesuaikan dengan Kebutuhan_.

```
def secret = 'k2-appserver'
def server = 'k2@103.xxx.xxx.xxx'
def directory = '/home/k2/wayshub-backend'
def branch = 'master'
def namebuild = 'wayshub-backend:1.0'
def dockerHubCredentials = 'docker-hub-credentials'
def dockerHubRepo = 'fadil05me/wayshub-backend'

pipeline{
    agent any
    stages{
        stage ('pull new code'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    git pull origin ${branch}
                    echo "Selesai Pulling!"
                    exit
                    EOF"""
                }
            }
        }

        stage ('build the code'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker build -t ${namebuild} .
                    echo "Selesai Building!"
                    exit
                    EOF"""
                }
            }
        }

        stage ('test the code'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        cd ${directory}
                        docker run -d --name testcode -p 5009:5000 ${namebuild}
                        if wget --spider -q --server-response http://127.0.0.1:5009/ 2>&1 | grep '404 Not Found'; then
                            echo "Webserver is up and returning 404 as expected!"
                        else
                            echo "Webserver is not responding with expected 404, stopping the process."
                            docker rm -f testcode
                            exit 1
                        fi
                        docker rm -f testcode
                        echo "Selesai Testing!"
                        exit
                    EOF"""
                }
            }
        }

        stage ('deploy'){
            steps {
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker compose down
                    docker compose up -d
                    echo "Selesai Men-Deploy!"
                    exit
                    EOF"""
                }
            }
        }

        stage('push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sshagent([secret]) {
                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                        cd ${directory}
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker tag ${namebuild} ${dockerHubRepo}:latest
                        docker push ${dockerHubRepo}:latest
                        echo "Selesai Push ke Docker Hub!"
                        exit
                        EOF"""
                    }
                }
            }
        }

        stage('push notif to discord') {
            steps {
                discordSend description: 'test desc', footer: '', image: '', link: '', result: 'SUCCESS', scmWebUrl: '', thumbnail: '', title: 'Discord Notif', webhookURL: 'https://discord.com/api/webhooks/1240246717505474601/eSqwzll5dezuF9pzrq9BPjq_-QCsaAmV6-vHVvH_HKoodz2XA4GLgomv03OQT7_mojik'
            }
        }

    }
}
```

Jika sudah, Simpan filenya dan Push kembali ke github.

Test kembali scriptnya dengan klik ```Build Now``` di jenkins.

Jika masih ada error edit kembali sampai sudah tidak ada error.

Selanjutnya ke github repository tadi, lalu Klik ```Settings```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4a6afebc-1511-41b1-938c-9bf4a871ee12)

Ke bagian Webhook -> Add webhook.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8adc5e7f-aadb-4981-87b1-1a8671579e88)

Masukkan Payload URL dengan alamat URL dari jenkins + ditambah ```/github-webhook```. Lalu klik Add Webhook.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/95eedf9b-1a48-4b63-a63f-2ac74dc69701)

Jika sudah, coba buat perubahan pada backend dan push kembali ke github.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/82bc8675-c0d1-429c-a28c-b56787281329)

Lalu cek lagi di jenkins, maka proses build sudah otomatis berjalan ketika user push ke github.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2dad2b8d-6fd9-450c-bef1-1c13544ea59e)
