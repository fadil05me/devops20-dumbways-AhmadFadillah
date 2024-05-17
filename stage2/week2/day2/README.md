Sebelum mengerjakan tugas, mohon persiapkan :
- Akun Github dan buat repository dengan judul "devops20-dumbways-<nama kalian>"
- Gunakan file README.md untuk isi tugas kalian
- Buatlah langkah-langkah pengerjaan tugas beserta dokumentasinya

Repository && Reference:
[Certbot](https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal)
[PM2 Runtime With Docker](https://pm2.keymetrics.io/docs/usage/docker-pm2-nodejs)
[Cloudflare](https://dash.cloudflare.com/0d0e2eb306a3b985375cf565cb4ce3fc/studentdumbways.my.id/dns/records)
[Wildcard SSL](https://www.bjornjohansen.com/wildcard-certificate-letsencrypt-cloudflare)
[Jenkins Installation](https://www.jenkins.io/doc/book/installing/)
[Jenkins Reverse proxy](https://www.jenkins.io/doc/book/system-administration/reverse-proxy-configuration-with-jenkins/reverse-proxy-configuration-nginx)
[wget spider](https://www.labnol.org/software/wget-command-examples/28750/)

Tasks :
[ Jenkins ]
- Jelasakan langkah-langkah melakukan rebuild server BiznetGio, dan ubah menggunakan os ubuntu22
- Installasi Jenkins on top Docker or native
- Setup SSH-KEY di local server jenkins kalian, agar dapat login ke dalam server menggunakan SSH-KEY 
- Reverse Proxy Jenkins
  - gunakan domain ex. pipeline-team1.studentdumbways.my.id
  - reverse proxy sesuaikan dengan ketentuan yang ada di dalam Jenkins documentation
- Buatlah beberapa Job untuk aplikasi kalian
  - Job Backend
  - Untuk script CICD atur flow pengupdate an aplikasi se freestyle kalian dan harus mencangkup
     - Pull dari repository
     - Dockerize/Build aplikasi kita
     - Push ke Docker Hub
     - Test application
     - Deploy aplikasi on top Docker
- Auto trigger setiap ada perubahan di SCM
- Buat job notification ke discord
