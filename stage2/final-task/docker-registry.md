# DOCKER REGISTRY

---

### Task Overview

> **Before starting this task, please follow these instructions:**
- Capture step-by-step screenshots of the commands you execute.
- Document the process in your final task repository.

---

### Requirements
- Set up a **private Docker Registry** on your server.

### Instructions

- Deploy a private Docker registry on your own server.
- Push Docker images to your private registry.
- Configure a reverse proxy:  
  `registry-<yourname>.studentdumbways.my.id`

**Reference:** [Docker Registry Official Image](https://hub.docker.com/_/registry)

---

## Deploying the Private Docker Registry

First, create a `docker-compose.yaml` file.  
This setup also includes a frontend UI for visualizing the registry:

```

services:
  registry:
    container_name: registry
    image: registry:2
    ports:
      - "7000:5000"
    volumes:
      - ./registry-data:/var/lib/registry
    restart: always

  frontend:
    container_name: registry-frontend
    image: konradkleine/docker-registry-frontend:v2
    ports:
      - "8080:80"
    environment:
      ENV_DOCKER_REGISTRY_HOST: registry
      ENV_DOCKER_REGISTRY_PORT: 5000
    restart: always
    depends_on:
      - registry

volumes:
  registry-data:
```

Example output:

![Registry containers](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7d406c56-6ebe-4a94-8726-63a0e63c2c16)

Start the registry using:

```
docker compose up -d
```

Result:

![Containers running](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/2d730607-2a84-4175-a8fe-e84225574fb5)

---

## Configuring Reverse Proxy (NGINX)

In your `nginx.conf`, add:
- File upload limit (max 500MB)
- SSL certificate configuration

Example configuration snippet:

![NGINX config](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ed5b3940-2fce-4fa2-898a-885af445fccd)

Subdomain configuration examples:
- `registry.fadil.studentdumbways.my.id`  
  ![registry config](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/483d1297-ef46-4d8c-8a75-80ff8efaf188)
- `hub.fadil.studentdumbways.my.id`  
  ![hub config](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7a4da88d-0093-41c7-aad2-9a2c8e376554)

---

## Setting Up Basic Authentication (for `hub` subdomain)

Install `apache2-utils`:

```
sudo apt-get update
sudo apt-get install apache2-utils
```

Inside your NGINX folder, generate the `.htpasswd` file. Replace `fadil` with your desired username:

```
sudo htpasswd -c .htpasswd fadil
```

---

## Final Result

![Registry dashboard](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3471629e-ed27-43a8-945b-bc4eb212b17a)
![Registry UI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/51bc6a58-760d-40ed-9f2b-0004d9726754)
![Registry listing](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/56e74c9f-7db0-4528-a8d3-93d55bde5033)

---

## Pushing Images to Your Private Registry

Build the image:

```
docker build -t registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:1.0 .
```

Push the image to your registry:

```
docker push registry.fadil.studentdumbways.my.id/be-dumbmerch-staging:1.0
```

Result:

![Push success](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bb02f0ff-4bb0-4d65-bc72-bb833f22dee8)
