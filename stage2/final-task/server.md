-----
# **SERVER**
-----

## TASK

**Before you start the task, please read this:**
- Please screenshot the command step-by-step
- Describe the process in your final task repository

**Requirements**
- 1 SSH keys max.
- SSH Config.
- Ubuntu 22.04 lts

**Instructions**
- Create new user `finaltask-$USER`
- Server login with SSH key and Password
- Create a working **SSH config** to log into servers
- Only use **1 SSH keys** for all purpose (Repository, CI/CD etc.)
- UFW enabled with only used ports allowed
- Change ssh port from (22) to (1234)

-----

## Setup using Ansible

Pada task ini saya menggunakan ansible, scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/2create_user.yaml) (untuk create user) dan [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/blob/main/stage2/final-task/ansible/3setup_ufw.yaml) (untuk change ssh port and setup ufw).


## SSH CONFIG

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6b0f9887-ac91-4d3e-9cee-13d333eb70bb)

## Proof login using password only

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0d037370-0e38-44b9-8a85-982d4e09fa59)


## UFW Allow Custom Port

**Master Server**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/86f11e7a-9b17-4342-898e-52153e518357)


**Worker Server**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/f9f7c42f-0f36-4730-86ff-6b3c8342f6be)


**Gateway**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d965a9de-f04f-4b46-a64f-220ca801b3da)


**Appserver**

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/8422f887-1e7f-47c2-94ca-715ea8b2123e)
