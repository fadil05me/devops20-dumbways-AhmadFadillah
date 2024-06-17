-----
# **DEPLOYMENT**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- Deployments on top Docker
- Frontend : [fe-dumbmerch](https://github.com/demo-dumbways/fe-dumbmerch)
- Backend : [be-dumbmerch](https://github.com/demo-dumbways/be-dumbmerch)

**Instructions**

[ *Database* ]
- App database using *PostgreSQL*
- Deploy postgresql on top docker
- Set the volume location in `/home/$USER/`
- Allow database to remote from another server

[ *Application* ]
- Create a Docker image for frontend & backend
- Staging: A lightweight docker image (as small as possible)
- Production: Deploy a production ready app
- Building Docker image on every environment using docker multistage build
- Create load balancing for frontend and backend

-----


## Database PostgreSQL for Staging 

Buat file docker-compose.yaml:
```
services:
  postgres:
    image: postgres:alpine
    container_name: postgres-staging
    restart: always
    environment:
      POSTGRES_DB: dumbmerch
      POSTGRES_USER: fadil
      POSTGRES_PASSWORD: Fadil999
    ports:
      - "5432:5432"
    volumes:
      - /home/finaltask-fadil/postgres_data:/var/lib/postgresql/data
```

Test Connetion to PSQL remotely:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/24b3dcb1-8aa2-4aa3-a124-4b1147ccffda)


## Docker image for frontend

Buat Dockerfile:
```
FROM node:16-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

Build image:
```
docker build -t registry.fadil.studentdumbways.my.id/fe-dumbmerch-staging:latest .
```


## Docker image for backend

Edit .env:
```
DB_HOST=52.187.151.75
DB_USER=fadil
DB_PASSWORD=Fadil999
DB_NAME=dumbmerch
DB_PORT=5432
```

Buat Dockerfile:
```
FROM golang:1.16-alpine as build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download
COPY . .

RUN go build -o go-docker

FROM alpine:latest

WORKDIR /app

COPY --from=build /app/go-docker .
COPY .env .env

EXPOSE 5000

CMD ["./go-docker"]
```


Build image:
```
docker build -t registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:latest .
```


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b52bb305-f768-4e0e-8128-f2d9aca5b980)


## Deploy frontend and backend staging

Buat file docker-compose.yaml:
```
version: '3.8'

services:
  frontend:
    image: registry.fadil.studentdumbways.my.id/fe-dumbmerch-staging:latest
    container_name: frontend
    ports:
      - "3000:80"

  backend:
    image: registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:latest
    container_name: backend
    ports:
      - "5000:5000"
```

Start:
```
docker compose up -d
```

## Untuk load balancing hanya tersedia untuk production, lihat ke kubernetes [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/kubernetes.md)

## Hasil

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/79fdad6c-0641-4f5f-8487-03992f257406)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b6c93caf-41b9-4487-842d-5ceaf7e74736)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/602556d5-81e7-45c1-bf92-8c2321226e0a)


