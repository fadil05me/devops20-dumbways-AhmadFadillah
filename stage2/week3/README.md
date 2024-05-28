# WEEK 3 - DAY 1 - TERRAFORM

## Install Terraform
Untuk cara installnya bisa dilihat [DISINI](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Untuk ubuntu, cara installnya cukup dengan menjalankan command berikut:
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

<img src="https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/47fbbe5a-0946-4a63-a2a6-94ce81e7f60f" width="70%"/>

## Buat Script Terraform Untuk Microsoft Azure

Dengan mengukuti [dokumentasi resmi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) yang ada, disini saya sudah membuat sciptnya:

Untuk scriptnya bisa dilihat [DISINI](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/tree/main/stage2/week3/Terraform).


# WEEK 2 - DAY 2 - ANSIBLE
