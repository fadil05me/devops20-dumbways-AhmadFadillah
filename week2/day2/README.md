# DAY 2 - Manage Server w/ Terminal

## TASK 1: Buat 3 directory yang masing-masing berisi 2 file dan rapihkan sebaik mungkin!

```
mkdir dir1 dir2 dir3; touch dir1/f1d1 dir1/f2d1 dir2/f1d2 dir2/f2d2 dir3/f1d3 dir3/f2d3; ls dir1 dir2 dir3

```

Hasil: 

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8c15fa41-e06e-4375-9183-7a8c821eb406)


## TASK 2: Penjelasan text manipulation beserta step by step

Text Manipulation adalah proses mengganti, menghapus atau menambah teks kedalam sebuah file.

### 1. Mengganti text


  - nano
  
    Nano adalah text editor bawaan dari ubuntu.
    Untuk menggunakan nano, command yang dipakai adalah:
    ```
    nano namafile
    
    ```
  
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e875f081-4461-473d-957c-9444fef094cb)
  
  
    Untuk melakukan replace text dalam nano, tekan ```CTRL + \``` pada keyboard, lalu masukkan kata yang ingin di replace ```enter```, masukkan kata baru dan ```enter```. Tekan ```y``` untuk replace satu persatu, tekan ```a``` untuk replace semua.
  
    Untuk melakukan Undo dalam nano, tekan ```ALT + U``` pada keyboard.
    
    Untuk melakukan Redo dalam nano, tekan ```ALT + E``` pada keyboard.
    
    Untuk menyimpan file dalam nano, tekan ```CTRL + X``` pada keyboard, lalu tekan ```y``` dan ```enter```.
    
    Perintah lainnya dapat dilihat dengan menekan tombol ```CTRL + G``` pada keyboard.
    
  - **sed**
  
    Untuk melakukan replace text bisa menggunakan command berikut:
    ```
    sed -i 's/kata lama/kata baru/g' file1
    
    ```
  
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/494cdde3-ad71-4eca-9e9b-0cac6ce5d99b)


### 2. Menghapus text

  - **grep**

    Command grep bisa digunakan untuk mencari dan menghapus baris text yang terdapat text tertentu. Contoh:
    ```
    grep -v "baris kata yang dihapus" file1 > file2
    
    ```
    
    Command tersebut akan membuat file baru dengan nama "file2" yang berisi semua text dari "file1" yang tidak terdapat baris dari text "baris kata yang dihapus".
    
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2fdb10d3-7098-44ce-8380-114c306ee5a6)

  - **sed**

    Command sed juga bisa digunakan untuk mencari dan menghapus baris text yang terdapat text tertentu. Contoh:
    ```
    sed "/kata yang dihapus/d" file1 > file2
    
    ```

    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f2a3220-5009-4662-9261-7ac7f96618b9)

    
### 3. Menambahkan teks

  - **echo**
    
    Command echo dapat digunakan untuk menambahkan teks ke file. Contoh:
    ```
    echo "Text baru" >> file1
    
    ```
    
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1a1f9d1a-866c-416d-973e-058ad2347c0a)

    
  - **sed**

    Command echo juga dapat digunakan untuk menambahkan teks ke file. Contoh:
    
    ```
    sed "1i  Teks baru" file1 > file2
    
    ```
    Command tersebut akan menambah "Teks baru" pada baris awal dan akan menyimpan hasilnya ke file2.

    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/142911b8-2e5a-45f5-83ef-3a352f7935d4)


## TASK 3: Penjelasan tool htop atau nmon

htop adalah aplikasi linux berbasis CLI yang digunakan untuk memantau proses sistem dan penggunaan sumber daya (resource) pada server Ubuntu. Fungsinya mirip seperti Task manager di Windows.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9d458fed-cf08-4cd5-8e67-c56e33c62a0a)


## TASK 4: buatlah BASH Script untuk instalasi nginx
