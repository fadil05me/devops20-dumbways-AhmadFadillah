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

