# DAY 2: Web Server & Load Balancing



## TASK 1: Jelaskan apa itu Web server dan gambarkan bagaimana cara webserver bekerja.

  Web server adalah sebuah program komputer yang berjalan di atas server dan berfungsi untuk melayani permintaan data dari klien (browser web) yang ingin mengakses website.

<p align="center">
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3020da26-1117-4089-a90f-ab67a202d6c3">
</p>



## TASK 2: Buatlah Reverse Proxy untuk aplikasi yang sudah kalian deploy kemarin. (wayshub), untuk domain nya sesuaikan nama masing" ex: alvin.xyz .

  Pertama, masuk ke ```/etc/nginx``` lalu buat folder baru
  
  ```
  cd /etc/nginx && sudo mkdir rev-proxy && ls
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b8c43091-bde1-4389-9e6e-5e5700ae34ee)

  Masuk ke folder yang baru dibuat tadi dan buat file ```reverse-proxy.conf```

  ```
  cd rev-proxy/ && sudo nano reverse-proxy.conf
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b3ca9286-42bf-4224-9b1f-225c892a4073)


  Lalu, masukkan script berikut

  ```
  server {
      server_name fadil.me;
  
      location / {
               proxy_pass http://192.168.134.69:3000;
      }
  }
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/88e796f6-327e-43f7-8d5d-e3315cfbda16)

  
  Jika sudah disimpan, jalankan command berikut untuk mengedit file ```nginx.conf```

  ```
  cd .. && sudo nano nginx.conf
  ```
  
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8eb7fdb7-82c3-4725-a531-d7e6dff5ea34)

  Selanjutnya pergi ke-bagian ```Virtual Host Configs```, setelah itu tambahkan lokasi dari directory yang berisi file konfigutasi tadi.

  ```
  include /etc/nginx/rev-proxy/*;
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4473f23b-4ab4-4fb6-a27a-a11c42fbb4d0)

  Simpan lalu cek apakah file configurasi tersebut benar dan tanpa error

  ```
  sudo nginx -t
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/53b45bf8-4019-418f-9e02-7ab07f65ccd6)


  Jika tanpa error, selanjutnya lakukan reload nginx

  ```
  sudo systemctl reload nginx
  ```
  
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a8599609-eb5a-4455-a3fc-99c690c9c472)


  Selanjutnya, edit file ```hosts```. Disini saya menggunakan windows.
  Caranya:
  - Klik kanan aplikasi Notepad lalu pilih "Run as administrator"
  - Pilih File -> Open
  - Lalu pergi ke ```C:\Windows\System32\drivers\etc```
  - Pada bagian file type ganti menjadi All files
  - Pilih file ```hosts```

  

  

  

## TASK 3: Jelaskan apa itu load balance.

  Load balancing adalah teknik untuk mendistribusikan traffic atau arus kerja secara merata ke beberapa server.

  Tujuan utama load balancing adalah untuk:
  - Mencegah kelebihan beban: Dengan membagi traffic ke beberapa server, load balancing mencegah satu server agar tidak down (tidak bisa diakses) akibat lonjakan pengunjung.
  - Meningkatkan performa: Distribusi beban yang merata membuat website atau aplikasi bisa diakses dengan lebih cepat dan responsif.
  - Meningkatkan ketersediaan: Jika terjadi masalah pada satu server, load balancer bisa mengalihkan traffic ke server lain sehingga website atau aplikasi tetap bisa diakses.

  

## TASK 4: Implementasikan loadbalancing kepada aplikasi wayshub yang telah kalian gunakan.

