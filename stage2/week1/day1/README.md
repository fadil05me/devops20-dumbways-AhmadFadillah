# DAILY TASK DAY 1 - WEEK 1

## TASK 1: Jelasakan langkah-langkah pembuatan VM di BiznetGio

1. Pada Dashboard BIZNETGIO, pilih Compute -> NEO Lite, Lalu Klik tombol ```CREATE NEW```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6a6d486f-8f72-42c9-98da-0a2460aecbef)

2. Pada bagian "Neo Lite Servide Name", masukkan nama server yang diinginkan.

3. Pada bagian "Region" Pilih ```West Java```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/461bf306-1a15-45db-ad1e-de5be1ae12f0)

4. Pada bagian "Product" pilih tipe _spec_ produk yang diinginkan.

5. Pada bagian "Cycle" pilih waktu pembayaran yang diinginkan, baik Bulanan (Monthly) atau Tahunan (Yearly).

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/85e45b2f-1df6-46de-9d29-6b97b1bf3e74)

6. Pada bagian "Operating System" Pilih Sistem Operasi yang diinginkan.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cedf2d01-029a-4a34-b0a1-90d2217b45e2)

7. Pada bagian "SSH Key" Klik ```CREATE SSH KEY```, lalu masukkan nama yang diinginkan dan Klik ```CREATE```.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3371b27e-37b3-448e-a3b8-e4bccecfac1e)

8. Nantinya akan terdownload file sshkey tadi.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b22183b9-ca9f-4d52-8b11-6df7a008055a)

9. Selanjutnya masukkan Username dan Password yang diinginkan, lalu klik Next.

 ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0ab718bf-ae42-4115-89ca-6d67cc7fd5bd)

10. Selanjutnya akan masuk ke metode pembayaran.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e391f26b-4882-4315-8f5a-4eccadd3a933)

11. Jika sudah bayar dan selesai mengorder, maka akan tampil seperti ini.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f6c3237e-802f-4ee1-bef2-f4a92e111bac)

12. Tunggu sampai Statusnya berubah menjadi Active.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2c955c90-7f0a-41d2-9bbd-e3637045f498)

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c0fa9c4-910d-4bfd-8171-f4558ef6b5ff)



## TASK 2: Setelah server sudah terbuat, buatlah suatu user baru lalu implementasikan penggunaan ssh-key pada server tersebut.

  1. Untuk membuat user baru, jalankan command berikut:
  ```
  sudo adduser fz
  ```
  2. Ganti ```fz``` menjadi nama user yang diinginkan.
  Lalu masukkan password dan data - data yang diperlukan.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/391e2df9-18a1-47f8-a4e6-2a2fc577ca5a)

  3. Jika sudah, cek apakah folder dengan nama ```fz``` sudah dibuatkan pada directory home.
  
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9767a3b8-55cc-4219-802e-f8189f01f98c)

  4. Login ke akun yang baru dibuat.

  ```
  su - fz
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/72a63e8d-8274-4de3-95d4-a13318cd8255)

  5. Generate sshkey dengan menggunakan command berikut:

  ```
  ssh-keygen
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8b398a54-82f7-44ce-ba71-1dc9f1ddea3e)

  6. Copy isi file dari id_rsa.pub

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/79322c46-abb9-492a-b031-2f3e013a5880)

  7. Pastekan pada file authorized_keys

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2cb48c4a-5b60-4d66-9478-cd011cc472cf)

  8. Copy isi file id_rsa.

  ![Screenshot 2024-05-01 125031](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e8b9bbbd-e1d5-4acc-9ba8-bcaab7c10731)

  9. Pastekan ke local machine dengan membuat file baru.

  ![Screenshot 2024-05-01 125253](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/029c93fe-f01f-4eb1-b81a-3dad7bd6230c)

  10. Lakukan chmod.

  ```
  chmod 400 fz.pem
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8e477c54-e011-4818-9c34-997ce5d55843)

  11. Login SSH menggunakan sshkey tadi.

  ```
  ssh -i fz.pem fz@103.127.99.163
  ```
  
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2ff0c1fb-76b4-490d-aa1e-f649ac5b60c9)

  12. Jika berhasil akan tampil seperti ini.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e9fd5aa5-4188-458e-ad26-25f4e3487daf)


## TASK 3: Deploy aplikasi Dumbflix-Frontend menggunakan nodejs versi 14.x




## TASK 4: Clone repository Dumbflix-frontend lalu deploy aplikasinya menggunakan PM2
