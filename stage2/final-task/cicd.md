# CI/CD with Jenkins Pipeline

---

## Task Overview

> **Before starting this task, please:**
> - Capture step-by-step screenshots of the commands and UI actions.
> - Document the process in your final task repository.

---

### Requirements

- Implement a complete CI/CD pipeline using **Jenkins**.

---

### Pipeline Instructions

Using Jenkins, your pipeline should perform:

1. Clone the application repository.
2. Build the Docker image.
3. Run tests.
4. Push the image to your **private Docker registry**.
5. SSH into your target Biznet server.
6. Pull the image from your private registry.
7. Redeploy the application containers.

---

## Setup Jenkins

## Jenkins Setup

Before installing Jenkins, ensure the target server has GitHub access:

![Screenshot 2024-06-14 173502](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0c526741-4075-4f92-b97b-f7334a897dee)

I automated the installation using Ansible: [8install_jenkins.yaml](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/8install_jenkins.yaml)

---

### Install & Configure Jenkins

1. After installation, retrieve the **Initial Admin Password**:

![Screenshot 2024-06-14 150619](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/68ff8d45-0c8d-40ee-8fbe-dd9071f47e4d)



2. Access Jenkins via browser, paste the password, and complete the initial setup:

![Screenshot 2024-06-14 150832](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/c7eef58a-97c2-4b32-b3f6-35f4eaeb0ae8)


![Screenshot 2024-06-14 151003](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/74fc5727-2bcf-4e50-a046-d451463f72f5)


3. Create a new Jenkins user:

![Screenshot 2024-06-14 152754](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7dc1b557-adc6-4811-a845-fedb1b20f9c0)


4. Confirm the Jenkins URL is correctly set:

![Screenshot 2024-06-14 153134](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/bcc780e2-d100-4d47-86d3-c2f5d29095df)


![Screenshot 2024-06-14 153202](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/07afac1b-aca4-4101-9d57-4c23632cb5b3)



### 🧩 Adding Plugins & Credentials

1. Go to **Manage Jenkins → Manage Plugins → Available**, install:
   - **Pipeline**
   - **Blue Ocean**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7bef6b00-1933-4d15-8d1c-2c88f93db091)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/536d0f85-8aea-4734-8696-6c795ea53f43)



2. Add SSH credentials for deployment:
   - Manage Jenkins → Credentials → System → Global → Add Credentials
   - Select **SSH Username with private key**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d1db8bd1-f208-4141-bb48-3c1c9052a0e0)



### 🛠️ Creating Pipelines

1. Create two folders: **Staging** and **Production**.


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/88e0ff6c-0445-490c-a77b-43ea6b099ee0)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/cc29c398-7333-4cb0-9caa-dd536b1e6dac)



2. Inside each folder, create pipelines for both frontend and backend:
   - Enable **GitHub hook trigger for GITScm polling**
   - Definition: **Pipeline script from SCM**
   - SCM: **Git**, add repository URL and select credentials
   - Specify branch and Jenkinsfile path


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/4ae4bfc0-c32e-4799-8dc9-e4870d6efb8b)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b790ade1-5052-4932-9104-999aac257c93)


![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/5a0e484c-5526-446a-923b-6f80d1d1f241)


3. Total 4 pipelines:
   - Production → frontend & backend
   - Staging → frontend & backend

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/3f067c7f-4e53-46e7-b79c-65f51d84087e)

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/e6210b5c-ca0d-4d91-b0a4-c87400c13240)


## Production Pipeline [`(Jenkinsfile)`](https://github.com/fadil05me/be-dumbmerch/blob/production/Jenkinsfile)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/142d327d-da19-4c64-9d9b-6429ef2936f0)


## Staging Pipeline [`(Jenkinsfile)`](https://github.com/fadil05me/be-dumbmerch/blob/staging/Jenkinsfile)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d53c2bc1-b7ee-4a38-b7eb-b670ed521613)
