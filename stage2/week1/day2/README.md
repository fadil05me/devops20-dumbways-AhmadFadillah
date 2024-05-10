# DAILY TASK | DAY 2 - WEEK 1

## TASK 1: Deploy database mysql
  - Cek Update dan Upgrade
    ```
    sudo apt update; sudo apt upgrade -y
    ```
    ![Screenshot 2024-05-07 171830](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/04d34bd0-519d-48dc-a609-219ad579edd7)

  - Install mysql-server
    ```
    sudo apt install mysql-server -y
    ```
    ![Screenshot 2024-05-07 172512](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/39b2bb2f-559b-48a1-9c3c-19472f4d5b7a)
  - Setup mysql_secure_installation
    ```
    sudo mysql_secure_installation
    ```
    ![Screenshot 2024-05-07 174305](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed277c4c-c0f9-40df-8b5c-b66633363586)
    ![Screenshot 2024-05-07 174505](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c1472026-62c1-4928-a125-b4ba4fa01f2a)
    ![Screenshot 2024-05-07 174539](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d54d02ac-d8f3-492f-8016-1ed5d3780938)

  - Login Mysql sebagai root
    ```
    sudo mysql -u root
    ```
    ![Screenshot 2024-05-07 174948](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e610c686-c991-488c-a068-6b58f660981e)

  - Set password untuk root
    ```
    ALTER USER 'root'@'localhost' IDENTIFIED BY '11abc998';
    ```
    ![Screenshot 2024-05-07 175247](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/251a942f-f5cf-4b84-92e1-d57f8b1c88f9)
 
  - Set privileges
    ```
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
    ```
    ![Screenshot 2024-05-07 181438](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/61332743-544a-46ab-8d66-a3d0ac04fb81)
 
  - FLUSH PRIVILEGES
    ```
    FLUSH PRIVILEGES;
    ```
    ![Screenshot 2024-05-07 183440](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/dabe2e01-212c-4325-98e1-4f0229ac2a54)

  - Login menggunakan password
    ```
    sudo mysql -u root -p
    ```
    ![Screenshot 2024-05-07 182420](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9e140bc0-fde1-40fd-ab1a-5d3d3ec2e697)

  - Buat user baru
    ```
    CREATE USER 'fadil'@'%' IDENTIFIED BY '11abc998';
    ```
    ![Screenshot 2024-05-07 182915](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c2b2f0b7-7b12-4079-bd2d-6cad5eb6e327)

  - Buat database baru
    ```
    CREATE DATABASE dumbflix;
    ```
    ![Screenshot 2024-05-07 183652](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b7eb9122-5363-4f3a-8f25-0ea7591373f4)

  - Tampilkan database
    ```
    SHOW DATABASES;
    ```
    ![Screenshot 2024-05-07 184016](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f8a80099-fc02-4d5f-85f6-6e9b9064add1)

  - Set privileges untuk user baru agar bisa mengakses database dumbflix
    ```
    GRANT ALL PRIVILEGES ON dumbflix.* TO 'fadil'@'%';
    ```
    lalu flush privileges lagi
    ```
    FLUSH PRIVILEGES;
    ```
    ![Screenshot 2024-05-07 183946](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/683e0864-ef56-44b8-b2be-f66a46167c69)
  
  - Cek login menggunakan user baru
    ```
    sudo mysql -u fadil -p
    ```
    ![Screenshot 2024-05-07 183032](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0df60cdf-63eb-472b-81e9-318014f83c5e)

  - Edit file ```mysqld.cnf```
    ```
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
    ```
    ![Screenshot 2024-05-07 185348](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/86fbbcda-01c8-4945-bc21-b9eb79808047)

  - Pada bagian ```bind-address``` dan ```mysqlx-bind-address``` ubah menjadi ```0.0.0.0```
    ![Screenshot 2024-05-07 185620](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b0db4304-b32d-4ebd-9586-4776519c2c98)

  - Restart mysql
    ```
    sudo systemctl restart mysql
    ```
    ![Screenshot 2024-05-07 185712](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/678253c5-932b-4b48-8eb1-5cf94d596126)

  - Cek remote login dari local computer
    ```
    mysql -h 103.127.134.73 -u fadil -p
    ```
    ![Screenshot 2024-05-07 190257](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cce3a684-992c-4159-b41d-e0c4aa09fa73)

    
## TASK 2: Deploy aplikasi Wayshub-Backend 

  - Clone repo <a href="https://github.com/dumbwaysdev/dumbflix-backend">dumbflix-backend</a>
    ```
    git clone https://github.com/dumbwaysdev/dumbflix-backend
    ```
    ![Screenshot 2024-05-07 191750](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b40501f1-976f-4687-92bc-e7cc0ea44f36)

  - Copy file .env.example ke .env
    ```
    cp .env.example .env
    ```
    ![Screenshot 2024-05-07 211724](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/91eb05d6-5357-48c3-8dc1-d5a711d9ae7f)

  - Install nvm
    ```
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash; exec bash
    ```
    ![Screenshot 2024-05-07 191950](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1b2b22d5-349d-4da9-8298-5107cc0d5227)

  - Install npm v14
    ```
    nvm i 14
    ```
    ![Screenshot 2024-05-07 192935](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/62ba8641-49e9-4703-a963-15938178b861)

  - Install pm2
    ```
    npm i pm2 -g
    ```
    ![Screenshot 2024-05-07 193316](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c27d12e7-d7c9-4943-a70a-21e8f5d38468)

  - Masuk ke folder ```dumbways-backend```. Lalu edit file ```config.json```
    ```
    nano config/config.json
    ```
    sesuaikan dengan user dan database yang telah dibuat
    ![Screenshot 2024-05-07 193502](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e0d5fd9a-eb6a-49b5-a827-2b8229ef2853)
  
  - Install ```sequelize```
    ```
    npm i sequelize-cli -g
    ```
    ![Screenshot 2024-05-07 193847](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/713b5616-bb4f-4955-abd0-82fea426202e)
  
  - Jalankan ```npm i```
    
    ![Screenshot 2024-05-07 194206](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/719a393c-5232-4f56-ae21-71177bbdbf9c)

  - Lakukan migrate database menggunakan sequelize
    ```
    sequelize db:migrate
    ```
    ![Screenshot 2024-05-07 194450](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c7a0c520-7a0c-416c-ab0d-35ec6ddc76a0)

  - Setup pm2
    ```
    pm2 init simple
    ```
    ![Screenshot 2024-05-07 194531](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7b55aa33-c954-41bc-8f62-74b05e2d34b5)

  - Edit file ```ecosystem.config.js```. Sesuaikan dengan kebutuhan 
    ```
    nano ecosystem.config.js
    ```
    ![Screenshot 2024-05-07 194616](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/74b141f2-d2b3-4954-a48d-39b373f55011)

  - Jalankan pm2
    ```
    pm2 start ecosystem.config.js
    ```
    ![Screenshot 2024-05-07 194711](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8a0febf5-05d7-40fb-a061-3bcd0396ddb2)

  - Masuk ke cloudflare, lalu buat subdomain baru dengan nama ```api.fadil```.
    Pointing subdomain tersebut ke ip address dari server gateway.

    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e2cfd8cf-012f-46f2-afd7-e0fd381bbe8b)

  - Masuk ke server Gateway, lalu generate ssl certificate baru.
    
    ```
    sudo certbot
    ```
    ![Screenshot 2024-05-07 200041](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6a31f4c8-5a79-409c-bf25-2020a9234d53)

  - Cek di browser
    
    ![Screenshot 2024-05-07 200212](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9c9e96d7-4c4c-40d0-9534-d5fefc97aeea)

  - Login ke server gateway (frontend). Lalu edit file ```dumbflix-frontend/src/config/api.js```
    ```
    nano ~/dumbflix-frontend/src/config/api.js
    ```
    ![Screenshot 2024-05-07 200828](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6e7a9a09-7710-424d-a30f-99dcf5e47a58)

  - Ganti pada baseURL dengan alamat ip + port dari backend-dumbflix di server ```appserver```
    ![Screenshot 2024-05-07 201313](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed879b1d-295d-4b06-be49-49d33980fc36)

  - Restart pm2
    ```
    pm2 restart ecosystem.config.js
    ```
    ![Screenshot 2024-05-07 201525](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cfbc0ac3-dc61-4b07-9670-b96a61ccbf92)

  - Tes Register lalu login. [fadil.studentdumbways.my.id](https://fadil.studentdumbways.my.id/)
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a44d560b-edd5-4aad-8e78-073f41375349)



