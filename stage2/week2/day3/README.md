![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/af983d41-e95b-489f-aa6f-0dba0b9664c2)# DAILY TASK - DAY 2 - WEEK 2

## CICD Using GitlabCI

Login ke akun gitlab, lalu pilih Group -> New group

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8e573c71-21f8-464e-9a7c-3994b2da66af)

Pada bagian group name isi nama yang diinginkan, dan pastikan Visibility level adalah ```Public```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/61ef371f-15b8-4ae0-8b74-2013422cdcca)

Selanjutnya, bisa sesuaikan dengan kebutuhan...

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/84421989-9a2e-4fad-8a65-8ce60781adc8)

Jika sudah terbuat, buat project baru dengan mengklik ```Create new project```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58cebef9-88d8-478f-bae1-fe9bbb615e13)

Pilih ```Create blank project```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ca4978e6-29d1-4ddd-8aa3-4c6c2a861cfb)

Project name isi nama project yang nantinya akan dijadikan sebagai alamat repository. Dan pada bagian ```Visibility Level``` pastikan ganti ke ```Public```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58e28ca4-3217-48d4-9772-7d37dc0b8cf3)

Jika sudah dibuat, maka akan muncul seperti ini.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/253ea7bf-5676-46d4-b72c-db90e76e8b31)

Selanjutnya Klik ```Preferences```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/33971147-6cd4-499a-b375-f0d402b5944d)

Lalu Klik ```SSH Keys``` -> ```Add new key```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0eebe32d-2cf9-415e-bbec-02d3b2146cce)

Disini masukkan public key dari server frontend.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0201e7e6-8f51-4c6c-87df-575b413c98b7)

Jika sudah, masuk ke server frontend dan lakukan test koneksi ssh.
```
ssh -T git@gitlab.com
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5393dec1-532b-46fd-b8b5-b79d8a0bba9c)

Selanjutnya masuk ke folder dimana server frontend berada.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/30a53ba3-07b9-4b41-910f-19c214f75121)

Jalankan command berikut. Sesuaikan username dan emailnya.
```
git config --global user.name "Team 2" && git config --global user.email "email@gmail.com"
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/582b27d5-7107-478d-bfcd-3f3b3cd4fa51)

Jika sudah, Lakukan initialisasi dan push ke gitlab repository.
```
git init && git remote add origin git@gitlab.com:your_group/your_repo.git && git add . && git commit -m "Initial commit" && git push origin main
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f0795a4-3bce-4cae-8e16-690bace79271)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9ccf2772-e9a3-4a35-aa20-1a0c3fbb3d78)

Cek kembali repository yang barusan dibuat.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c65d6c5b-ccb2-4433-80b8-2c9faccd1aed)

Kembali lagi ke directory server frontend, lalu buat file dengan nama ```.gitlab-ci.yml```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/05cdcde0-61fd-43bd-9a8e-feee1c27f7ec)

Kemudian, masukkan script berikut. Sesuaikan dengan keperluan.
```
stages:
  - pull
  - build
  - test
  - deploy

variables:
  GIT_REPOSITORY: "https://gitlab.com/team-2-dumbways/wayshub-frontend.git"
  GIT_BRANCH: "main"

pull:
  stage: pull
  image: alpine:latest
  before_script:
    - apk add --no-cache openssh-client
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
  script:
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$BUILD_HOST "git clone --branch $GIT_BRANCH $GIT_REPOSITORY"

build:
  stage: build
  image: alpine:latest
  before_script:
    - apk add --no-cache openssh-client
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
  script:
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$BUILD_HOST "
        cd $TEST_DIR &&
        docker build -t $DOCKER_IMAGE -f Dockerfile-prod . &&
        docker login -u $DOCKER_REGISTRY_USERNAME -p $DOCKER_REGISTRY_PASSWORD &&
        docker push $DOCKER_IMAGE"
  dependencies:
    - pull

test:
  stage: test
  image: alpine:latest
  before_script:
    - apk add --no-cache openssh-client
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
  script:
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$BUILD_HOST "cd $TEST_DIR && docker run -d --name testcode -p 3009:80 $DOCKER_IMAGE"
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$BUILD_HOST "if wget -q --spider http://127.0.0.1:3009/; then echo 'Website up'; else echo 'Website down'; docker rm -f testcode; rm -rf $TEST_DIR; exit 1; fi"
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$BUILD_HOST "docker rm -f testcode && rm -rf $TEST_DIR"

deploy:
  stage: deploy
  image: alpine:latest
  before_script:
    - apk add --no-cache openssh-client
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    - chmod 600 ~/.ssh/id_rsa
  script:
    - ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa $USERNAME@$DEPLOY_HOST "cd $DEPLOY_DIR && docker pull $DOCKER_IMAGE && docker compose down && docker compose up -d"
  dependencies:
    - build
  only:
    - main
```

Jika sudah disimpan.

Selanjutnya Login ke ```Docker Hub```. Lalu buat repository baru.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c07bc95c-255b-4b78-a019-128bacd85150)

Masukkan nama repository dan pastikan Visibility ```Public```.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2651a047-9e29-4186-bf46-0ac52b219a3b)

Jika sudah dibuat, kembali ke gitlab -> Settings -> CI/CD -> Variables -> Expand -> Add Variable.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6d638848-cb7d-4461-aa05-b83fc74f66af)

Masukkan semua variable yang dibutuhkan.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/dd547c06-ee01-469c-91ee-f219b77b9883)

Berikut adalah variable yang dibutuhkan.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a6409c40-54dc-4500-b8f6-fecdf8e4c707)

Jika sudah, kembali ke server frontend lalu push perubahan ke repository.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5df954a7-b0a3-462f-9061-595eaf77fed6).

Cek di gitlab -> Build -> Pipelines.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c1f1887-014a-47c5-9088-1e67c43c165b)

Nanti akan berjalan secara otomatis.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/343648ac-c315-4e5c-9599-a37810753854)

Jika proses sudah selesai tanpa error maka akan tampil seperti ini.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/03ebc06d-5635-4900-b091-38f168fe85bb)

Selanjutnya pergi ke Settings -> Integrations -> Cari Discord Notifications -> Configure.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1b3c7c70-41e2-4cc3-b843-dc75f7a62e94)

Pastikan ```Enable Integration``` terceklist. Dan semua terceklist kecuali dipaling bawah.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0da127a3-7d3d-4660-ba55-24e8199ea345)

