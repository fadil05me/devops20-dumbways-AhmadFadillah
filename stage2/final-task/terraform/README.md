# Terraform Script to Provision an Azure VM

1. Install Azure CLI
2. Log in to Azure using Azure CLI
3. Run ```terraform init```
4. Check the plan using ```terraform plan```
5. Deploy using ```terraform apply```


## Step-by-step Instructions

### 1. Install Terraform

To install Terraform, follow the [official instructions](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

On Ubuntu, you can use the following commands:

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform
```

### 2. Install Azure CLI

Install Azure CLI on Ubuntu by running:

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

![Screenshot 2024-06-11 120028](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/d54350fa-384a-4804-974c-9209d90ffdf4)


For other OS, see the [official installation guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt).


Once installed, log in using:

```
az login --use-device-code
```


You will be prompted with a code. Open the link provided:

![Screenshot 2024-06-11 120304](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/99dc5aee-fa53-429d-93b0-045324fc8ddd)



Enter the code, and sign in to your Azure account:

![Screenshot 2024-06-11 120331](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/66aab4c8-4cc8-41ee-bcc4-843b392910bb)


![Screenshot 2024-06-11 120345](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/1446e1ff-609d-4f02-94bc-7c0cde0aad9c)



After logging in, select the subscription you'd like to use:

![Screenshot 2024-06-11 120416](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/ad42e4a3-9c14-41e5-82e5-3a7b0969f1e7)



You can verify the active account by running:

```
az account show
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/a095bb43-c63d-4c85-9baa-1ccf9cc4eeec)


### 3. Execute Terraform Commands


Navigate to your Terraform project folder and initialize:

```
terraform init;
terraform plan;
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/0204e782-6bb7-4422-abfe-1cc21e8a9b8c)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/894fe463-2961-4ab6-8b13-c41d2351f6fd)
![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/417dad94-844a-44ab-bf16-ffd28a3e36b6)



Preview the plan, then apply the infrastructure changes:

```
terraform apply
```

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/b9f1ff23-d79a-4731-b02f-6a4f9be126e7)


When prompted, type yes to confirm.

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/7ea6860f-ca6d-4327-88c8-7f1869065285)


Check on Azure Dashboard:

![image](https://github.com/fadil05me/devops20-dumbways-AhmadFadillah/assets/45775729/6c77f613-9e8b-4e4f-94e5-3f39995925cb)

