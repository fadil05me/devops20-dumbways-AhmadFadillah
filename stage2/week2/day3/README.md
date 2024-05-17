Sebelum mengerjakan tugas, mohon persiapkan :
- Akun Github dan buat repository dengan judul "devops20-dumbways-<nama kalian>"
- Gunakan file README.md untuk isi tugas kalian
- Buatlah langkah-langkah pengerjaan tugas beserta dokumentasinya

Repository && Reference:
[wget spider](https://www.labnol.org/software/wget-command-examples/28750/)


Tasks :
[ Jenkins ]
- Buat akun di gitlab.com
- push SCM kalian dari local-server ke gitlab
- Buatlah beberapa Job menggunakan gitlabci untuk aplikasi kalian
  - Job Frontend
  - Untuk script CICD atur flow pengupdate an aplikasi se freestyle kalian dan harus mencangkup
     - Pull dari repository
     - Dockerize/Build aplikasi kita
     - push image ke docker hub
     - Test application
     - pull new image
     - Deploy application
- GitlabCI notification to discord
