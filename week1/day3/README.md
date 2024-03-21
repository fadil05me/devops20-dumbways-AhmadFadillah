# DAY 3 - Operating System & Linux Server

## TASK 1: Cari perbedaan antara distro Ubuntu dan CentOS!

<table>
  <tr>
    <th>
      Ubuntu
    </th>
    <th>
      CentOS
    </th>
  </tr>
  
  <tr>
    <td>
      Berbasis Debian, yang mempunyai paket file ".deb" dan package manager "apt".
    </td>
    <td>
      Berbasis Red Hat Enterprise Linux (RHEL), yang mempunyai paket file ".rpm" dan package manager "yum".
    </td>
  </tr>
  <tr>
    <td>
      Jadwal rilis secara reguler dan update yang cukup sering. Hal ini membuat Ubuntu cocok untuk pengguna yang menginginkan software terbaru.
    </td>
    <td>
      Lebih mengutamakan stabilitas dengan siklus rilis lebih lama dan update yang lebih jarang. Cocok untuk server yang membutuhkan uptime tinggi dan kemananan terjamin.
    </td>
  </tr>
  <tr>
    <td>
      Lebih <i>User-Friendly</i>, dengan komunitas besar dan banyak tersedia dokumentasi serta tutorial.
    </td>
    <td>
      Lebih condong untuk pengguna profesional dan administrator server, yang membutuhkan sistem operasi yang stabil dan handal.
    </td>
  </tr>
</table>


## TASK 2: Apa perbedaan dari CLI & GUI?

**GUI (Graphical User Interface)**
- Menggunakan elemen visual seperti ikon, window, dan menu. User berinteraksi dengan meng-klik mouse dan input teks.
- Lebih mudah dipelajari dan digunakan, tidak perlu menghafal _command_.


**CLI (Command Line Interface)**
- Berbasis teks. Pengguna mengetikkan perintah (command) untuk melakukan suatu tindakan.
- Memerlukan pengetahuan tentang _command_ dan strukturnya.

## TASK 3: Di VM masing-masing :
```
- Install nginx, lalu akses melalui browser/ `curl <ip kalian>`
- Ganti IP address kalian (bebas) lalu akses kembali nginx (`/etc/netplan`)
```

### **Install Nginx**

Jalankan command berikut:
```
sudo apt install nginx
```
Tekan y dan enter. Lalu tunggu hingga proses selesai.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ccf0bb5e-cef8-4a9e-a9c8-b64fd5eb0583" width="50%"/>
<br><br>
Cek dengan menggunakan browser.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4009d150-1e2e-498e-9685-42f9b76cedab" width="50%"/>
<br><br>
### **Ganti IP address**

Pergi ke directory /etc/netplan
```
cd /etc/netplan
```
Selanjutnya edit file 00-installer-config.yaml
```
sudo nano 00-installer-config.yaml
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7abe1379-1f0f-4ea5-aa2f-7d1129da37db" width="50%"/>
<br><br>
Lalu ganti pada bagian addresses dari ip lama (192.168.253.69/24) ke ip baru (192.168.253.169/24). Jika sudah, tekan ctrl+x lalu tekan "y" dan enter.
<br>

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8912a9fb-d8ff-42a9-9845-793f77481f2b" width="50%"/>

<br><br>
Selanjutnya, jalankan command berikut:
```
sudo netplan apply
```
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/191efaa6-ed44-4790-bb06-008aeb8361f9" width="50%"/>
<br><br>
Cek lagi menggunakan browser
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4113f6de-9f02-4304-8b44-9bf0cf46a08d" width="50%"/>


## TASK 4: Terangkan fungsi systemctl dan contoh commandnya (gunakan nginx)

Fungsi utama dari systemctl adalah untuk mengelola service.

Contoh penggunaan dari systemctl adalah sbb:

- Memulai Service
  ```
  sudo systemctl start nginx
  ```
- Menghentikan service
  ```
  sudo systemctl stop nginx
  ```
- Memeriksa status service
  ```
  sudo systemctl status nginx
  ```
- Memulai ulang (Restart) service
  ```
  sudo systemctl restart nginx
  ```
- Mengaktifkan service agar otomatis berjalan saat boot
  ```
  sudo systemctl enable nginx
  ```
- Menonaktifkan service agar tidak berjalan otomatis saat boot
  ```
  sudo systemctl disable nginx
  ```
