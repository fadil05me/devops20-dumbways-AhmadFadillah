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

Jika terdapat error, Install ulang pluginnya sampai berhasil. Pastikan ceklist pada ```Restart Jenkins when installation is complete...```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6a2300f-3be2-4602-afe4-21c599eea567)

