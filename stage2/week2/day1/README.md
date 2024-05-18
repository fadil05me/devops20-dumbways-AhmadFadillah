# DAILY TASK - DAY 1 - WEEK 2

## DOCKER

Pertama kita lakukan rebuild server.

Masuk ke dashboard biznetgio -> Pilih server mana yang ingin di rebuild -> Klik Stop.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8119bc8b-15ae-4dd3-9cd1-30a8b04761c4)

Jika server sudah stop, Klik tombol ```Rebuild```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2aa0671f-fb18-4169-82f7-f5f644046414)

Selanjutnya pilih OS yang diinginkan, Lalu klik ```Confirm```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58f65d20-39bc-40e4-ba70-eaad160f82dd)

Jika sudah benar, Klik ```Rebuild```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/319dca25-2244-4e04-a1f3-6e70681429a6)

Tunggu sampai proses rebuild selesai, lakukan _Refresh_ secara berkala. Jika sudah berhasil statusnya akan menjadi _Active_.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1fd8cbfb-1979-42ef-b6a3-348bb6e1325a)

Jika sudah aktif, konek ke server menggunakan SSH. Lalu buat user baru.
```
sudo adduser namauser
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/368be14d-e26d-4405-9314-2fae9ccb0ca9)

Lakukan setting SSH Key user baru tadi. Untuk caranya sudah pernah dibahas di Week 1 - Day 1 ada di [SINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week1/day1).

