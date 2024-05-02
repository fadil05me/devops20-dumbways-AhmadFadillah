# DAILY TASK DAY 2 - WEEK 1

 
## Install nginx

  Gunakan command berikut untuk install Nginx:
  ```
  sudo apt install nginx
  ```
  Jika sudah terinstall, akses menggunakan browser.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/759392fe-55ae-4f33-981f-0f84a4c51b56)

  
## Buatlah reverse proxy dan gunakan domain dengan nama kalian (ex. amanda.studentdumbways.my.id)


  Masuk ke Cloudflare, Masuk ke DNS lalu buat subdomain baru dengan mempointing ke server IP.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9d621eb9-2181-4841-ad73-4adb4469a1ce)

  Buat folder baru dan buat file configurasi baru di folder ```/etc/nginx```.
  
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/99231151-51ea-4237-940f-14fbf9a04b54)

  Edit file config tadi dan tambahkan ini:

  ```
  server {
        server_name fadil.studentdumbways.my.id;
  
        location / {
                 proxy_pass http://127.0.0.1:3000;
        }
  }
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0f020755-eb5a-4ad7-9824-e1b0a1e6dca3)


  Selanjutnya edit file configurasi dari nginx.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3849f34c-b3f6-4e92-91cf-fc19dbf56cd7)

  Tambahkan pada bagian ```Virtual Host Configs``` folder yang barusan dibuat.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d546280c-d8ee-423f-9e7a-0c74853e6a2a)

  Selanjutnya cek file configurasi nginx.
  ```
  sudo nginx -t
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/91a65d51-13e9-4dbc-8524-548ab3cf58e5)

  Jika sudah, lakukan reload nginx.
  ```
  sudo systemctl reload nginx
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cb1414e6-aef8-4439-b345-199a04b6df57)

  Sekarang akses websitenya menggunakan browser. <a href="http://fadil.studentdumbways.my.id/">fadil.studentdumbways.my.id</a>

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8ab4b5cb-d3f5-4e45-8857-1bc0a38f5adc)
  

## Gunakan SSL pada domain
