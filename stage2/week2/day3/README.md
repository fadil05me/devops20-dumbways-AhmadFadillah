# DAILY TASK - DAY 2 - WEEK 2

## CICD Using GitlabCI

Login ke akun gitlab, lalu pilih Group -> New group

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8e573c71-21f8-464e-9a7c-3994b2da66af" width="50%" />

Pada bagian group name isi nama yang diinginkan, dan pastikan Visibility level adalah ```Public```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/61ef371f-15b8-4ae0-8b74-2013422cdcca" width="50%" />

Selanjutnya, bisa sesuaikan dengan kebutuhan...

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/84421989-9a2e-4fad-8a65-8ce60781adc8" width="50%" />

Jika sudah terbuat, buat project baru dengan mengklik ```Create new project```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58cebef9-88d8-478f-bae1-fe9bbb615e13" width="50%" />

Pilih ```Create blank project```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ca4978e6-29d1-4ddd-8aa3-4c6c2a861cfb" width="50%" />

Project name isi nama project yang nantinya akan dijadikan sebagai alamat repository. Dan pada bagian ```Visibility Level``` pastikan ganti ke ```Public```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/58e28ca4-3217-48d4-9772-7d37dc0b8cf3" width="50%" />

Jika sudah dibuat, maka akan muncul seperti ini.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/253ea7bf-5676-46d4-b72c-db90e76e8b31" width="50%" />

Selanjutnya Klik ```Preferences```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/33971147-6cd4-499a-b375-f0d402b5944d" width="50%" />

Lalu Klik ```SSH Keys``` -> ```Add new key```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0eebe32d-2cf9-415e-bbec-02d3b2146cce" width="50%" />

Disini masukkan public key dari server frontend.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0201e7e6-8f51-4c6c-87df-575b413c98b7" width="50%" />

Jika sudah, masuk ke server frontend dan lakukan test koneksi ssh.
```
ssh -T git@gitlab.com
```
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5393dec1-532b-46fd-b8b5-b79d8a0bba9c" width="50%" />

Selanjutnya masuk ke folder dimana server frontend berada.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/30a53ba3-07b9-4b41-910f-19c214f75121" width="50%" />

Jalankan command berikut. Sesuaikan username dan emailnya.
```
git config --global user.name "Team 2" && git config --global user.email "email@gmail.com"
```
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/582b27d5-7107-478d-bfcd-3f3b3cd4fa51" width="50%" />

Jika sudah, Lakukan initialisasi dan push ke gitlab repository.
```
git init && git remote add origin git@gitlab.com:your_group/your_repo.git && git add . && git commit -m "Initial commit" && git push origin main
```
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f0795a4-3bce-4cae-8e16-690bace79271" width="50%" />
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9ccf2772-e9a3-4a35-aa20-1a0c3fbb3d78" width="50%" />

Cek kembali repository yang barusan dibuat.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c65d6c5b-ccb2-4433-80b8-2c9faccd1aed" width="50%" />

Kembali lagi ke directory server frontend, lalu buat file dengan nama ```.gitlab-ci.yml```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/05cdcde0-61fd-43bd-9a8e-feee1c27f7ec" width="50%" />

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

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c07bc95c-255b-4b78-a019-128bacd85150" width="50%" />

Masukkan nama repository dan pastikan Visibility ```Public```.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2651a047-9e29-4186-bf46-0ac52b219a3b" width="50%" />

Jika sudah dibuat, kembali ke gitlab -> Settings -> CI/CD -> Variables -> Expand -> Add Variable.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6d638848-cb7d-4461-aa05-b83fc74f66af" width="50%" />

Masukkan semua variable yang dibutuhkan.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fbd377e9-8a21-4a5c-bd8a-d8a0c15197f4" width="30%" />

Berikut adalah variable yang dibutuhkan.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a6409c40-54dc-4500-b8f6-fecdf8e4c707" width="60%" />

Jika sudah, kembali ke server frontend lalu push perubahan ke repository.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5df954a7-b0a3-462f-9061-595eaf77fed6" width="70%" />

Cek di gitlab -> Build -> Pipelines.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5c1f1887-014a-47c5-9088-1e67c43c165b" width="50%" />

Nanti akan berjalan secara otomatis.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/343648ac-c315-4e5c-9599-a37810753854" width="70%" />

Jika proses sudah selesai tanpa error maka akan tampil seperti ini.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/03ebc06d-5635-4900-b091-38f168fe85bb" width="70%" />

Selanjutnya pergi ke Settings -> Integrations -> Cari Discord Notifications -> Configure.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1b3c7c70-41e2-4cc3-b843-dc75f7a62e94" width="70%" />

Pastikan ```Enable Integration``` terceklist. Dan semua terceklist kecuali dipaling bawah.

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0da127a3-7d3d-4660-ba55-24e8199ea345" width="50%" />
