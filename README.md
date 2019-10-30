# Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst
Waardepapieren AZURE ACI met ICTU/Belastingdienst

Met Compose gebruikt u een eenvoudig tekstbestand om een toepassing te definiëren die uit meerdere Docker-containers bestaat. Vervolgens draait u uw toepassing op met een enkele opdracht die er alles aan doet om uw gedefinieerde omgeving te implementeren. 

# container brings itś own file system, on every type of system

`type: Microsoft.ContainerInstance/containerGroups`

![kubernetes](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/kubernetes.PNG)

![k3](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/sem_k8s.PNG)


Bas kan hem ook prebuilt bijhouden in de docker hub zoals de mensen van irma dat doen dan wordt de deployment eenvoudiger.  
Misschien kan bas hem packagen op docker hub

![azure]https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/bevrijden-regelingen-master.zip)
https://www.katacoda.com/courses/kubernetes/playground

```apiVersion: 2018-06-01
location: westeurope
name: lab
properties:
  containers:
  - name: irma-api-server
    properties:
      environmentVariables:
        - "name" : "IRMA_API_CONF_ENABLE_VERIFICATION"
          "value": true
        - "name" : "IRMA_API_CONF_ENABLE_ISSUING"
          "value": true
        - "name" : "IRMA_API_CONF_ALLOW_UNSIGNED_ISSUE_REQUESTS"
          "value": true
        - "name" : "IRMA_API_CONF_BASE64_JWT_PUBLICKEY"
          "value": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxScmLzY25uKDaTldNn1cCKYOtwH5dxQtBo764zN0NZ4uwpTsq8Vyuc24LUBZMlYZfwjIDV41y9Nd2OUiDxgbEOaxVUIwJ8GQ4YEg+UdXmOeULxN0Ixdl7rM0HnRslGhu3UUbv9NBhWCBBewnA3Tr3oogzrznjDbW+JM7ahju169qAUDRM1iyhDwau87nK4/Zyjipdf0ZTWvnojlfvXpWsrSCiXYa/JSgo8wDz3kHyWO3sm1MHKFs5WZfG9J1On7ySqAzUzJOMhCt0m3hb8TimDho9nuhRkyjIl5IX7xAwJCSycCpHVVkhUY4G/+zwNb9ufSpld4JN09a0OuvtvTq0QIDAQAB"
        - "name" : "IRMA_API_CONF_BASE64_JWT_PRIVATEKEY"
          "value": "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFJyYvNjbm4oNpOV02fVwIpg63Afl3FC0GjvrjM3Q1ni7ClOyrxXK5zbgtQFkyVhl/CMgNXjXL013Y5SIPGBsQ5rFVQjAnwZDhgSD5R1eY55QvE3QjF2XuszQedGyUaG7dRRu/00GFYIEF7CcDdOveiiDOvOeMNtb4kztqGO7Xr2oBQNEzWLKEPBq7zucrj9nKOKl1/RlNa+eiOV+9elaytIKJdhr8lKCjzAPPeQfJY7eybUwcoWzlZl8b0nU6fvJKoDNTMk4yEK3SbeFvxOKYOGj2e6FGTKMiXkhfvEDAkJLJwKkdVWSFRjgb/7PA1v259KmV3gk3T1rQ66+29OrRAgMBAAECggEAe6n21Z5YCbMDYrlMsqUnWXVvvXNLm1nYdEizLlhUCF3UTtFDMuuC7vEPGbNHP7+p9nj3owr5C4TlVOtE1dr0/0D08tm1gvpzej+ZA0OwuoRn+q9lJa3Djlpx0riMcvqer8Rth4Fnk9XYmHJsdkqcuNZDheoQA29SoFEZ7478IeUXAFyDRpS0EQlmUlTn5P4fEb8z3vSc7q2aY5wFUiaUKX0ugPK+777gi38h7fIwdNPY01k6jiF/97UcP/ANwt94aR3bu37mhuFeinVUi0tfjHo4LGL6P7exggK4sOQLLd2JIq3TEgMOmcALpx2LBFdXu7QjYd9wbzZwDx+aI0fQAQKBgQDzrQS6cQEGw60la1u85yi7g1Bca0RfyR+yYl6qH4H4rZGIXF9oTgZ9P0B46ZHwbgAekV+JKWZrPt26VBF1GyEo8fF6WJGQ/F1qw2Q5flMR2ueQIPrEFWA/g1TEFFVc6Fp2TS4xBtbWJg4FEbHu4xBycZYzUElqvD+So3nob6GukQKBgQDPH8b9Qcg5AYO6VD2xxAdwSBBlXZG3YQJknuVXGFQlbJRXuYxfnc3uUdb2DduK/sv18uH7mXRccJ8v/ucaKP+0t6AR+VdRFtzAzjKjoTwkPR4zcLkLaELk1/rgtokEKnWwE7UiBl1Fx3ntmK6OU5wr9UUiXMdyLJopV3g/RuoYQQKBgFRafbuI6QENdf/xJUXEg849y/DiVT4PYsCe2wRredO7Shj5WTHDaO2smsYAnTus6K+sRXU29rSDg8A/3/c5GAaTkrN2u5WEN1aBI03f1CPnMqgrMoP0nmf+L7bdDxvld4Nifm4MXwytCcdpc74troDfn05OKcwgNKWvn8D9++txAoGBAMXHXkgvLHXi0Fp4XoEE4uWAqsdgVeh5pcNXRz+nZ5Jk4DH0Z+pV0XKki1NhYCaVr0UnrEqH+ejbUeaOzTbZt3JldWA0bABuiFVDkG9XYwpnohMUrF4MLPRAmLtDEgr8UGzWJLxcv2wGUpNinCwkApinGGD7nyeTF5IqiBRELv0BAoGBAKUAFQLup+WiegQZBgplLje5wtu0fZs1rbDBG3dXEbwI1RHyMTx/Egt271+WwjcBVHKcYmHTOvdUmSzoRZJDrQpEB4EFEoUYYKlJ3+Udu8q5jcRzMs3KhTMfnriOKp6C3yRcfPcanhLfTpcTccHetUZRNxwgs9MK3LJh6pVScm+5"
        - "name" : "IRMA_API_CONF_AUTHORIZED_IDPS"
          "value": "{\"wigo4it\": [\"*\"]}"
      image: privacybydesign/irma_api_server
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 8088
      - port: 8080
  osType: Linux
  ipAddress:
    type: Public
    dnsNameLabel: "wigo4it-dev"
    ports:
    - protocol: tcp
      port: '8080'
tags: null
type: Microsoft.ContainerInstance/containerGroups
```



***

|nr|image|
|---|---------------------------------------------|
|1|docker pull boscp08/waardepapieren_mock-nlx:1.0|  
|2|docker pull boscp08/waardepapieren_service:1.0|  
|3|docker pull boscp08/waardepapieren_clerk-frontend:1.0|
But... how to start a container.  Ask Pim Otte / Bas Kaptijn  :shipit:


***

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/docker-compose-quickstart

# Get started with Docker and Compose to define and run a multi-container application in Azure
With Compose, you use a simple text file to define an application consisting of multiple Docker containers. You then spin up your application in a single command that does everything to deploy your defined environment. As an example, this article shows you how to quickly set up a WordPress blog with a backend MariaDB SQL database on an Ubuntu VM. You can also use Compose to set up more complex applications. This article was last tested on 10/28/2019 using the Azure Cloud Shell and the Azure CLI version 2.0.58.
Create Docker host with Azure CLI



# Install the latest Azure CLI and log in to an Azure account using az login.
https://docs.microsoft.com/nl-nl/cli/azure/install-azure-cli-apt?view=azure-cli-latest

|env| Create Docker host with Azure CLI|
|-------|------------------------------------------------------|
|Linux Ubuntu 18 |`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`|
|windows10 |invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet' |


##  virtual-machines/linux
`G:\VM_backup\ubuntu-19.04-desktop-amd64.iso`

`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

Gebruik apt-get upgrade om het CLI-pakket bij te werken. Deze opdracht voert een upgrade uit voor alle geïnstalleerde pakketten in uw systeem waarvan de afhankelijkheid nog niet is gewijzigd. Als u alleen de CLI wilt upgraden, gebruikt u apt-get install.

 `sudo apt-get update && sudo apt-get upgrade `

 `sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli `  
```
boscp08@boscp08-virtual-machine:~$ curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
[sudo] password for boscp08:         
Sorry, try again.
[sudo] password for boscp08:         
apt-get update
Hit:1 http://archive.canonical.com/ubuntu bionic InRelease
Hit:2 http://security.ubuntu.com/ubuntu bionic-security InRelease                                                                                   
Hit:3 http://archive.ubuntu.com/ubuntu bionic InRelease                                                                                             
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88,7 kB]                                                             
Ign:5 http://packages.linuxmint.com tina InRelease                                
Hit:6 http://packages.linuxmint.com tina Release                                                      
Get:7 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74,6 kB]                           
Get:9 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 DEP-11 Metadata [295 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 DEP-11 Metadata [254 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 DEP-11 Metadata [2468 B]
Get:12 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 DEP-11 Metadata [7916 B]
Fetched 722 kB in 1s (576 kB/s)                       
Reading package lists... Done
apt-get install -y apt-transport-https lsb-release gnupg curl
Reading package lists... Done
Building dependency tree       
Reading state information... Done
lsb-release is already the newest version (9.20170808ubuntu1).
curl is already the newest version (7.58.0-2ubuntu3.8).
gnupg is already the newest version (2.2.4-1ubuntu1.2).
apt-transport-https is already the newest version (1.6.12).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
set +v
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg
gpg: WARNING: unsafe ownership on homedir '/home/boscp08/.gnupg'
set +v
CLI_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${CLI_REPO} main" \
    > /etc/apt/sources.list.d/azure-cli.list
apt-get update
Hit:1 http://security.ubuntu.com/ubuntu bionic-security InRelease
Ign:2 https://packages.microsoft.com/repos/azure-cli tina InRelease                                                      
Err:3 https://packages.microsoft.com/repos/azure-cli tina Release                                                        
  404  Not Found [IP: 13.80.10.205 443]
Hit:4 http://archive.canonical.com/ubuntu bionic InRelease          
Hit:5 http://archive.ubuntu.com/ubuntu bionic InRelease                                                  
Hit:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease                                                                       
Hit:7 http://archive.ubuntu.com/ubuntu bionic-backports InRelease                                                                    
Ign:8 http://packages.linuxmint.com tina InRelease                       
Hit:9 http://packages.linuxmint.com tina Release
Reading package lists... Done
E: The repository 'https://packages.microsoft.com/repos/azure-cli tina Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.

boscp08@boscp08-virtual-machine:~$ sudo apt-get update && sudo apt-get install --only-upgrade -y azure-cli
Hit:1 http://archive.canonical.com/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease                                                                                             
Hit:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease                                                                                     
Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88,7 kB]                                                                         
Hit:5 http://archive.ubuntu.com/ubuntu bionic-backports InRelease                                                                                   
Ign:6 https://packages.microsoft.com/repos/azure-cli tina InRelease                                                                                 
Err:7 https://packages.microsoft.com/repos/azure-cli tina Release                                                                        
  404  Not Found [IP: 13.80.10.205 443]
Ign:8 http://packages.linuxmint.com tina InRelease                                  
Hit:9 http://packages.linuxmint.com tina Release   
Get:11 http://security.ubuntu.com/ubuntu bionic-security/main i386 Packages [386 kB]
Get:12 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [541 kB]
Get:13 http://security.ubuntu.com/ubuntu bionic-security/main amd64 DEP-11 Metadata [38,5 kB]
Get:14 http://security.ubuntu.com/ubuntu bionic-security/universe i386 Packages [595 kB]
Get:15 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [616 kB]
Get:16 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 DEP-11 Metadata [42,1 kB]
Get:17 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 DEP-11 Metadata [2464 B]
Reading package lists... Done                           
E: The repository 'https://packages.microsoft.com/repos/azure-cli tina Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

Nu u de Azure CLI hebt geïnstalleerd, kunt u een korte rondleiding volgen om kennis te maken met de functies en veelgebruikte opdrachten.

`az login ` 

bosch.peter@outlook.com   :)

```
boscp08@ubuntu:~$ az login
Note, we have launched a browser for you to login. For old experience with device code, use "az login --use-device-code"
You have logged in. Now let us find all the subscriptions to which you have access...
[
  {
    "cloudName": "AzureCloud",
    "id": "cfcb03ea-255b-42f8-beca-2d4ac30779bb",
    "isDefault": true,
    "name": "Gratis versie",
    "state": "Enabled",
    "tenantId": "62123322-502d-493f-b543-503672043240",
    "user": {
      "name": "bosch.peter@outlook.com",
      "type": "user"
    }
  }
]

```
## Create Docker host with Azure CLI

First, create a resource group for your Docker environment with az group create. The following example creates a resource group named myResourceGroup in the eastus location:

`az group create --name myDockerGroup --location eastus`

```
boscp08@ubuntu:~$ az group create --name myDockerGroup --location eastus
{
  "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup",
  "location": "eastus",
  "managedBy": null,
  "name": "myDockerGroup",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
```

😸
```
boscp08@ubuntu:~$ sensible-editor cloud-init.txt

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.tiny
  3. /bin/ed

Choose 1-3 [1]: 1

boscp08@ubuntu:~$ cat cloud-init.txt 
#include https://get.docker.com


```
Now create a VM with `az vm create` . Use the --custom-data parameter to pass in your cloud-init config file. Provide the full path to the cloud-init.txt config if you saved the file outside of your present working directory. The following example creates a VM named myDockerVM and opens port 80 to web traffic.

```
az vm create \
    --resource-group myDockerGroup \
    --name myDockerVM \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --custom-data cloud-init.txt
az vm open-port --port 80 \
    --resource-group myDockerGroup \
	--name myDockerVM
  ```
  
 It takes a few minutes for the VM to be created, the packages to install, and the app to start. There are background tasks that continue to run after the Azure CLI returns you to the prompt. When the VM has been created, take note of the **publicIpAddress** displayed by the Azure CLI.

publicIpAddress": "40.117.233.34", 👇 


```
boscp08@ubuntu:~$ az vm create \
>     --resource-group myDockerGroup \
>     --name myDockerVM \
>     --image UbuntuLTS \
>     --admin-username boscp08 \
>     --admin-password geheim \
>     --generate-ssh-keys \
>     --custom-data cloud-init.txt
SSH key files '/home/boscp08/.ssh/id_rsa' and '/home/boscp08/.ssh/id_rsa.pub' have been generated under ~/.ssh to allow SSH access to the VM. If using machines without permanent storage, back up your keys to a safe location.
{
  "fqdns": "",
  "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Compute/virtualMachines/myDockerVM",
  "location": "eastus",
  "macAddress": "00-0D-3A-55-28-2C",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "40.121.146.69",
  "resourceGroup": "myDockerGroup",
  "zones": ""
}
boscp08@ubuntu:~$ az vm open-port --port 80 \
>     --resource-group myDockerGroup \
> --name myDockerVM
az vm open-port --port 443 \
>     --resource-group myDockerGroup \
> --name myDockerVM
az vm open-port --port 8880 \
>     --resource-group myDockerGroup \
> --name myDockerVM
```
[enter] 👉 
```
{
  "defaultSecurityRules": [
    {
      "access": "Allow",
      "description": "Allow inbound traffic from all VMs in VNET",
      "destinationAddressPrefix": "VirtualNetwork",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Inbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/AllowVnetInBound",
      "name": "AllowVnetInBound",
      "priority": 65000,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "VirtualNetwork",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    },
    {
      "access": "Allow",
      "description": "Allow inbound traffic from azure load balancer",
      "destinationAddressPrefix": "*",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Inbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/AllowAzureLoadBalancerInBound",
      "name": "AllowAzureLoadBalancerInBound",
      "priority": 65001,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "AzureLoadBalancer",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    },
    {
      "access": "Deny",
      "description": "Deny all inbound traffic",
      "destinationAddressPrefix": "*",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Inbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/DenyAllInBound",
      "name": "DenyAllInBound",
      "priority": 65500,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "*",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    },
    {
      "access": "Allow",
      "description": "Allow outbound traffic from all VMs to all VMs in VNET",
      "destinationAddressPrefix": "VirtualNetwork",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Outbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/AllowVnetOutBound",
      "name": "AllowVnetOutBound",
      "priority": 65000,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "VirtualNetwork",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    },
    {
      "access": "Allow",
      "description": "Allow outbound traffic from all VMs to Internet",
      "destinationAddressPrefix": "Internet",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Outbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/AllowInternetOutBound",
      "name": "AllowInternetOutBound",
      "priority": 65001,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "*",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    },
    {
      "access": "Deny",
      "description": "Deny all outbound traffic",
      "destinationAddressPrefix": "*",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "*",
      "destinationPortRanges": [],
      "direction": "Outbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/defaultSecurityRules/DenyAllOutBound",
      "name": "DenyAllOutBound",
      "priority": 65500,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "*",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
    }
  ],
  "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
  "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG",
  "location": "eastus",
  "name": "myDockerVMNSG",
  "networkInterfaces": [
    {
      "dnsSettings": null,
      "enableAcceleratedNetworking": null,
      "enableIpForwarding": null,
      "etag": null,
      "hostedWorkloads": null,
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkInterfaces/myDockerVMVMNic",
      "ipConfigurations": null,
      "location": null,
      "macAddress": null,
      "name": null,
      "networkSecurityGroup": null,
      "primary": null,
      "privateEndpoint": null,
      "provisioningState": null,
      "resourceGroup": "myDockerGroup",
      "resourceGuid": null,
      "tags": null,
      "tapConfigurations": null,
      "type": null,
      "virtualMachine": null
    }
  ],
  "provisioningState": "Succeeded",
  "resourceGroup": "myDockerGroup",
  "resourceGuid": "35700ba4-503c-48f4-9eb4-3e64690e5fd9",
  "securityRules": [
    {
      "access": "Allow",
      "description": null,
      "destinationAddressPrefix": "*",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "22",
      "destinationPortRanges": [],
      "direction": "Inbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/securityRules/default-allow-ssh",
      "name": "default-allow-ssh",
      "priority": 1000,
      "protocol": "Tcp",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "*",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/securityRules"
    },
    {
      "access": "Allow",
      "description": null,
      "destinationAddressPrefix": "*",
      "destinationAddressPrefixes": [],
      "destinationApplicationSecurityGroups": null,
      "destinationPortRange": "80",
      "destinationPortRanges": [],
      "direction": "Inbound",
      "etag": "W/\"23939d12-ff25-4237-b0b3-dc04fd65c5c2\"",
      "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Network/networkSecurityGroups/myDockerVMNSG/securityRules/open-port-80",
      "name": "open-port-80",
      "priority": 900,
      "protocol": "*",
      "provisioningState": "Succeeded",
      "resourceGroup": "myDockerGroup",
      "sourceAddressPrefix": "*",
      "sourceAddressPrefixes": [],
      "sourceApplicationSecurityGroups": null,
      "sourcePortRange": "*",
      "sourcePortRanges": [],
      "type": "Microsoft.Network/networkSecurityGroups/securityRules"
    }
  ],
  "subnets": null,
  "tags": {},
  "type": "Microsoft.Network/networkSecurityGroups"
```


## Install Compose

SSH to your new Docker host VM. Provide your own IP address.
bash ssh azureuser@10.10.111.11 Install Compose on the VM. bash

***
## Error: Permission denied (publickey)
` ssh boscp08@40.121.146.69` 

Permission denied (publickey).  😡 
https://www.reddit.com/r/AZURE/comments/7f0htz/cant_ssh_into_ubuntu_vm_permission_denied/
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys

Error: Permission denied (publickey) A "Permission denied" error means that the server rejected your connection. 

```
boscp08@myDockerVM:~/.ssh$ tail -f /var/log/auth.log
Oct 29 16:09:24 myDockerVM sshd[70401]: Connection closed by authenticating user boscp08 86.86.102.241 port 50847 [preauth]
```


```
boscp08@myDockerVM:~/.ssh$ grep -vE "^#|^$" /etc/ssh/sshd_config
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem	sftp	/usr/lib/openssh/sftp-server
ClientAliveInterval 120
```


20191029	Would be really happy if anyone had seen this issues before and found a solution to share with.

 grep -vE "^#|^$" /etc/ssh/sshd_config  

20191029	Setting PasswordAuthentication no causes Permission denied (publickey}

 /etc/ssh/sshd_config 

boscp08@myDockerVM:/etc/ssh$ `sudo nano sshd_config`
```
# To disable tunneled clear text passwords, change to no here!
#####PasswordAuthentication no
#PermitEmptyPasswords no
``
 😉 
***

SSH into your VM  With the public key deployed on your Azure VM, and the private key on your local system, SSH into your VM using the IP address or DNS name of your VM. In the following command, replace azureuser and myvm.westus.cloudapp.azure.com with the administrator user name and the fully qualified domain name (or IP address):bash  `ssh azureuser@myvm.westus.cloudapp.azure.com`

If you specified a passphrase when you created your key pair, enter that passphrase when prompted during the login process. The VM is added to your ~/.ssh/known_hosts file, and you won't be asked to connect again until either the public key on your Azure VM changes or the server name is removed from ~/.ssh/known_hosts.If the VM is using the just-in-time access policy, you need to request access before you can connect to the VM. For more information about the just-in-time policy, see Manage virtual machine access using the just in time policy.

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cli-manage


boscp08@ubuntu:~$ `az vm delete --resource-group  myDockerGroup --name myDockerVM `
**Are you sure you want to perform this operation? (y/n): y**


boscp08@ubuntu:~$ ssh boscp08@40.117.233.34
The authenticity of host '40.117.233.34 (40.117.233.34)' can't be established.
ECDSA key fingerprint is SHA256:7rzRRojvC2WtyN+Yaals4J6kercaf7y+u6wWG11DECg.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '40.117.233.34' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 5.0.0-1023-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 System information disabled due to load higher than 1.0

1 package can be updated.
1 update is a security update.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

boscp08@myDockerVM:~$ 

`docker -v`
**Docker version 19.03.4, build 9013bf583a**

## docker-compose ... 

`sudo apt install docker-compose` 

```
boscp08@myDockerVM:~$ sudo apt install docker-compose
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  linux-headers-4.15.0-66
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  cgroupfs-mount golang-docker-credential-helpers libsecret-1-0 libsecret-common pigz python-asn1crypto python-backports.ssl-match-hostname python-cached-property
  python-certifi python-cffi-backend python-chardet python-cryptography python-docker python-dockerpty python-dockerpycreds python-docopt python-enum34 python-funcsigs
  python-functools32 python-idna python-ipaddress python-jsonschema python-mock python-openssl python-pbr python-pkg-resources python-requests python-six python-texttable
  python-urllib3 python-websocket python-yaml
Suggested packages:
  python-cryptography-doc python-cryptography-vectors python-enum34-doc python-funcsigs-doc python-mock-doc python-openssl-doc python-openssl-dbg python-setuptools
  python-socks python-ntlm
Recommended packages:
  docker.io
The following NEW packages will be installed:
  cgroupfs-mount docker-compose golang-docker-credential-helpers libsecret-1-0 libsecret-common pigz python-asn1crypto python-backports.ssl-match-hostname
  python-cached-property python-certifi python-cffi-backend python-chardet python-cryptography python-docker python-dockerpty python-dockerpycreds python-docopt
  python-enum34 python-funcsigs python-functools32 python-idna python-ipaddress python-jsonschema python-mock python-openssl python-pbr python-pkg-resources python-requests
  python-six python-texttable python-urllib3 python-websocket python-yaml
0 upgraded, 33 newly installed, 0 to remove and 1 not upgraded.
Need to get 2110 kB of archives.
After this operation, 10.0 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 pigz amd64 2.4-1 [57.4 kB]
Get:2 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 cgroupfs-mount all 1.4 [6320 B]
Get:3 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-backports.ssl-match-hostname all 3.5.0.1-1 [7024 B]
Get:4 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-pkg-resources all 39.0.1-2 [128 kB]
Get:5 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-cached-property all 1.3.1-1 [7568 B]
Get:6 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-six all 1.11.0-2 [11.3 kB]
Get:7 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 libsecret-common all 0.18.6-1 [4452 B]
Get:8 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 libsecret-1-0 amd64 0.18.6-1 [94.6 kB]
Get:9 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 golang-docker-credential-helpers amd64 0.5.0-2 [444 kB]
Get:10 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-dockerpycreds all 0.2.1-1 [4138 B]
Get:11 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-certifi all 2018.1.18-2 [144 kB]
Get:12 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-chardet all 3.0.4-1 [80.3 kB]
Get:13 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-idna all 2.6-1 [32.4 kB]
Get:14 http://azure.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python-urllib3 all 1.22-1ubuntu0.18.04.1 [85.9 kB]
Get:15 http://azure.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python-requests all 2.18.4-2ubuntu0.1 [58.5 kB]
Get:16 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-websocket all 0.44.0-0ubuntu2 [30.7 kB]
Get:17 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-ipaddress all 1.0.17-1 [18.2 kB]
Get:18 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-docker all 2.5.1-1 [69.0 kB]
Get:19 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-dockerpty all 0.4.1-1 [10.8 kB]
Get:20 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-docopt all 0.6.2-1build1 [25.6 kB]
Get:21 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-enum34 all 1.1.6-2 [34.8 kB]
Get:22 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-functools32 all 3.2.3.2-3 [10.8 kB]
Get:23 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-funcsigs all 1.0.2-4 [13.5 kB]
Get:24 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-pbr all 3.1.1-3ubuntu3 [53.7 kB]
Get:25 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-mock all 2.0.0-3 [47.4 kB]
Get:26 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-jsonschema all 2.6.0-2 [31.5 kB]
Get:27 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 python-texttable all 0.9.1-1 [8160 B]
Get:28 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-yaml amd64 3.12-1build2 [115 kB]
Get:29 http://azure.archive.ubuntu.com/ubuntu bionic/universe amd64 docker-compose all 1.17.1-2 [76.3 kB]
Get:30 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-asn1crypto all 0.24.0-1 [72.7 kB]
Get:31 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-cffi-backend amd64 1.11.5-1 [63.4 kB]
Get:32 http://azure.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python-cryptography amd64 2.1.4-1ubuntu1.3 [221 kB]
Get:33 http://azure.archive.ubuntu.com/ubuntu bionic/main amd64 python-openssl all 17.5.0-1ubuntu1 [41.3 kB]
Fetched 2110 kB in 0s (4835 kB/s)     
Extracting templates from packages: 100%
Selecting previously unselected package pigz.
(Reading database ... 74651 files and directories currently installed.)
Preparing to unpack .../00-pigz_2.4-1_amd64.deb ...
Unpacking pigz (2.4-1) ...
Selecting previously unselected package cgroupfs-mount.
Preparing to unpack .../01-cgroupfs-mount_1.4_all.deb ...
Unpacking cgroupfs-mount (1.4) ...
Selecting previously unselected package python-backports.ssl-match-hostname.
Preparing to unpack .../02-python-backports.ssl-match-hostname_3.5.0.1-1_all.deb ...
Unpacking python-backports.ssl-match-hostname (3.5.0.1-1) ...
Selecting previously unselected package python-pkg-resources.
Preparing to unpack .../03-python-pkg-resources_39.0.1-2_all.deb ...
Unpacking python-pkg-resources (39.0.1-2) ...
Selecting previously unselected package python-cached-property.
Preparing to unpack .../04-python-cached-property_1.3.1-1_all.deb ...
Unpacking python-cached-property (1.3.1-1) ...
Selecting previously unselected package python-six.
Preparing to unpack .../05-python-six_1.11.0-2_all.deb ...
Unpacking python-six (1.11.0-2) ...
Selecting previously unselected package libsecret-common.
Preparing to unpack .../06-libsecret-common_0.18.6-1_all.deb ...
Unpacking libsecret-common (0.18.6-1) ...
Selecting previously unselected package libsecret-1-0:amd64.
Preparing to unpack .../07-libsecret-1-0_0.18.6-1_amd64.deb ...
Unpacking libsecret-1-0:amd64 (0.18.6-1) ...
Selecting previously unselected package golang-docker-credential-helpers.
Preparing to unpack .../08-golang-docker-credential-helpers_0.5.0-2_amd64.deb ...
Unpacking golang-docker-credential-helpers (0.5.0-2) ...
Selecting previously unselected package python-dockerpycreds.
Preparing to unpack .../09-python-dockerpycreds_0.2.1-1_all.deb ...
Unpacking python-dockerpycreds (0.2.1-1) ...
Selecting previously unselected package python-certifi.
Preparing to unpack .../10-python-certifi_2018.1.18-2_all.deb ...
Unpacking python-certifi (2018.1.18-2) ...
Selecting previously unselected package python-chardet.
Preparing to unpack .../11-python-chardet_3.0.4-1_all.deb ...
Unpacking python-chardet (3.0.4-1) ...
Selecting previously unselected package python-idna.
Preparing to unpack .../12-python-idna_2.6-1_all.deb ...
Unpacking python-idna (2.6-1) ...
Selecting previously unselected package python-urllib3.
Preparing to unpack .../13-python-urllib3_1.22-1ubuntu0.18.04.1_all.deb ...
Unpacking python-urllib3 (1.22-1ubuntu0.18.04.1) ...
Selecting previously unselected package python-requests.
Preparing to unpack .../14-python-requests_2.18.4-2ubuntu0.1_all.deb ...
Unpacking python-requests (2.18.4-2ubuntu0.1) ...
Selecting previously unselected package python-websocket.
Preparing to unpack .../15-python-websocket_0.44.0-0ubuntu2_all.deb ...
Unpacking python-websocket (0.44.0-0ubuntu2) ...
Selecting previously unselected package python-ipaddress.
Preparing to unpack .../16-python-ipaddress_1.0.17-1_all.deb ...
Unpacking python-ipaddress (1.0.17-1) ...
Selecting previously unselected package python-docker.
Preparing to unpack .../17-python-docker_2.5.1-1_all.deb ...
Unpacking python-docker (2.5.1-1) ...
Selecting previously unselected package python-dockerpty.
Preparing to unpack .../18-python-dockerpty_0.4.1-1_all.deb ...
Unpacking python-dockerpty (0.4.1-1) ...
Selecting previously unselected package python-docopt.
Preparing to unpack .../19-python-docopt_0.6.2-1build1_all.deb ...
Unpacking python-docopt (0.6.2-1build1) ...
Selecting previously unselected package python-enum34.
Preparing to unpack .../20-python-enum34_1.1.6-2_all.deb ...
Unpacking python-enum34 (1.1.6-2) ...
Selecting previously unselected package python-functools32.
Preparing to unpack .../21-python-functools32_3.2.3.2-3_all.deb ...
Unpacking python-functools32 (3.2.3.2-3) ...
Selecting previously unselected package python-funcsigs.
Preparing to unpack .../22-python-funcsigs_1.0.2-4_all.deb ...
Unpacking python-funcsigs (1.0.2-4) ...
Selecting previously unselected package python-pbr.
Preparing to unpack .../23-python-pbr_3.1.1-3ubuntu3_all.deb ...
Unpacking python-pbr (3.1.1-3ubuntu3) ...
Selecting previously unselected package python-mock.
Preparing to unpack .../24-python-mock_2.0.0-3_all.deb ...
Unpacking python-mock (2.0.0-3) ...
Selecting previously unselected package python-jsonschema.
Preparing to unpack .../25-python-jsonschema_2.6.0-2_all.deb ...
Unpacking python-jsonschema (2.6.0-2) ...
Selecting previously unselected package python-texttable.
Preparing to unpack .../26-python-texttable_0.9.1-1_all.deb ...
Unpacking python-texttable (0.9.1-1) ...
Selecting previously unselected package python-yaml.
Preparing to unpack .../27-python-yaml_3.12-1build2_amd64.deb ...
Unpacking python-yaml (3.12-1build2) ...
Selecting previously unselected package docker-compose.
Preparing to unpack .../28-docker-compose_1.17.1-2_all.deb ...
Unpacking docker-compose (1.17.1-2) ...
Selecting previously unselected package python-asn1crypto.
Preparing to unpack .../29-python-asn1crypto_0.24.0-1_all.deb ...
Unpacking python-asn1crypto (0.24.0-1) ...
Selecting previously unselected package python-cffi-backend.
Preparing to unpack .../30-python-cffi-backend_1.11.5-1_amd64.deb ...
Unpacking python-cffi-backend (1.11.5-1) ...
Selecting previously unselected package python-cryptography.
Preparing to unpack .../31-python-cryptography_2.1.4-1ubuntu1.3_amd64.deb ...
Unpacking python-cryptography (2.1.4-1ubuntu1.3) ...
Selecting previously unselected package python-openssl.
Preparing to unpack .../32-python-openssl_17.5.0-1ubuntu1_all.deb ...
Unpacking python-openssl (17.5.0-1ubuntu1) ...
Setting up python-idna (2.6-1) ...
Setting up python-texttable (0.9.1-1) ...
Setting up libsecret-common (0.18.6-1) ...
Setting up python-functools32 (3.2.3.2-3) ...
Setting up python-yaml (3.12-1build2) ...
Setting up python-asn1crypto (0.24.0-1) ...
Setting up python-certifi (2018.1.18-2) ...
Setting up cgroupfs-mount (1.4) ...
Setting up python-pkg-resources (39.0.1-2) ...
Setting up python-backports.ssl-match-hostname (3.5.0.1-1) ...
Setting up python-cffi-backend (1.11.5-1) ...
Setting up python-six (1.11.0-2) ...
Setting up python-dockerpty (0.4.1-1) ...
Setting up python-pbr (3.1.1-3ubuntu3) ...
update-alternatives: using /usr/bin/python2-pbr to provide /usr/bin/pbr (pbr) in auto mode
Setting up python-enum34 (1.1.6-2) ...
Setting up python-funcsigs (1.0.2-4) ...
Setting up python-docopt (0.6.2-1build1) ...
Setting up python-ipaddress (1.0.17-1) ...
Setting up libsecret-1-0:amd64 (0.18.6-1) ...
Setting up pigz (2.4-1) ...
Setting up python-cached-property (1.3.1-1) ...
Setting up python-urllib3 (1.22-1ubuntu0.18.04.1) ...
Setting up python-chardet (3.0.4-1) ...
Setting up python-mock (2.0.0-3) ...
Setting up python-websocket (0.44.0-0ubuntu2) ...
update-alternatives: using /usr/bin/python2-wsdump to provide /usr/bin/wsdump (wsdump) in auto mode
Setting up golang-docker-credential-helpers (0.5.0-2) ...
Setting up python-cryptography (2.1.4-1ubuntu1.3) ...
Setting up python-requests (2.18.4-2ubuntu0.1) ...
Setting up python-jsonschema (2.6.0-2) ...
update-alternatives: using /usr/bin/python2-jsonschema to provide /usr/bin/jsonschema (jsonschema) in auto mode
Setting up python-dockerpycreds (0.2.1-1) ...
Setting up python-openssl (17.5.0-1ubuntu1) ...
Setting up python-docker (2.5.1-1) ...
Setting up docker-compose (1.17.1-2) ...
Processing triggers for systemd (237-3ubuntu10.31) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Processing triggers for ureadahead (0.100.0-21) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
```

boscp08@myDockerVM:~$ `docker-compose -v`
**docker-compose version 1.17.1, build unknown**

boscp08@myDockerVM:~$ `docker run hello-world`
```
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
boscp08@myDockerVM:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete 
Digest: sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

```
boscp08@myDockerVM:~$ `groupadd docker`
groupadd: group 'docker' already exists
boscp08@myDockerVM:~$ `sudo usermod -aG docker boscp08`
boscp08@myDockerVM:~$ docker run hello-world
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
**boscp08@myDockerVM**:~$ `exit`
logout
Connection to 40.117.233.34 closed.
boscp08@ubuntu:~$ `ssh boscp08@40.117.233.34`
Welcome to Ubuntu 18.04.3 LTS (GNU/Linux 5.0.0-1023-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Oct 28 21:35:57 UTC 2019

  System load:  0.0               Processes:              109
  Usage of /:   6.1% of 28.90GB   Users logged in:        0
  Memory usage: 13%               IP address for eth0:    10.0.0.4
  Swap usage:   0%                IP address for docker0: 172.17.0.1


1 package can be updated.
1 update is a security update.

Last login: Mon Oct 28 21:22:30 2019 from 86.86.102.241
boscp08@myDockerVM:~$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
set to go... hope the run will be okay

# git clone https://github.com/discipl/waardepapieren

```
boscp08@myDockerVM:~$ git --version
git version 2.17.1
boscp08@myDockerVM:~$ git clone https://github.com/discipl/waardepapieren
Cloning into 'waardepapieren'...
remote: Enumerating objects: 188, done.
remote: Counting objects: 100% (188/188), done.
remote: Compressing objects: 100% (117/117), done.
remote: Total 1798 (delta 92), reused 124 (delta 68), pack-reused 1610
Receiving objects: 100% (1798/1798), 14.09 MiB | 32.43 MiB/s, done.
Resolving deltas: 100% (1060/1060), done.
```


# docker-compose -f docker-compose-travis.yml up

```
#!bin/bash
docker stop $(docker ps  -a -q)
docker rm $(docker ps - a -q)
docker container prune  # cleanup disk
#docker rmi $(docker images -q)
cd waardepapieren
docker-compose -f docker-compose-travis.yml up
# ctrl-q stop gracefully
# URL=https://40.117.233.34
# BSN=663678651
```

***
start hacking 

## portal.azure.com

https://portal.azure.com/?configHash=x8B-2TCnUfFf&iepolyfills=true&l=nl.nl-nl&appPageVersion=5.0.302.61901037300.191025-2214#home
bosch.peter@outlook.com 0l


