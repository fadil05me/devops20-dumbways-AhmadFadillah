# DAY 1: Application In Server

## TASK 1: Perbandingan antara Monolith & Microservices

1. Monolith:
   
   Sebuah aplikasi tunggal yang terintegrasi.

   Kelebihannya:
   - Lebih mudah untuk dikembangkan dan dipahami: Karena semua kode terhubung dalam satu tempat, pengembangan dan debugging lebih mudah.
   - Lebih mudah untuk diuji: Pengujian aplikasi dan integrasi lebih mudah dilakukan karena semua kode terhubung.
   - Lebih hemat biaya: Hanya memerlukan satu server dan satu tim untuk memelihara.
   - Lebih cepat untuk dideploy: Hanya perlu satu deployment untuk meluncurkan seluruh aplikasi.

   Kekurangannya:
   - Lebih sulit untuk diubah: Mengubah satu bagian aplikasi dapat memengaruhi bagian lain.
   - Lebih sulit untuk diskalakan: Seluruh aplikasi harus diskalakan.
   - Lebih rentan terhadap kegagalan: Jika satu bagian aplikasi gagal, seluruh aplikasi akan gagal.

3. Microservices:

   Kumpulan layanan kecil dan independen yang berkomunikasi melalui API.
   
   Kelebihannya:
   - Lebih mudah untuk diubah: Setiap layanan dapat diubah secara independen tanpa memengaruhi layanan lain.
   - Lebih mudah untuk diskalakan: Setiap layanan dapat diskalakan secara independen sesuai kebutuhan.
   - Lebih tahan terhadap kegagalan: Jika satu layanan gagal, layanan lain tidak terpengaruh.
   - Lebih mudah untuk dikembangkan dan dipelihara oleh tim yang berbeda: Setiap layanan dapat dikembangkan dan dipelihara oleh tim yang berbeda.

   Kekurangannya:
   - Lebih kompleks untuk dikembangkan dan dipahami: Karena kode terbagi menjadi banyak layanan, pengembangan dan debugging lebih kompleks.
   - Lebih mahal: Membutuhkan lebih banyak server dan tim untuk memelihara.
   - Lebih lambat untuk dideploy: Setiap layanan perlu di-deploy secara individual.
   - Lebih sulit untuk diuji: Pengujian aplikasi dan integrasi lebih kompleks karena banyak layanan yang saling berhubungan.

  Kesimpulan:
  Monolith lebih cocok untuk aplikasi kecil dan sederhana yang tidak memerlukan skalabilitas tinggi. Microservices lebih cocok untuk aplikasi besar dan kompleks yang membutuhkan skalabilitas tinggi dan ketahanan terhadap kegagalan.


## TASK 2: Deploy Aplikasi [wayshub-frontend](https://github.com/dumbwaysdev/wayshub-frontend?tab=readme-ov-file) (NodeJS)

  Untuk cara install NodeJS ada di tugas challange week2 [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/week2/challenge#1-install-nodejs-using-bash-script)

  

## Task 3: Deploy Golang & Python dengan menampilkan nama masing-masing
   
   1. Python

      Pertama install pip terlebih dahulu

      ```
      sudo apt install pip
      ```
