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

**Hasil:**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4f968484-3222-45b5-a8ff-be479da2ce39)


<br><br>


## TASK 4: Buat step-by-step untuk menginstall Virutal Machine via VMware, Virtualbox atau VM pilihan kalian!


### Step 1: Download VMWare (Link Download: <a href="https://customerconnect.vmware.com/en/downloads/details?downloadGroup=WKST-PLAYER-1751&productId=1377&rPId=117008">VMWare 17</a>). Disini saya download yang Windows 64-bit

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7c6d51db-361d-455f-98a1-6e2c006c9d6a" width="50%"/>
<br><br>

### Step 2: Download ISO Ubuntu Server 22.04.4 LTS (Link Download: <a href="https://ubuntu.com/download/server#downloads">Ubuntu Server.iso</a>)

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a6987c75-df42-4437-aabd-966b90bd3d28" width="50%"/>
<br><br>

### Step 3: Install VMWare 17

Buka file installer VMWare yang sudah di download tadi, lalu klik Next.
<br>
![Screenshot 2024-03-20 203954](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b2fc3dfa-4554-44f7-a1f4-17e42d379607)
<br><br>
Ceklist pada "I accept the terms...".
<br>
![Screenshot 2024-03-20 204017](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/40fb8d98-87c8-45d1-ad60-61b1317e0771)
<br><br>
Jika Hyper-V diaktifkan, maka akan muncul seperti ini dan ceklist pada bagian "Install Windows Hypervisor Platform (WHP) automatically".
<br>
![Screenshot 2024-03-20 204526](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a535f28a-2a09-4ad3-94c1-07faea6b5170)
<br><br>
Klik Next lagi.
<br>
![Screenshot 2024-03-20 204638](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c863457-f7e3-48da-bd52-fa6ab3bcf0bb)
<br><br>
Disini saya hilangkan ceklist pada bagian "Join the VMWare Customer Experience Improvement Program", lalu klik next.
<br>
![Screenshot 2024-03-20 204733](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f8d46e4-bcdb-4b59-8662-66a969408272)
<br><br>
Ceklist keduanya, Next...
<br>
![Screenshot 2024-03-20 204748](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b55d90b6-ebaa-405b-b0df-620cc686a128)
<br><br>
Lalu klik "Install".
<br>
![Screenshot 2024-03-20 204757](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a678d5ed-8c07-4f17-a289-c1641b57ae30)
<br><br>
Tunggu sampai proses selesai.
<br>
![Screenshot 2024-03-20 205115](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7fab3536-cca2-4995-98ba-cea8265e8757)
<br><br>

### Step 4: Install Ubuntu Server di VMWare
Jalankan aplikasi VMWare lalu klik Player -> File -> New Virtual Machine... atau dengan menekan tombol CTRL + N pada keyboard.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/55b04359-f6e0-4b9d-b666-a5610ca5557f" width="50%"/>
<br><br>
Pilih "Installer disc image file (iso)" lalu klik "Browse...".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0cc980e3-6ee3-47d7-954c-449d99b07a3f" width="50%"/>
<br><br>
Cari file iso Ubuntu server yang sudah di download tadi lalu klik "Open".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/12f108a8-0706-487e-8b7c-e2231812480d" width="70%"/>
<br><br>
Klik Next
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e7cf7b7d-7897-401a-be99-86605215cc57" width="50%"/>
<br><br>
Pada bagian Location, bisa disesuaikan dimana nantinya akan menyimpan file VM dari ubuntu server. Jika sudah ok klik Next.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fa3c4687-20d8-44dd-a966-39513efd2ca7" width="50%"/>
<br><br>
Selanjutnya, pada Maximum disk size isi berapa jumlah maximal storage yang akan diberikan untuk Ubuntu Server. Disini saya menggunakan 10GB Storage dan memilih "Split virtual disk into multiple files".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f06d8cf-c3c5-41c8-8f0d-b2407ab03c9c" width="50%"/>
<br><br>
Pilih "Customize Hardware...".
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7bbdd0d4-f205-4811-986a-bfa0a2f6b4b1)
<br><br>
Disini saya menggunakan Memory sebanyak 2GB dan Processor 2 Core.
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7397fdb4-13ce-40ec-9de2-6c54d8e275df)
<br><br>
Pada bagian Network Adapter, Pilih "Bridged" lalu klik "Configure Adapter".
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/95537d3f-be9e-4a0e-b862-6dee7be70dc7)
<br><br>
Disini jaringan internet komputer saya menggunakan wifi, maka saya pilih adapter wifi.
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/157cc363-e97f-41cc-a944-d75e5a850a88)
<br><br>
Untuk cara melihat adapter wifi yang digunakan, Tekan Start di Windows lalu cari "Control Panel", pilih Network and Internet -> Network and Sharing Center -> Klik nama jaringan / wifi yang digunakan (angka 1 di gambar) -> Klik Details. Di description itu adalah nama network adapternya.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7d828a3f-195b-4c8b-bde1-242dc7ceb309" width="80%"/>
<br><br>
Selanjutnya, Klik "Close"
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2fa0e9e-c090-4ca9-aac6-790e5216fce0" width="50%"/>
<br><br>
Ceklist pada bagian "Power on this virtual machine after creation" lalu Klik "Finish".
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0922560a-7fad-4a5d-9441-adae29041c54)
<br><br>
Tunggu sampai muncul seperti ini, lalu tekan "Enter" pada keyboard.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/414b9c90-5d75-4862-9ac6-b2d11f33a807" width="50%"/>
<br><br>
Tunggu hingga tampilan seperti ini, Silahkan pilih bahasa yang diinginkan. Disini saya menggunakan bahasa Inggris. Jika sudah tekan Enter.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/32fe75ec-3585-490f-a2a5-ba57e200a771" width="70%"/>
<br><br>
Selanjutnya, ini adalah tampilan untuk memilih layout keyboard. Disini saya langsung pilih "Done".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/61a1af10-a721-4edf-b64f-da76f7d0a11a" width="70%"/>
<br><br>
Disini saya juga langsung pilih "Done".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f371796d-d5e3-4c51-9236-73da17d7763f" width="70%"/>
<br><br>
Pada bagian ens33 tekan enter, lalu kebawah kebagian "Edit IPv4" enter.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3cc88138-9fcc-4ea3-b321-951f028f7bd6" width="70%"/>
<br><br>
Pada bagian "IPv4 Method:" ganti menjadi Manual.
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/13b30ad7-ed92-4078-b677-948a6c99eeeb" width="70%"/>
<br><br>
Sesuaikan dengan IP adapter wifi tadi, dengan catatan pada Address angka terakhir harus berbeda. Jika sudah pilih Save.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/791d42ba-cdd8-44ae-a95c-fb856c992342" width="70%"/>
<br><br>
