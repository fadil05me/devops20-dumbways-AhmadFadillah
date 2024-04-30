

TASK 1: Jelasakan langkah-langkah pembuatan VM di BiznetGio

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



- Setelah server sudah terbuat, buatlah suatu user baru lalu implementasikan penggunaan ssh-key pada server tersebut.
- Deploy aplikasi Dumbflix-Frontend menggunakan nodejs versi 14.x
- Clone repository Dumbflix-frontend lalu deploy aplikasinya menggunakan PM2
