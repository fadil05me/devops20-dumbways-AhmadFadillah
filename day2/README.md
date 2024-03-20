# DAY 2 - Networking & VM

## TASK 1: Perbedaan antara IP Private & Public, serta IP Dynamic & Static!

**IP Private:**
- Digunakan untuk jaringan internal, seperti di rumah, kantor atau warnet.
- Tidak dapat diakses secara langsung dari jaringan internet publik.
- Digunakan untuk berkomunikasi antar perangkat dalam jaringan internal.
- Jumlahnya terbatas dan diatur oleh RFC 1918.
- Contoh: 192.168.1.1, 172.16.0.1, 10.0.0.1.
- Internet Assigned Numbers Authority (IANA) telah menetapkan tiga blok alamat IP Private:
     ```
     10.0.0.0        -   10.255.255.255  (10/8 prefix)
     172.16.0.0      -   172.31.255.255  (172.16/12 prefix)
     192.168.0.0     -   192.168.255.255 (192.168/16 prefix)
     ```
**IP Public:**
- Digunakan untuk terhubung ke jaringan internet publik.
- Dapat diakses secara langsung dari jaringan internet publik.
- Digunakan untuk berkomunikasi dengan perangkat lain di internet.
- Jumlahnya lebih banyak.
- Contoh: 8.8.8.8, 1.1.1.1, 208.67.222.222.

**IP Dinamis (Dynamic IP):**
- Didapatkan secara otomatis dari server DHCP (Dynamic Host Configuration Protocol) setiap kali perangkat terhubung ke jaringan.
- Biasanya digunakan pada jaringan rumah atau kantor kecil.
- Alamat IP dapat berubah-ubah ketika perangkat dimatikan dan dihidupkan kembali, atau terhubung ke jaringan yang berbeda.
- _Keuntungan_: Mudah diatur, Hemat biaya bagi penyedia layanan internet (ISP) untuk mengalokasikan IP.
- _Kekurangan_: Sulit untuk mengakses perangkat dari jarak jauh secara konsisten karena alamat IP terus berubah.

**IP Statis (Static IP):**
- Diatur secara manual pada perangkat jaringan dan tidak berubah.
- Biasanya digunakan untuk server, printer jaringan, atau perangkat lain yang perlu diakses secara konsisten dari jarak jauh.
- Memerlukan pengaturan tambahan pada perangkat dan router.
- _Keuntungan_: Memungkinkan akses jarak jauh yang lebih mudah dan konsisten ke perangkat.
- _Kekurangan_: Lebih sulit diatur, Perlu perencanaan dan alokasi IP yang baik agar tidak terjadi konflik IP.


<br>

## TASK 2: Buat penjelasan singkat tentang Virtualization!

Teknologi Virtualization digunakan untuk membagi Resource menjadi lebih kecil untuk dipakai ke lebih banyak Operating System.

<br>

## TASK 3: Buat rancangan sebuah jaringan dengan spesifikasi sebagai berikut!

      - CIDR Block : 192.168.1.xxx/24
      - Subnet : 255.255.255.0
      - Gateway : 192.168.1.1
      (Gunakan app.diagrams.net untuk membuat diagramnya, Referensi gambar sudah disertakan)
<p align="center">
<img src="https://lmsbzzbx.s3.ap-southeast-1.amazonaws.com/attachment/l0j333p1710842722479.png" width="300">
<br>
  <i>Referensi Gambar</i>
</p>
<hr>
<br>

## TASK 4: Buat step-by-step untuk menginstall Virutal Machine via VMware, Virtualbox atau VM pilihan kalian!


### Step 1: Download VMWare (Link Download: <a href="https://customerconnect.vmware.com/en/downloads/details?downloadGroup=WKST-PLAYER-1751&productId=1377&rPId=117008">VMWare 17</a>). Disini saya download yang Windows 64-bit

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7c6d51db-361d-455f-98a1-6e2c006c9d6a" width="50%"/>

### Step 2: Download ISO Ubuntu Server 22.04.4 LTS (Link Download: <a href="https://ubuntu.com/download/server#downloads">Ubuntu Server.iso</a>)

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a6987c75-df42-4437-aabd-966b90bd3d28" width="50%"/>

### Step 3: Install VMWare 17

Buka file installer VMWare yang sudah di download tadi, lalu klik Next
<br>
![Screenshot 2024-03-20 203954](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b2fc3dfa-4554-44f7-a1f4-17e42d379607)
<br><br>
Ceklist pada "I accept the terms..."
<br>
![Screenshot 2024-03-20 204017](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/40fb8d98-87c8-45d1-ad60-61b1317e0771)
<br><br>
Jika Hyper-V diaktifkan, maka akan muncul seperti ini dan ceklist pada bagian "Install Windows Hypervisor Platform (WHP) automatically"
<br>
![Screenshot 2024-03-20 204526](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a535f28a-2a09-4ad3-94c1-07faea6b5170)
<br><br>
Klik Next lagi
<br>
![Screenshot 2024-03-20 204638](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c863457-f7e3-48da-bd52-fa6ab3bcf0bb)
<br><br>
Disini saya hilangkan ceklist pada bagian "Join the VMWare Customer Experience Improvement Program", lalu klik next
<br>
![Screenshot 2024-03-20 204733](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f8d46e4-bcdb-4b59-8662-66a969408272)
<br><br>
Ceklist keduanya, Next...
<br>
![Screenshot 2024-03-20 204748](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b55d90b6-ebaa-405b-b0df-620cc686a128)
<br><br>
Lalu klik "Install"
<br>
![Screenshot 2024-03-20 204757](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a678d5ed-8c07-4f17-a289-c1641b57ae30)
<br><br>
Tunggu sampai proses selesai
<br>
![Screenshot 2024-03-20 205115](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7fab3536-cca2-4995-98ba-cea8265e8757)
<br><br>
