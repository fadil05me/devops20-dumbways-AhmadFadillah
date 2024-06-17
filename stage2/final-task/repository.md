-----
# REPOSITORY
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- Personal Github/GitLab accounts (must be private)
- Frontend : [fe-dumbmerch](https://github.com/demo-dumbways/fe-dumbmerch)
  - NodeJS v16.x or above
  - Create .env file for FE+BE Integration (REACT_APP_BASEURL) https://api.ade.studentdumbways.my.id/api/v1


- Backend : [be-dumbmerch](https://github.com/demo-dumbways/be-dumbmerch)
  - Golang v1.16.x or above
  - Modify .env file for DB Integration

**Instructions**
- Create a repository on Github or Gitlab
- **Private** repository access
- Set up 2 branches
   - Staging
   - Production
- Each Branch have their own CI/CD

-----

## Create Private Github Repository

Buat Repository baru di Github [DISINI](https://github.com/new)

Selanjutnya ganti dari public ke private, lalu buat repository-nya:
![Screenshot 2024-06-11 195629](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4d3b8eac-59db-4e5b-b27c-cd4b7c798d8d)


**fe-dumbmerch:**


![Screenshot 2024-06-14 174838](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d89ba0ec-2967-4e87-9ea7-f750031722b9)


**be-dumbmerch:**


![Screenshot 2024-06-14 174818](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/88a40d67-3b57-4bce-b512-3b04a2b6a9cd)



Untuk clone repository menggunakan ansible, untuk scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/6clone_repo.yaml)

![Screenshot 2024-06-12 090228](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/337a4dfb-fb65-4892-bce6-56ca9aec293f)


Cek apakah branch baru sudah terbuat:
```
git branch -a
```

![Screenshot 2024-06-14 180733 - Copy](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/22d623ed-2501-45fe-a841-c54520d38b94)


Selanjutnya, koneksikan ke github.
Buka pengaturan akun github dengan mengklik ```Settings```. Lalu pilih ```SSH and GPG Keys``` -> ```New SSH Key```.

![Screenshot 2024-06-14 173040](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8f2fcf1a-5fcf-4d0b-816b-275ac79bd460)

Masukkan Public key yang digunakan pada server.
![Screenshot 2024-06-14 173201](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/28068405-8b00-41a1-a5ae-98fe4277d546)

Selanjutnya jalankan command berikut:
```
git config --global user.email "email@contoh.com" && git config --global user.name "githubuser"
```

![Screenshot 2024-06-14 173811](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b0921464-ab51-44de-adcc-8c6cb4d454e4)


Jika sudah, coba cek koneksi ke github. Jika sukses akan muncul seperti ini:
```
ssh -T git@github.com
```

![Screenshot 2024-06-14 173502](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c526741-4075-4f92-b97b-f7334a897dee)


Buat file .env untuk frontend.
```
echo "REACT_APP_BASEURL=https://api.fadil.studentdumbways.my.id/api/v1" > .env
```
Edit file .env untuk backend, sesuaikan dengan database yang digunakan

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3c4c287d-2668-4b16-b365-3928367ceea1)


Selanjutnya, Pastikan branch sudah sesuai, lalu push ke repository yang barusan dibuat
```
git switch staging
git add .
git commit -m 'updating .env
git push origin staging
```
![Screenshot 2024-06-14 182058](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f8bde522-677e-4795-927a-928dc36eb24a)


Ganti ke branch production
```
git switch production
```

Lakukan merge dan push
```
git merge staging
git push origin production
```

![Screenshot 2024-06-14 182022](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/256b0e84-4f72-43bc-939a-14f83417bc9d)


Lakukan push juga pada fe-dumbmerch dan pastikan untuk push ke semua branch.

