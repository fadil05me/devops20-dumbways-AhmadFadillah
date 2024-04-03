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
   
   Jika NodeJS sudah terinstall, ganti ke nodejs versi 14 dengan menggunakan command berikut

   ```
   npm install 14
   ```

   Jika sudah, cek versi node yang dijalankan dengan menggunakan command berikut

   ```
   node -v
   ```

   ![4](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f30dc227-b55a-42d0-b7e6-4fd6e57acc75)

   Lalu jalankan ```nvm install``` dan tunggu sampai selesai

   ![5](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a9eb1ea3-1cd9-4686-a56f-16c6d2b1efb2)

   Jika sudah selesai, run aplikasi dengan menggunakan command berikut

   ```
   npm run start
   ```

   ![6](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e5feed43-4c11-4dec-a82e-84199f643322)

   Jika sudah berjalan akan tampil seperti ini

   ![7](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/155ca1b2-4ef8-448d-94d7-66616fbf0f32)

   Buka browser dan cek apakah aplikasi bisa dibuka

   ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/795f8a14-e9a0-4f85-8b7d-5c7b1c3ea06e)

  

## Task 3: Deploy Golang & Python dengan menampilkan nama masing-masing
   
   1. Python

      Pertama install pip terlebih dahulu

      ```
      sudo apt install pip -y
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1ac86c71-edb9-44ca-9c5e-add623adace9)

      Lalu install flask

      ```
      pip install flask
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7e1a9527-7e28-45ad-8091-f31aadd471ca)

      Buat file ```index.py```

      ```
      nano index.py
      ```

      Lalu isi dengan script ini

      ```
      from flask import Flask
      app = Flask(__name__)
      @app.route("/")
      def helloworld():
          return "Ahmad Fadillah"
      if __name__ == "__main__":
          app.run(host='0.0.0.0')
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9406ddf4-022b-4e4e-8373-448f29ebb0e3)

      Simpan dan jalankan scriptnya dengan menggunakan command berikut:

      ```
      python3 index.py
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2f6095f8-209e-4357-b736-73e3fd3448b8)

      Hasil di browser:

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9d510434-8c89-489e-93a9-b03c1848267b)

   2. Golang

      Pertama install golang terlebih dahulu

      ```
      wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz && sudo su
      ```
      
      ![1](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bec3ec10-606d-45c0-81ab-bd9805bcaa32)

      Tunggu sampai proses download selesai, lalu nanti diminta password

      ![3](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6d89df6e-9e8f-4346-983d-6a4e114c435a)

      Selanjutnya, jalankan command berikut

      ```
      rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz && exit
      ```

      ![5](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/916242d6-cbd3-44bf-97a3-1479be98a596)

      Selanjutnya, masukkan path go pada file ```.bashrc```

      ```
      cd && sudo nano .bashrc
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/55061603-2cec-4c1e-9adf-f7be809f3d58)

      Masukkan script berikut di paling bawah 

      
      ```
      export PATH=$PATH:/usr/local/go/bin
      ```

      ![7](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/76f56bbf-13db-4d4f-a8ad-56cbc7b9daf8)

      Lakukan refresh terminal

      ```
      exec bash
      ```
      
      Lalu, cek versi go

      ```
      go version
      ```

      ![8](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a665229d-5171-4935-a79d-76868f735cfd)
      
      Masuk ke dalam folder golang, lalu buat file ```index.go```

      ```
      cd golang/ && nano index.go
      ```

      Lalu masukkan script berikut

      ```
      package main

      import "fmt"
      
      func main() {
          fmt.Println("Ahmad Fadillah")
      }
      ```
      
      ![10](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8e5f233b-308d-4387-98dc-0df8c3dfb0c3)

      Simpan filenya, lalu jalankan programnya

      ```
      go run index.go
      ```

      ![11](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f58171a1-40d4-45c9-bb71-b0b8c680906b)

      Jika aplikasinya ingin dibuild, jalankan command berikut

      ```
      go build index.go
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/53abd0a1-badb-4e44-8964-1ec06c5daea6)

      Untuk menjalankannya, jalankan command berikut

      ```
      ./index.go
      ```

      ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/168611c8-b962-486e-ada7-fb5dbdc80f20)
