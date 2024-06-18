-----
# **CICD**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- CI/CD with Jenkins

**Instructions**

[ *CI/CD* ]

- Using Jenkins, create a pipeline running:
   - Repository pull
   - Image build
   - Testing
   - Push Image into your own docker registry private
   - SSH into your biznet server
   - Pull image from docker registry private
   - Redeploy your deployment apps
 
-----

## Setup Jenkins

Sebelum menginstall jenkins, pastikan server dimana jenkins nantinya diinstall sudah terhubung ke github:

![Screenshot 2024-06-14 173502](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c526741-4075-4f92-b97b-f7334a897dee)

Untuk installasi Jenkins saya menggunakan Ansible, Scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/8install_jenkins.yaml)


Jika installasi Jenkins sudah berhasil, nantinya akan ada ```Initial Admin Password``` untuk melanjutkan proses installasi jenkins di web.

![Screenshot 2024-06-14 150619](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/68ff8d45-0c8d-40ee-8fbe-dd9071f47e4d)



Selanjutnya akses jenkins menggunakan web browser dan masukkan passwordnya.

![Screenshot 2024-06-14 150832](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c7eef58a-97c2-4b32-b3f6-35f4eaeb0ae8)


Tunggu sampai proses initialisasi selesai.

![Screenshot 2024-06-14 151003](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/74fc5727-2bcf-4e50-a046-d451463f72f5)


Buat User baru, sesuaikan dengan kebutuhan.

![Screenshot 2024-06-14 152754](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7dc1b557-adc6-4811-a845-fedb1b20f9c0)


Pastikan Jenkins URL sudah sesuai.

![Screenshot 2024-06-14 153134](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bcc780e2-d100-4d47-86d3-c2f5d29095df)


![Screenshot 2024-06-14 153202](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/07afac1b-aca4-4101-9d57-4c23632cb5b3)



Selanjutnya, Install Plugin. ```Manage Jenkins``` -> ```Plugins``` -> ```Available Plugins```. Cari ```Pipeline``` dan ```Blue Ocean```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7bef6b00-1933-4d15-8d1c-2c88f93db091)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/536d0f85-8aea-4734-8696-6c795ea53f43)



Jika sudah sukses, buat ```Credentials``` baru. ```Manage Jenkins``` -> ```Credentials``` -> ```System``` -> ```Global credentials``` -> ```Add Credentials```.

Pilih ```SSH Username with private key```, masukkan ID yang nantinya berperan sebagai variable, masukkan username dan private key.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d1db8bd1-f208-4141-bb48-3c1c9052a0e0)



Kembali ke dashboard, klik ```New Item```, pilih folder buat 2 folder dengan nama ```Staging``` dan ```Production```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/88e0ff6c-0445-490c-a77b-43ea6b099ee0)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cc29c398-7333-4cb0-9caa-dd536b1e6dac)



Selanjutnya masuk ke dalam folder Production, Buat Pipeline baru.

Pastikan untuk ceklist pada bagian ```GitHub hook trigger for GITScm polling```.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4ae4bfc0-c32e-4799-8dc9-e4870d6efb8b)


Pada Definition pilih ```Pipeline script from SCM```.

SCM ganti ke ```Git```

Masukkan ```Repository URL``` dan pada ```Credentials``` pilih Credentials yang barusan dibuat.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b790ade1-5052-4932-9104-999aac257c93)


Pada bagian ```Branch Specifier``` Masukkan branch yang sesuai.

Pada bagian ```Script Path```, pastikan diisi sesuai dengan lokasi dan nama file dari script Jenkins nantinya.

Jika sudah ```Save```
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5a0e484c-5526-446a-923b-6f80d1d1f241)


Buat lagi dengan total 4 Pipeline, dengan masing - masing branch/folder berisi pipeline untuk Frontend dan Backend.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f067c7f-4e53-46e7-b79c-65f51d84087e)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6210b5c-ca0d-4d91-b0a4-c87400c13240)


## Production Pipeline
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/142d327d-da19-4c64-9d9b-6429ef2936f0)


## Staging Pipeline
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d53c2bc1-b7ee-4a38-b7eb-b670ed521613)
