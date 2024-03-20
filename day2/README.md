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


## TASK 4: Buat step-by-step untuk menginstall Virutal Machine via VMware, Virtualbox atau VM pilihan kalian!


### Step 1: Download VMWare (Link Download: <a href="https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_workstation_player/17_0)https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_workstation_player/17_0">VMWare 17</a>)


