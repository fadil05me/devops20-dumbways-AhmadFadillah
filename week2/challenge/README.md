# Challenge WEEK 2

## 1. Install nodeJS using BASH Script

  - Installing nvm and npm
  - exec bash
  - Checking nvm, npm and node version


    <br><br>
    **JAWAB:**
    <br><br>
    
  
    Buat file nodejs.sh, lalu masukkan script berikut:
  
    ```
    #!/bin/bash
    
    # Install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    
    # Source
    . ~/.nvm/nvm.sh
    
    # Install Node.js versi LTS (Long-Term Support)
    nvm install --lts
    
    # Cek versi nvm
    echo -e "\n\n==========\nnvm version:\n==========\n"
    nvm --version
    
    # Cek versi npm
    echo "\n\n==========\nnpm version:\n==========\n"
    npm -v
    
    # Cek versi Node.js yang terinstall
    echo "\n\n==========\nNode.js version:\n==========\n"
    node -v
    
    echo "\n\n==========\nInstallasi Berhasil!\n==========\n"
    ```
    
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3da62887-ef7d-48ed-9f0e-dfe00f55b388)

    
    
    Jalankan command ```chmod +x nodejs.sh```. Lalu jalankan scriptnya ```./nodejs.sh```.
    
    Jika berhasil maka akan muncul seperti ini:
    
    ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0f1e0112-3e2f-4e57-931f-c734e7d069fc)
    
