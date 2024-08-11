# CHALLENGE WEEK 3

## TASK 1: Deploy app (NodeJS, Golang) in PM2
  
  Pertama, install PM2 secara global

  ```
  npm install pm2 -g
  ```

  ![Screenshot 2024-04-03 195409](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/649ce1d6-db41-46a7-8fe4-732db8343918)

  Setelah install, masuk ke folder project NodeJS wayshub-frontend

  Buat dan edit file ```ecosystem.config.js```

  ```
  nano ecosystem.config.js
  ```

  ![Screenshot 2024-04-03 213553](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9aa3b8a6-33cf-4efd-8968-3ceca1dc4af8)

  Lalu, masukkan script berikut

  ```
  module.exports = {
    apps: [{
      name: "wayshub-frontend", // Replace with your app name
      script: "npm", // Script to execute (npm in this case)
      args: ["run", "start"], // Arguments to pass to the script
    }]
  };
  ```

  ![Screenshot 2024-04-03 213611](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9da7b038-3ee9-4908-a593-ba86e20e0d6a)

  Jika sudah, jalankan command berikut

  ```
  pm2 start ecosystem.config.js
  ```

  ![Screenshot 2024-04-03 213652](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5ff8814e-e929-4c51-993e-16b161b6a8be)

  Jika berhasil akan tampil seperti ini

  ![Screenshot 2024-04-03 213842](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/437ccd1f-890a-41ab-b5c7-8715db5b6125)

  Cek dengan browser

  ![Screenshot 2024-04-03 213947](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f68699ef-18f1-47cc-8306-866a5d4d53ad)



## TASK 2: Golang running on port 5000 and can be accessed on web browser

  Buat dan edit file ```index.go```

  ```
  nano index.go
  ```

  Lalu, pastekan script berikut

  ```
  package main
  
  import (
      "fmt"
      "net/http"
  )
  
  func helloHandler(w http.ResponseWriter, r *http.Request) {
      fmt.Fprintf(w, "Ahmad Fadillah")
  }
  
  func main() {
      http.HandleFunc("/", helloHandler)
      fmt.Println("Server listening on port 5000")
      http.ListenAndServe(":5000", nil)
  }
  ```

  ![Screenshot 2024-04-03 223034](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/20ed3b54-2ad1-40ee-8958-61be825ea9e9)

  Jika sudah save, lalu buat dan edit file ```ecosystem.config.js``` seperti tadi

  ```
  nano ecosystem.config.js
  ```

  Lalu pastekan script ini

  ```
  module.exports = {
    apps: [{
      name: "Golang-project", // Replace with your app name
      script: "index.go", // Path to your custom start script
      interpreter: "go",
      interpreter_args: "run",
    }]
  };
  ```

  ![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/88947921-1cba-4f8b-b252-ddc96e92481f)


  Jika sudah save dan jalankan program dengan menggunakan command berikut
  
  ```
  pm2 start ecosystem.config.js
  ```

  ![Screenshot 2024-04-03 220550](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/9ba470e6-614c-452d-863f-8214871eac4a)


  Jika sudah, akan tampil seperti ini

  ![Screenshot 2024-04-03 223248](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7ea502f2-b230-4eca-bdab-5acc2a666869)


  Cek menggunakan browser

  ![Screenshot 2024-04-03 223356](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b43caded-7d46-4e3b-920e-b5a518b6c8c3)
