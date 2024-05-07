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


## TASK 3: Deploy aplikasi Dumbflix-Frontend menggunakan nodejs versi 14.x.

  1. Install NVM

  ```
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0d495fa4-4ff0-4d9f-9939-16ea244320de)

  
  2. Install Nodejs versi 14. Tunggu sampai selesai.

  ```
  nvm i 14
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/86b35f58-f885-4185-b97c-6a5c030c2cde)

  3. Jika sudah, cek versinya.

  ```
  npm -v; node -v
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b3ffd450-a953-4f9c-8396-412c5a11344b)


  4. Clone repo dumbflix-frontend.

  ```
  git clone https://github.com/dumbwaysdev/dumbflix-frontend.git
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2c836498-694e-41c7-8184-59e645d7cab9)

  5. Lakukan ```npm i```, lalu tunggu sampai selesai.

  
  6. Jalankan dengan menggunakan ```npm start```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/99ca8b3e-7cbc-4acf-885e-99f89eae4e50)

  7. Jika sudah coba diakses menggunakan browser.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/522209a0-b58d-479a-b48e-61632fa752e0)

  
## TASK 4: Clone repository Dumbflix-frontend lalu deploy aplikasinya menggunakan PM2

  1. Install pm2.

  ```
  npm i pm2 -g
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2adfb51b-4b87-49ae-8d1c-17c4917da8eb)

  2. Generate file ecosystem.
  ```
  pm2 ecosystem simple
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8920fd0f-b7d0-4ca4-a096-cdc9cb6d111b)

  3. Edit file ecosystem.config.js

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9b63f9b7-46bc-4990-86be-829cfaf78c25)

  4. Jalankan menggunakan pm2

  ```
  pm2 start ecosystem.config.js
  ```
  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f81e141b-19d6-45e6-84ff-32696262759f)

  5. Akses lagi menggunakan browser.

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c214d6f-c32e-47a8-babd-7680b64bad3a)

