# CHALLANGE WEEK 1

## 1. Rubah nama hostname menjadi "dumbways"

Ketik command ini pada terminal:
```
sudo hostnamectl set-hostname dumbways
```

Untuk mengecek hasilnya gunakan command ini:
```
hostnamectl
```

Hasilnya:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/17af231d-f344-43d5-844f-00064ba0aac6)

Agar nama pada terminal berubah, logout dulu dengan menggunakan command berikut:
```
logout
```

Silahkan coba login ulang

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3731c394-df6b-447b-835e-8d264669d575)

Jika berhasil, hasilnya akan seperti ini:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9d887397-40cd-4edb-bf04-24158e5647de)

## 2. Buat network adapter baru dengan nama ens20 dan gunakan IP yang sama

Pertama tambah adapter baru di VMWare setting.
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b05a6fe4-a4ee-41a0-b374-517b5dc01889" width="70%"/>
<br><br>
Pilih Bridged, dan pastikan yang ter-ceklist adalah adapter yang sama.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2ee1b44c-be44-41fc-b64a-0c30bc6e9e5a" width="70%"/>
<br><br>
Selanjutnya, jalankan kembali Virtual Machine.
<br><br>
Cek adapter dengan menggunakan command:
```
ip a
```
Disini adapter baru sudah terdeteksi, tetapi namanya masih ens37. Yang digarisbawahi tersebut adalah nama adapter dan MAC Address, yang nantinya diperlukan untuk mengubah nama adapter menjadi ens20.
<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/fc471be0-2a67-43ac-9b0a-04fc180242a7" width="70%"/>
<br><br>
Selanjutnya untuk mengubah nama adapter tadi edit file config _/etc/udev/rules.d/70-persistent-net.rules_
```
sudo nano /etc/udev/rules.d/70-persistent-net.rules
```
Lalu, tambahkan code berikut:
```
# interface with MAC address "00:0c:29:c6:44:9b" will be assigned "ens20"
# KERNEL=="ens37" is debians current interface name
# NAME="ens20" is a new ethernet interface name
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:0c:29:c6:44:9b", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="ens37", NAME="ens20"
```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f327a14-9d5b-4279-bc63-adef134e5500)

<br><br>
Save file tersebut. Selanjutnya, edit file _/etc/netplan/00-installer-config.yaml_
```
sudo nano /etc/netplan/00-installer-config.yaml
```
Tambahkan configurasi untuk ens20, dengan ip yang sama.
```
    ens20:
      addresses:
      - 192.168.253.169/24
      nameservers:
        addresses:
        - 1.1.1.1
        - 1.0.0.1
        search: []
```
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8dd92ad6-887d-4766-9b93-9883599d4bf37" width="80%"/>
<br><br>
Setelah itu reboot Virtual Machine.

```
sudo reboot
```
Cek kembali adapternya:
```
ip a
```

<br>
<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bf74f8a1-f972-43c8-b0e0-9674e4710a31" width="80%"/>

