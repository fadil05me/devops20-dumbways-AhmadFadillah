# DAY 2 - Networking & VM

## TASK 1: Perbedaan antara IP Private & Public, serta IP Dynamic & Static!

**IP Private:**
- Digunakan untuk jaringan internal, seperti di rumah, kantor atau warnet.
- Tidak dapat diakses secara langsung dari jaringan internet publik.
- Jumlahnya terbatas.
- Contoh: 192.168.1.1, 172.16.0.1, 10.0.0.1.

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
- _Keuntungan_: Lebih mudah diatur.
- _Kekurangan_: Sulit untuk mengakses perangkat dari jarak jauh secara konsisten karena alamat IP terus berubah.

**IP Statis (Static IP):**
- Diatur secara manual pada perangkat jaringan dan tidak berubah.
- Biasanya digunakan untuk server, printer jaringan, atau perangkat lain yang perlu diakses secara konsisten dari jarak jauh.
- Memerlukan pengaturan tambahan pada perangkat dan router.
- _Keuntungan_: Akses jarak jauh yang lebih mudah dan konsisten ke perangkat.
- _Kekurangan_: Lebih sulit diatur, Perlu perencanaan dan alokasi IP yang baik agar tidak terjadi konflik IP.


<br>

## TASK 2: Buat penjelasan singkat tentang Virtualization!

Teknologi Virtualization digunakan untuk membagi Resource menjadi lebih kecil agar dapat dipakai ke lebih banyak Operating System.

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

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7c6d51db-361d-455f-98a1-6e2c006c9d6a" width="70%"/>
<br><br>

### Step 2: Download ISO Ubuntu Server 22.04.4 LTS (Link Download: <a href="https://ubuntu.com/download/server#downloads">Ubuntu Server.iso</a>)

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a6987c75-df42-4437-aabd-966b90bd3d28" width="70%"/>
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
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/55b04359-f6e0-4b9d-b666-a5610ca5557f" width="70%"/>
<br><br>
Pilih "Installer disc image file (iso)" lalu klik "Browse...".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0cc980e3-6ee3-47d7-954c-449d99b07a3f" width="70%"/>
<br><br>
Cari file iso Ubuntu server yang sudah di download tadi lalu klik "Open".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/12f108a8-0706-487e-8b7c-e2231812480d" width="80%"/>
<br><br>
Klik Next
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e7cf7b7d-7897-401a-be99-86605215cc57" width="70%"/>
<br><br>
Pada bagian Location, bisa disesuaikan dimana nantinya akan menyimpan file VM dari ubuntu server. Jika sudah ok klik Next.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fa3c4687-20d8-44dd-a966-39513efd2ca7" width="70%"/>
<br><br>
Selanjutnya, pada Maximum disk size isi berapa jumlah maximal storage yang akan diberikan untuk Ubuntu Server. Disini saya menggunakan 10GB Storage dan memilih "Split virtual disk into multiple files".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f06d8cf-c3c5-41c8-8f0d-b2407ab03c9c" width="70%"/>
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
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2fa0e9e-c090-4ca9-aac6-790e5216fce0" width="70%"/>
<br><br>
Ceklist pada bagian "Power on this virtual machine after creation" lalu Klik "Finish".
<br>
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0922560a-7fad-4a5d-9441-adae29041c54)
<br><br>
Tunggu sampai muncul seperti ini, lalu tekan "Enter" pada keyboard.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/414b9c90-5d75-4862-9ac6-b2d11f33a807" width="80%"/>
<br><br>
Tunggu hingga tampilan seperti ini, Silahkan pilih bahasa yang diinginkan. Disini saya menggunakan bahasa Inggris. Jika sudah tekan Enter.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/32fe75ec-3585-490f-a2a5-ba57e200a771" width="80%"/>
<br><br>
Selanjutnya, ini adalah tampilan untuk memilih layout keyboard. Disini saya langsung pilih "Done".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/61a1af10-a721-4edf-b64f-da76f7d0a11a" width="80%"/>
<br><br>
Disini saya juga langsung pilih "Done".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f371796d-d5e3-4c51-9236-73da17d7763f" width="80%"/>
<br><br>
Pada bagian ens33 tekan enter, lalu kebawah kebagian "Edit IPv4" enter.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3cc88138-9fcc-4ea3-b321-951f028f7bd6" width="80%"/>
<br><br>
Pada bagian "IPv4 Method:" ganti menjadi Manual.
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/13b30ad7-ed92-4078-b677-948a6c99eeeb" width="80%"/>
<br><br>
Sesuaikan dengan IP adapter wifi tadi, dengan catatan pada Address angka terakhir harus berbeda. Jika sudah pilih Save dan Done.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/791d42ba-cdd8-44ae-a95c-fb856c992342" width="80%"/>
<br><br>
Pada bagian ini saya langsung Done
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/06027671-2113-4b22-a85a-d22625d0da08" width="80%"/>
<br><br>
Done lagi...
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8ba70f61-7726-43e3-ad80-c25861d4ad59" width="80%"/>
<br><br>
Pilih "Custom Storage Layout", lalu Done.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4b60ccc4-d516-42f8-95a1-d61eb042e97a" width="80%"/>
<br><br>
Pilih pada bagian "free space", lalu pilih "Add GPT Partition".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7b3fe255-e0d8-4842-b4f1-ef4c36be2603" width="80%"/>
<br><br>
Size disini saya isi "8G" yaitu 8 Giga Byte, formatnya pilih "ext4", mount pilih "/". Lalu Create.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1e1d94c2-c5a3-48d0-8ceb-051eec11d21f" width="80%"/>
<br><br>
Selanjutnya kita tambahkan Swap Space dengan mengulangi cara diatas tadi, untuk Sizenya "1.800G" lalu formatnya "swap".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9cd2bd94-566a-48b5-b493-376b764ef4af" width="80%"/>
<br><br>
Untuk hasilnya seperti ini, Selanjutnya pilih Done dan Continue.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/197ee9f5-6cb8-4b56-b3dd-96cc9b81df19" width="60%"/>
<br><br>
Masukkan nama, nama server, username, dan password sesuai kebutuhan. Jika sudah pilih "Done".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b89ab985-2092-4492-822b-39faf637090f" width="60%"/>
<br><br>
Pada bagian ini pilih "Skip for now", lalu "Continue".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f93a8b85-a2ec-4a05-bedb-a20466e95694" width="60%"/>
<br><br>
Berikan tanda "X" pada "Install OpenSSH Server", lalu Done.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/367e6ad4-6976-481c-be17-d1e62b0c55fd" width="60%"/>
<br><br>
Disini saya langsung pilih Done.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ca130f56-2b16-47f8-8dad-1efdcf215fa1" width="60%"/>
<br><br>
Tunggu sampai proses installasi selesai.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a9d5e081-585d-4d7d-9972-a6f9d9f0164b" width="60%"/>
<br><br>
Jika sudah selesai, pilih "Reboot Now".
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/dffca4fe-65a2-4105-8ca8-adc33679e041" width="60%"/>
<br><br>
Jika sudah sampai sini, silahkan login dengan menginput username lalu password.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/298f4fc0-ac8c-41d2-b793-048920ac28bc" width="60%"/>
<br><br>
Jika sudah login, maka tampilannya seperti ini.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/23cf12b0-1dd6-4167-9a3f-a891bbb11011" width="60%"/>

