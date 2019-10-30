# Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst
Waardepapieren AZURE ACI met ICTU/Belastingdienst

Met Compose gebruikt u een eenvoudig tekstbestand om een toepassing te definiëren die uit meerdere Docker-containers bestaat. Vervolgens draait u uw toepassing op met een enkele opdracht die er alles aan doet om uw gedefinieerde omgeving te implementeren. 

# container brings itś own file system, on every type of system

`type: Microsoft.ContainerInstance/containerGroups`

![kubernetes](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/kubernetes.PNG)

![k3](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/sem_k8s.PNG)
https://sietseringers.net/

Bas kan hem ook prebuilt bijhouden in de docker hub zoals de mensen van irma dat doen dan wordt de deployment eenvoudiger.  
Misschien kan bas hem packagen op docker hub

![azure]https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/bevrijden-regelingen-master.zip)


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

publicIpAddress": "40.121.146.69", 👇 


```
boscp08@ubuntu:~$ az vm create \
>     --resource-group myDockerGroup \
>     --name myDockerVM \
>     --image UbuntuLTS \
>     --admin-username azureuser \
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


` ssh boscp08@40.121.146.69` 
Permission denied (publickey).  😡 
https://www.reddit.com/r/AZURE/comments/7f0htz/cant_ssh_into_ubuntu_vm_permission_denied/
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys

## SSH Issue
SSH into your VM  With the public key deployed on your Azure VM, and the private key on your local system, SSH into your VM using the IP address or DNS name of your VM. In the following command, replace azureuser and myvm.westus.cloudapp.azure.com with the administrator user name and the fully qualified domain name (or IP address):bash

`ssh azureuser@myvm.westus.cloudapp.azure.com`

If you specified a passphrase when you created your key pair, enter that passphrase when prompted during the login process. The VM is added to your ~/.ssh/known_hosts file, and you won't be asked to connect again until either the public key on your Azure VM changes or the server name is removed from ~/.ssh/known_hosts.If the VM is using the just-in-time access policy, you need to request access before you can connect to the VM. For more information about the just-in-time policy, see Manage virtual machine access using the just in time policy.

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cli-manage


boscp08@ubuntu:~$ `az vm delete --resource-group  myDockerGroup --name myDockerVM `
**Are you sure you want to perform this operation? (y/n): y**

```
az vm create \
    --resource-group myDockerGroup \
    --name myDockerVM \
    --image UbuntuLTS \
    --admin-username boscp08 \
    --generate-ssh-keys \
    --custom-data cloud-init.txt
az vm open-port --port 80 \
    --resource-group myDockerGroup \
	--name myDockerVM
```

recreate admin-username boscp08

```
boscp08@ubuntu:~$ az vm create \
>     --resource-group myDockerGroup \
>     --name myDockerVM \
>     --image UbuntuLTS \
>     --admin-username boscp08 \
>     --generate-ssh-keys \
>     --custom-data cloud-init.txt
 - Running ..
{
  "fqdns": "",
  "id": "/subscriptions/cfcb03ea-255b-42f8-beca-2d4ac30779bb/resourceGroups/myDockerGroup/providers/Microsoft.Compute/virtualMachines/myDockerVM",
  "location": "eastus",
  "macAddress": "00-0D-3A-55-28-2C",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "40.117.233.34",
  "resourceGroup": "myDockerGroup",
  "zones": ""
}
boscp08@ubuntu:~$ az vm open-port --port 80 \
>     --resource-group myDockerGroup \
> --name myDockerVM
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
  "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
      "etag": "W/\"ba619b3d-1993-4738-a082-7654f71b0be9\"",
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
}
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
```



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

`cd waardepapieren`

## Create a docker-compose.yml configuration file

Create a docker-compose.yml configuration file to define the Docker containers to run on the VM. The file specifies the image to run on each container, necessary environment variables and dependencies, ports, and the links between containers. For details on yml file syntax, see Compose file reference.  Create a docker-compose.yml file. Use your favorite text editor to add some data to the file. The following example creates the file with a prompt for sensible-editor to pick an editor that you wish to use. bash

`sensible-editor docker-compose.yml`
boscp08@myDockerVM:~/wordpress$ `cat docker-compose.yml `
```
wordpress:
  image: wordpress
  links:
    - db:mysql
  ports:
    - 80:80

db:
  image: mariadb
  environment:
    MYSQL_ROOT_PASSWORD: welcome01
```

## Start the containers with Compose

In the same directory as your docker-compose.yml file, run the following command (depending on your environment, you might need to run docker-compose using sudo): bash

`sudo docker-compose up -d`

This command starts the Docker containers specified in docker-compose.yml. It takes a minute or two for this step to complete. You'll see output similar to the following:

```
boscp08@myDockerVM:~/wordpress$ sudo docker-compose up -d
Pulling db (mariadb:latest)...
latest: Pulling from library/mariadb
22e816666fd6: Pull complete
079b6d2a1e53: Pull complete
11048ebae908: Pull complete
c58094023a2e: Pull complete
1e8f13102fa0: Pull complete
8c1425d731a6: Pull complete
14e6f69e6aab: Pull complete
c90c2f3858cf: Pull complete
b78202ba9229: Pull complete
cadce28d1b9c: Pull complete
6fb2c5af5492: Pull complete
7a59522b36b8: Pull complete
722b05c4c4b1: Pull complete
bd4039b5406f: Pull complete
Digest: sha256:7b371982ac83beee40bee645c6efab1bc9113abbce9cbc95bf3eddac268adf57
Status: Downloaded newer image for mariadb:latest
Pulling wordpress (wordpress:latest)...
latest: Pulling from library/wordpress
8d691f585fa8: Pull complete
cba12d3fd8b1: Pull complete
cda54d6474c8: Pull complete
412447ed0729: Pull complete
84de6fc539c3: Pull complete
d67567ed6145: Pull complete
22ca6c438da4: Pull complete
aaaf25e57dd6: Pull complete
fbccd385090a: Pull complete
15b403f621d7: Pull complete
1cae2d7071d0: Pull complete
5c0cbd6e0573: Pull complete
1b48a6c1e889: Pull complete
855d31502496: Pull complete
10805e670603: Pull complete
e8bb78a1b6fd: Pull complete
2ad26d4ff931: Pull complete
98da1a26f856: Pull complete
9cbdfce1994c: Pull complete
a872c625da6b: Pull complete
f36709107bb2: Pull complete
Digest: sha256:aca0d10bb5150afc6fe9c0d3e792cbb3f3979ddb9143e5b1034c6c6ecd292b95
Status: Downloaded newer image for wordpress:latest
Creating wordpress_db_1 ... 
Creating wordpress_db_1 ... done
Creating wordpress_wordpress_1 ... 
Creating wordpress_wordpress_1 ... done
```

boscp08@myDockerVM:~/wordpress$ `docker images`

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
wordpress           latest              c3a1256d5af5        3 days ago          537MB
mariadb             latest              a9e108e8ee8a        10 days ago         356MB
hello-world         latest              fce289e99eb9        10 months ago       1.84kB
```

`docker container prune`
boscp08@myDockerVM:~/wordpress$ `docker container ps -a`

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                NAMES
50605225d4b3        wordpress           "docker-entrypoint.s…"   30 seconds ago      Up 28 seconds               0.0.0.0:80->80/tcp   wordpress_wordpress_1
cf3dd97ca629        mariadb             "docker-entrypoint.s…"   48 seconds ago      Up 30 seconds               3306/tcp             wordpress_db_1

```

You can now connect to WordPress directly on the VM on port 80. Open a web browser and enter the IP address name of your VM. You should now see the WordPress start screen, where you can complete the installation and get started with the application.

http://40.117.233.34/wp-admin/install.php  Error establishing a database connection    😡 

https://www.youtube.com/watch?v=uPTemVX1nnQ

# docker-compose -f docker-compose-travis.yml up

```
boscp08@myDockerVM:~$ cd waardepapieren/
boscp08@myDockerVM:~/waardepapieren$ ls
LICENSE    authorization-backend  client-frontend  docker-compose-travis.yml  documentation  pictures  validator-frontend
README.md  clerk-frontend         demo-certs       docker-compose.yml         mock-nlx       reports   waardepapieren-service
boscp08@myDockerVM:~/waardepapieren$ nano docker-compose-travis.yml 
boscp08@myDockerVM:~/waardepapieren$ ls
LICENSE    authorization-backend  client-frontend  docker-compose-travis.yml  documentation  pictures  validator-frontend
README.md  clerk-frontend         demo-certs       docker-compose.yml         mock-nlx       reports   waardepapieren-service
boscp08@myDockerVM:~/waardepapieren$ cd clerk-frontend/
boscp08@myDockerVM:~/waardepapieren/clerk-frontend$ nano Dockerfile 
boscp08@myDockerVM:~/waardepapieren/clerk-frontend$ cd ..
boscp08@myDockerVM:~/waardepapieren$ ls
LICENSE    authorization-backend  client-frontend  docker-compose-travis.yml  documentation  pictures  validator-frontend
README.md  clerk-frontend         demo-certs       docker-compose.yml         mock-nlx       reports   waardepapieren-service
boscp08@myDockerVM:~/waardepapieren$ docker-compose -f docker-compose-travis.yml up
Creating network "waardepapieren_default" with the default driver
Building mock-nlx
Step 1/6 : FROM node:10
10: Pulling from library/node
9a0b0ce99936: Extracting [==================================================>]  45.38MB/45.38MB
db3b6004c61a: Download complete
f8f075920295: Download complete
6ef14aff1139: Download complete
0bbd8b48260f: Download complete                                                              9a0b0ce99936: Pull complete
6ef14aff1139: Extracting [===================================>               ]  35.13MB/50.07MB
f8f075920295: Pull complete
6ef14aff1139: Pull complete
0bbd8b48260f: Pull complete
524be717efb1: Pull complete
5216176a8ae7: Pull complete
30f1e4a2facd: Pull complete
823c0b3f4fa2: Pull complete
Digest: sha256:dabc15ad36a9e0a95862fbdf6ffdad439edc20aa27c7f10456644464e3fb5f08
Status: Downloaded newer image for node:10
 ---> e45bc9197ec9
Step 2/6 : RUN mkdir /app
 ---> Running in b48a962c8185
Removing intermediate container b48a962c8185
 ---> 2cc468a0ab4a
Step 3/6 : ADD index.js package.json package-lock.json /app/
 ---> 73d49f850702
Step 4/6 : WORKDIR /app
 ---> Running in c32690f26999
Removing intermediate container c32690f26999
 ---> 599964180da1
Step 5/6 : RUN npm install --production
 ---> Running in 30d1c255c782
added 48 packages from 36 contributors and audited 121 packages in 1.408s
found 0 vulnerabilities

Removing intermediate container 30d1c255c782
 ---> dadd2e42b740
Step 6/6 : CMD npm start
 ---> Running in 39e08365db25
Removing intermediate container 39e08365db25
 ---> a80140763bd7
Successfully built a80140763bd7
Successfully tagged waardepapieren_mock-nlx:latest
WARNING: Image for service mock-nlx was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Building waardepapieren-service
Step 1/9 : FROM node:10
 ---> e45bc9197ec9
Step 2/9 : RUN mkdir /app
 ---> Using cache
 ---> 2cc468a0ab4a
Step 3/9 : ADD .babelrc package.json package-lock.json /app/
 ---> c3b46f131ec6
Step 4/9 : ADD src/* app/src/
 ---> 49a0df4714cb
Step 5/9 : ADD configuration/* app/configuration/
 ---> 4d66c2c96a30
Step 6/9 : ENV WAARDEPAPIEREN_CONFIG /app/configuration/waardepapieren-config.json
 ---> Running in 473173fe4af2
Removing intermediate container 473173fe4af2
 ---> 052c634f96fd
Step 7/9 : WORKDIR /app
 ---> Running in e125ee8ea793
Removing intermediate container e125ee8ea793
 ---> c8b6c2abae74
Step 8/9 : RUN npm install --production
 ---> Running in 7ce91726f52a

> websocket@1.0.28 install /app/node_modules/websocket
> (node-gyp rebuild 2> builderror.log) || (exit 0)

make: Entering directory '/app/node_modules/websocket/build'
  CXX(target) Release/obj.target/bufferutil/src/bufferutil.o
  SOLINK_MODULE(target) Release/obj.target/bufferutil.node
  COPY Release/bufferutil.node
  CXX(target) Release/obj.target/validation/src/validation.o
  SOLINK_MODULE(target) Release/obj.target/validation.node
  COPY Release/validation.node
make: Leaving directory '/app/node_modules/websocket/build'

> core-js@3.1.4 postinstall /app/node_modules/core-js
> node scripts/postinstall || echo "ignore"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)


> core-js-pure@3.1.4 postinstall /app/node_modules/core-js-pure
> node scripts/postinstall || echo "ignore"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)


> jsonpath@1.0.1 postinstall /app/node_modules/jsonpath
> node lib/aesprim.js > generated/aesprim-browser.js

added 307 packages from 153 contributors and audited 2562 packages in 21.201s
found 2 high severity vulnerabilities
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container 7ce91726f52a
 ---> bc7498a96d3c
Step 9/9 : CMD npm start
 ---> Running in 457a5e2d63ec
Removing intermediate container 457a5e2d63ec
 ---> 694c02a84859
Successfully built 694c02a84859
Successfully tagged waardepapieren_waardepapieren-service:latest
WARNING: Image for service waardepapieren-service was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Building clerk-frontend
Step 1/15 : FROM node:10
 ---> e45bc9197ec9
Step 2/15 : RUN mkdir /app
 ---> Using cache
 ---> 2cc468a0ab4a
Step 3/15 : ADD package.json package-lock.json /app/
 ---> f19f4d860e3f
Step 4/15 : ENV REACT_APP_EPHEMERAL_ENDPOINT=https://40.117.233.34:443/api/eph
 ---> Running in 6e064c72de5c
Removing intermediate container 6e064c72de5c
 ---> c6d76b8eb48c
Step 5/15 : ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://40.117.233.34:443/api/eph-ws
 ---> Running in a5132824fc74
Removing intermediate container a5132824fc74
 ---> c67ea2e87dfe
Step 6/15 : WORKDIR /app
 ---> Running in f5940db287e0
Removing intermediate container f5940db287e0
 ---> 088da7ca1bf2
Step 7/15 : RUN npm install --unsafe-perm
 ---> Running in d2bef45149c0

> canvas@2.5.0 install /app/node_modules/canvas
> node-pre-gyp install --fallback-to-build

node-pre-gyp WARN Using request for node-pre-gyp https download 
[canvas] Success: "/app/node_modules/canvas/build/Release/canvas.node" is installed via remote

> core-js@2.6.8 postinstall /app/node_modules/babel-runtime/node_modules/core-js
> node -e "try { require('./scripts/postinstall'); } catch (e) { /* empty */ }"

Thank you for using core-js ( https://github.com/zloirock/core-js )!

Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)


> core-js-pure@3.1.2 postinstall /app/node_modules/core-js-pure
> node -e "try { require('./scripts/postinstall'); } catch (e) { /* empty */ }"

Thank you for using core-js ( https://github.com/zloirock/core-js )!

Please consider supporting of core-js on Open Collective or Patreon: 
> https://opencollective.com/core-js 
> https://www.patreon.com/zloirock 

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)


> cypress@3.4.1 postinstall /app/node_modules/cypress
> node index.js --exec install

Installing Cypress (version: 3.4.1)

[22:16:11]  Downloading Cypress     [started]
[22:16:11]  Downloading Cypress      0% 0s [title changed]
[22:16:12]  Downloading Cypress      5% 2s [title changed]
[22:16:12]  Downloading Cypress      12% 2s [title changed]
[22:16:12]  Downloading Cypress      19% 1s [title changed]
[22:16:12]  Downloading Cypress      25% 1s [title changed]
[22:16:12]  Downloading Cypress      33% 1s [title changed]
[22:16:12]  Downloading Cypress      39% 1s [title changed]
[22:16:12]  Downloading Cypress      48% 1s [title changed]
[22:16:12]  Downloading Cypress      55% 1s [title changed]
[22:16:12]  Downloading Cypress      64% 1s [title changed]
[22:16:12]  Downloading Cypress      70% 0s [title changed]
[22:16:13]  Downloading Cypress      79% 0s [title changed]
[22:16:13]  Downloading Cypress      89% 0s [title changed]
[22:16:13]  Downloading Cypress      97% 0s [title changed]
[22:16:13]  Downloaded Cypress      [title changed]
[22:16:13]  Downloaded Cypress      [completed]
[22:16:13]  Unzipping Cypress       [started]
[22:16:13]  Unzipping Cypress        0% 0s [title changed]
[22:16:16]  Unzipping Cypress        1% 291s [title changed]
[22:16:16]  Unzipping Cypress        1% 292s [title changed]
[22:16:16]  Unzipping Cypress        1% 293s [title changed]
[22:16:16]  Unzipping Cypress        1% 294s [title changed]
[22:16:16]  Unzipping Cypress        1% 295s [title changed]
[22:16:16]  Unzipping Cypress        1% 296s [title changed]
[22:16:16]  Unzipping Cypress        1% 297s [title changed]
[22:16:16]  Unzipping Cypress        1% 298s [title changed]
[22:16:16]  Unzipping Cypress        1% 299s [title changed]
[22:16:16]  Unzipping Cypress        1% 300s [title changed]
[22:16:16]  Unzipping Cypress        1% 301s [title changed]
[22:16:16]  Unzipping Cypress        1% 302s [title changed]
[22:16:16]  Unzipping Cypress        1% 303s [title changed]
[22:16:16]  Unzipping Cypress        1% 304s [title changed]
[22:16:17]  Unzipping Cypress        1% 305s [title changed]
[22:16:17]  Unzipping Cypress        1% 306s [title changed]
[22:16:17]  Unzipping Cypress        1% 307s [title changed]
[22:16:17]  Unzipping Cypress        1% 308s [title changed]
[22:16:17]  Unzipping Cypress        1% 309s [title changed]
[22:16:17]  Unzipping Cypress        1% 310s [title changed]
[22:16:17]  Unzipping Cypress        1% 311s [title changed]
[22:16:17]  Unzipping Cypress        1% 312s [title changed]
[22:16:17]  Unzipping Cypress        1% 313s [title changed]
[22:16:17]  Unzipping Cypress        1% 314s [title changed]
[22:16:17]  Unzipping Cypress        1% 315s [title changed]
[22:16:17]  Unzipping Cypress        1% 316s [title changed]
[22:16:17]  Unzipping Cypress        1% 317s [title changed]
[22:16:17]  Unzipping Cypress        1% 318s [title changed]
[22:16:17]  Unzipping Cypress        1% 319s [title changed]
[22:16:17]  Unzipping Cypress        1% 320s [title changed]
[22:16:17]  Unzipping Cypress        1% 321s [title changed]
[22:16:17]  Unzipping Cypress        1% 322s [title changed]
[22:16:17]  Unzipping Cypress        1% 323s [title changed]
[22:16:17]  Unzipping Cypress        1% 324s [title changed]
[22:16:17]  Unzipping Cypress        1% 325s [title changed]
[22:16:17]  Unzipping Cypress        1% 326s [title changed]
[22:16:17]  Unzipping Cypress        1% 327s [title changed]
[22:16:17]  Unzipping Cypress        1% 328s [title changed]
[22:16:17]  Unzipping Cypress        1% 329s [title changed]
[22:16:17]  Unzipping Cypress        1% 330s [title changed]
[22:16:17]  Unzipping Cypress        1% 331s [title changed]
[22:16:17]  Unzipping Cypress        1% 332s [title changed]
[22:16:17]  Unzipping Cypress        1% 333s [title changed]
[22:16:17]  Unzipping Cypress        1% 334s [title changed]
[22:16:17]  Unzipping Cypress        1% 335s [title changed]
[22:16:17]  Unzipping Cypress        1% 336s [title changed]
[22:16:17]  Unzipping Cypress        1% 337s [title changed]
[22:16:17]  Unzipping Cypress        1% 338s [title changed]
[22:16:17]  Unzipping Cypress        1% 339s [title changed]
[22:16:17]  Unzipping Cypress        1% 340s [title changed]
[22:16:17]  Unzipping Cypress        1% 341s [title changed]
[22:16:17]  Unzipping Cypress        1% 342s [title changed]
[22:16:17]  Unzipping Cypress        1% 343s [title changed]
[22:16:17]  Unzipping Cypress        1% 344s [title changed]
[22:16:17]  Unzipping Cypress        1% 345s [title changed]
[22:16:17]  Unzipping Cypress        1% 346s [title changed]
[22:16:17]  Unzipping Cypress        1% 347s [title changed]
[22:16:17]  Unzipping Cypress        1% 348s [title changed]
[22:16:17]  Unzipping Cypress        1% 349s [title changed]
[22:16:17]  Unzipping Cypress        1% 350s [title changed]
[22:16:17]  Unzipping Cypress        1% 351s [title changed]
[22:16:17]  Unzipping Cypress        1% 352s [title changed]
[22:16:17]  Unzipping Cypress        1% 353s [title changed]
[22:16:17]  Unzipping Cypress        1% 354s [title changed]
[22:16:17]  Unzipping Cypress        1% 355s [title changed]
[22:16:17]  Unzipping Cypress        1% 356s [title changed]
[22:16:17]  Unzipping Cypress        1% 357s [title changed]
[22:16:17]  Unzipping Cypress        1% 358s [title changed]
[22:16:17]  Unzipping Cypress        1% 359s [title changed]
[22:16:17]  Unzipping Cypress        1% 360s [title changed]
[22:16:17]  Unzipping Cypress        1% 361s [title changed]
[22:16:17]  Unzipping Cypress        1% 362s [title changed]
[22:16:17]  Unzipping Cypress        1% 363s [title changed]
[22:16:17]  Unzipping Cypress        1% 364s [title changed]
[22:16:17]  Unzipping Cypress        1% 365s [title changed]
[22:16:17]  Unzipping Cypress        2% 181s [title changed]
[22:16:17]  Unzipping Cypress        2% 182s [title changed]
[22:16:17]  Unzipping Cypress        2% 183s [title changed]
[22:16:17]  Unzipping Cypress        2% 184s [title changed]
[22:16:17]  Unzipping Cypress        2% 185s [title changed]
[22:16:17]  Unzipping Cypress        2% 186s [title changed]
[22:16:17]  Unzipping Cypress        2% 187s [title changed]
[22:16:17]  Unzipping Cypress        2% 188s [title changed]
[22:16:17]  Unzipping Cypress        2% 189s [title changed]
[22:16:17]  Unzipping Cypress        2% 190s [title changed]
[22:16:17]  Unzipping Cypress        2% 191s [title changed]
[22:16:17]  Unzipping Cypress        2% 192s [title changed]
[22:16:17]  Unzipping Cypress        2% 193s [title changed]
[22:16:17]  Unzipping Cypress        2% 194s [title changed]
[22:16:17]  Unzipping Cypress        2% 195s [title changed]
[22:16:17]  Unzipping Cypress        2% 196s [title changed]
[22:16:17]  Unzipping Cypress        2% 197s [title changed]
[22:16:17]  Unzipping Cypress        2% 198s [title changed]
[22:16:17]  Unzipping Cypress        2% 199s [title changed]
[22:16:17]  Unzipping Cypress        2% 200s [title changed]
[22:16:18]  Unzipping Cypress        2% 201s [title changed]
[22:16:18]  Unzipping Cypress        2% 202s [title changed]
[22:16:18]  Unzipping Cypress        2% 203s [title changed]
[22:16:18]  Unzipping Cypress        2% 204s [title changed]
[22:16:18]  Unzipping Cypress        2% 205s [title changed]
[22:16:18]  Unzipping Cypress        2% 206s [title changed]
[22:16:18]  Unzipping Cypress        2% 207s [title changed]
[22:16:18]  Unzipping Cypress        2% 208s [title changed]
[22:16:18]  Unzipping Cypress        2% 209s [title changed]
[22:16:18]  Unzipping Cypress        2% 210s [title changed]
[22:16:18]  Unzipping Cypress        2% 211s [title changed]
[22:16:18]  Unzipping Cypress        2% 212s [title changed]
[22:16:18]  Unzipping Cypress        2% 213s [title changed]
[22:16:18]  Unzipping Cypress        2% 214s [title changed]
[22:16:18]  Unzipping Cypress        2% 215s [title changed]
[22:16:18]  Unzipping Cypress        2% 216s [title changed]
[22:16:18]  Unzipping Cypress        2% 217s [title changed]
[22:16:18]  Unzipping Cypress        3% 143s [title changed]
[22:16:18]  Unzipping Cypress        3% 144s [title changed]
[22:16:18]  Unzipping Cypress        3% 145s [title changed]
[22:16:18]  Unzipping Cypress        3% 146s [title changed]
[22:16:18]  Unzipping Cypress        3% 147s [title changed]
[22:16:18]  Unzipping Cypress        3% 148s [title changed]
[22:16:18]  Unzipping Cypress        3% 149s [title changed]
[22:16:18]  Unzipping Cypress        3% 150s [title changed]
[22:16:18]  Unzipping Cypress        3% 151s [title changed]
[22:16:18]  Unzipping Cypress        3% 152s [title changed]
[22:16:18]  Unzipping Cypress        3% 153s [title changed]
[22:16:18]  Unzipping Cypress        3% 154s [title changed]
[22:16:18]  Unzipping Cypress        3% 155s [title changed]
[22:16:18]  Unzipping Cypress        3% 156s [title changed]
[22:16:18]  Unzipping Cypress        3% 157s [title changed]
[22:16:18]  Unzipping Cypress        3% 158s [title changed]
[22:16:18]  Unzipping Cypress        3% 159s [title changed]
[22:16:18]  Unzipping Cypress        3% 160s [title changed]
[22:16:18]  Unzipping Cypress        3% 161s [title changed]
[22:16:18]  Unzipping Cypress        3% 162s [title changed]
[22:16:18]  Unzipping Cypress        3% 163s [title changed]
[22:16:18]  Unzipping Cypress        3% 164s [title changed]
[22:16:19]  Unzipping Cypress        3% 165s [title changed]
[22:16:19]  Unzipping Cypress        3% 166s [title changed]
[22:16:19]  Unzipping Cypress        3% 167s [title changed]
[22:16:19]  Unzipping Cypress        4% 124s [title changed]
[22:16:19]  Unzipping Cypress        4% 125s [title changed]
[22:16:19]  Unzipping Cypress        4% 126s [title changed]
[22:16:19]  Unzipping Cypress        4% 127s [title changed]
[22:16:19]  Unzipping Cypress        4% 128s [title changed]
[22:16:19]  Unzipping Cypress        4% 129s [title changed]
[22:16:19]  Unzipping Cypress        4% 130s [title changed]
[22:16:19]  Unzipping Cypress        4% 131s [title changed]
[22:16:19]  Unzipping Cypress        4% 132s [title changed]
[22:16:19]  Unzipping Cypress        4% 133s [title changed]
[22:16:19]  Unzipping Cypress        4% 134s [title changed]
[22:16:19]  Unzipping Cypress        4% 135s [title changed]
[22:16:19]  Unzipping Cypress        4% 136s [title changed]
[22:16:19]  Unzipping Cypress        4% 137s [title changed]
[22:16:19]  Unzipping Cypress        4% 138s [title changed]
[22:16:19]  Unzipping Cypress        5% 109s [title changed]
[22:16:19]  Unzipping Cypress        5% 110s [title changed]
[22:16:19]  Unzipping Cypress        5% 111s [title changed]
[22:16:19]  Unzipping Cypress        5% 112s [title changed]
[22:16:19]  Unzipping Cypress        5% 113s [title changed]
[22:16:19]  Unzipping Cypress        5% 114s [title changed]
[22:16:19]  Unzipping Cypress        5% 115s [title changed]
[22:16:20]  Unzipping Cypress        5% 116s [title changed]
[22:16:20]  Unzipping Cypress        5% 117s [title changed]
[22:16:20]  Unzipping Cypress        5% 118s [title changed]
[22:16:20]  Unzipping Cypress        5% 119s [title changed]
[22:16:20]  Unzipping Cypress        5% 120s [title changed]
[22:16:20]  Unzipping Cypress        5% 121s [title changed]
[22:16:20]  Unzipping Cypress        6% 100s [title changed]
[22:16:20]  Unzipping Cypress        6% 101s [title changed]
[22:16:20]  Unzipping Cypress        6% 102s [title changed]
[22:16:35]  Unzipping Cypress        6% 330s [title changed]
[22:16:35]  Unzipping Cypress        6% 331s [title changed]
[22:16:35]  Unzipping Cypress        6% 332s [title changed]
[22:16:35]  Unzipping Cypress        6% 333s [title changed]
[22:16:35]  Unzipping Cypress        6% 334s [title changed]
[22:16:35]  Unzipping Cypress        6% 335s [title changed]
[22:16:35]  Unzipping Cypress        7% 284s [title changed]
[22:16:35]  Unzipping Cypress        7% 285s [title changed]
[22:16:35]  Unzipping Cypress        7% 286s [title changed]
[22:16:35]  Unzipping Cypress        7% 287s [title changed]
[22:16:35]  Unzipping Cypress        7% 288s [title changed]
[22:16:35]  Unzipping Cypress        7% 289s [title changed]
[22:16:35]  Unzipping Cypress        8% 250s [title changed]
[22:16:35]  Unzipping Cypress        8% 251s [title changed]
[22:16:35]  Unzipping Cypress        8% 252s [title changed]
[22:16:35]  Unzipping Cypress        8% 253s [title changed]
[22:16:35]  Unzipping Cypress        8% 254s [title changed]
[22:16:36]  Unzipping Cypress        9% 224s [title changed]
[22:16:36]  Unzipping Cypress        9% 225s [title changed]
[22:16:36]  Unzipping Cypress        9% 226s [title changed]
[22:16:36]  Unzipping Cypress        9% 227s [title changed]
[22:16:36]  Unzipping Cypress        9% 228s [title changed]
[22:16:36]  Unzipping Cypress        10% 203s [title changed]
[22:16:36]  Unzipping Cypress        10% 204s [title changed]
[22:16:37]  Unzipping Cypress        10% 213s [title changed]
[22:16:37]  Unzipping Cypress        10% 214s [title changed]
[22:16:37]  Unzipping Cypress        10% 215s [title changed]
[22:16:37]  Unzipping Cypress        11% 193s [title changed]
[22:16:37]  Unzipping Cypress        11% 194s [title changed]
[22:16:37]  Unzipping Cypress        11% 195s [title changed]
[22:16:38]  Unzipping Cypress        11% 196s [title changed]
[22:16:38]  Unzipping Cypress        12% 178s [title changed]
[22:16:38]  Unzipping Cypress        12% 179s [title changed]
[22:16:38]  Unzipping Cypress        12% 180s [title changed]
[22:16:38]  Unzipping Cypress        13% 165s [title changed]
[22:16:38]  Unzipping Cypress        13% 166s [title changed]
[22:16:38]  Unzipping Cypress        13% 167s [title changed]
[22:16:38]  Unzipping Cypress        14% 153s [title changed]
[22:16:38]  Unzipping Cypress        14% 154s [title changed]
[22:16:39]  Unzipping Cypress        14% 155s [title changed]
[22:16:39]  Unzipping Cypress        14% 156s [title changed]
[22:16:39]  Unzipping Cypress        15% 143s [title changed]
[22:16:39]  Unzipping Cypress        15% 144s [title changed]
[22:16:39]  Unzipping Cypress        15% 145s [title changed]
[22:16:39]  Unzipping Cypress        15% 146s [title changed]
[22:16:39]  Unzipping Cypress        16% 135s [title changed]
[22:16:39]  Unzipping Cypress        16% 136s [title changed]
[22:16:39]  Unzipping Cypress        16% 137s [title changed]
[22:16:40]  Unzipping Cypress        16% 138s [title changed]
[22:16:40]  Unzipping Cypress        16% 139s [title changed]
[22:16:40]  Unzipping Cypress        17% 129s [title changed]
[22:16:40]  Unzipping Cypress        17% 130s [title changed]
[22:16:40]  Unzipping Cypress        17% 131s [title changed]
[22:16:40]  Unzipping Cypress        18% 122s [title changed]
[22:16:40]  Unzipping Cypress        18% 123s [title changed]
[22:16:41]  Unzipping Cypress        18% 124s [title changed]
[22:16:41]  Unzipping Cypress        19% 116s [title changed]
[22:16:41]  Unzipping Cypress        19% 117s [title changed]
[22:16:41]  Unzipping Cypress        20% 110s [title changed]
[22:16:41]  Unzipping Cypress        20% 111s [title changed]
[22:16:41]  Unzipping Cypress        21% 105s [title changed]
[22:16:41]  Unzipping Cypress        21% 106s [title changed]
[22:16:42]  Unzipping Cypress        22% 100s [title changed]
[22:16:42]  Unzipping Cypress        22% 101s [title changed]
[22:16:42]  Unzipping Cypress        23% 95s [title changed]
[22:16:42]  Unzipping Cypress        23% 96s [title changed]
[22:16:42]  Unzipping Cypress        23% 97s [title changed]
[22:16:42]  Unzipping Cypress        24% 91s [title changed]
[22:16:42]  Unzipping Cypress        24% 92s [title changed]
[22:16:43]  Unzipping Cypress        25% 88s [title changed]
[22:16:43]  Unzipping Cypress        25% 89s [title changed]
[22:16:43]  Unzipping Cypress        26% 84s [title changed]
[22:16:43]  Unzipping Cypress        26% 85s [title changed]
[22:16:43]  Unzipping Cypress        27% 81s [title changed]
[22:16:44]  Unzipping Cypress        27% 82s [title changed]
[22:16:44]  Unzipping Cypress        28% 78s [title changed]
[22:16:44]  Unzipping Cypress        28% 79s [title changed]
[22:16:44]  Unzipping Cypress        29% 75s [title changed]
[22:16:44]  Unzipping Cypress        29% 76s [title changed]
[22:16:44]  Unzipping Cypress        30% 72s [title changed]
[22:16:44]  Unzipping Cypress        30% 73s [title changed]
[22:16:45]  Unzipping Cypress        31% 70s [title changed]
[22:16:45]  Unzipping Cypress        32% 67s [title changed]
[22:16:45]  Unzipping Cypress        32% 68s [title changed]
[22:16:45]  Unzipping Cypress        33% 65s [title changed]
[22:16:46]  Unzipping Cypress        33% 66s [title changed]
[22:16:46]  Unzipping Cypress        34% 63s [title changed]
[22:16:46]  Unzipping Cypress        35% 61s [title changed]
[22:16:46]  Unzipping Cypress        36% 59s [title changed]
[22:16:47]  Unzipping Cypress        37% 57s [title changed]
[22:16:47]  Unzipping Cypress        38% 55s [title changed]
[22:16:47]  Unzipping Cypress        39% 53s [title changed]
[22:16:48]  Unzipping Cypress        39% 54s [title changed]
[22:16:48]  Unzipping Cypress        40% 51s [title changed]
[22:16:48]  Unzipping Cypress        40% 52s [title changed]
[22:16:48]  Unzipping Cypress        41% 50s [title changed]
[22:16:49]  Unzipping Cypress        41% 51s [title changed]
[22:16:49]  Unzipping Cypress        42% 49s [title changed]
[22:16:49]  Unzipping Cypress        42% 50s [title changed]
[22:16:50]  Unzipping Cypress        43% 48s [title changed]
[22:16:50]  Unzipping Cypress        44% 46s [title changed]
[22:16:50]  Unzipping Cypress        44% 47s [title changed]
[22:16:50]  Unzipping Cypress        45% 45s [title changed]
[22:16:51]  Unzipping Cypress        45% 46s [title changed]
[22:16:51]  Unzipping Cypress        46% 44s [title changed]
[22:16:51]  Unzipping Cypress        46% 45s [title changed]
[22:16:51]  Unzipping Cypress        47% 43s [title changed]
[22:16:52]  Unzipping Cypress        48% 42s [title changed]
[22:16:52]  Unzipping Cypress        49% 40s [title changed]
[22:16:52]  Unzipping Cypress        49% 41s [title changed]
[22:16:52]  Unzipping Cypress        50% 39s [title changed]
[22:16:53]  Unzipping Cypress        51% 38s [title changed]
[22:16:54]  Unzipping Cypress        51% 39s [title changed]
[22:16:54]  Unzipping Cypress        52% 37s [title changed]
[22:16:54]  Unzipping Cypress        52% 38s [title changed]
[22:16:54]  Unzipping Cypress        53% 36s [title changed]
[22:16:55]  Unzipping Cypress        53% 37s [title changed]
[22:16:55]  Unzipping Cypress        54% 35s [title changed]
[22:16:55]  Unzipping Cypress        54% 36s [title changed]
[22:16:56]  Unzipping Cypress        55% 35s [title changed]
[22:16:56]  Unzipping Cypress        56% 33s [title changed]
[22:16:56]  Unzipping Cypress        56% 34s [title changed]
[22:16:56]  Unzipping Cypress        57% 32s [title changed]
[22:16:57]  Unzipping Cypress        57% 33s [title changed]
[22:16:57]  Unzipping Cypress        58% 31s [title changed]
[22:16:57]  Unzipping Cypress        58% 32s [title changed]
[22:16:57]  Unzipping Cypress        59% 30s [title changed]
[22:16:57]  Unzipping Cypress        59% 31s [title changed]
[22:16:57]  Unzipping Cypress        60% 29s [title changed]
[22:16:58]  Unzipping Cypress        60% 30s [title changed]
[22:16:58]  Unzipping Cypress        61% 28s [title changed]
[22:16:58]  Unzipping Cypress        61% 29s [title changed]
[22:16:58]  Unzipping Cypress        62% 27s [title changed]
[22:16:58]  Unzipping Cypress        62% 28s [title changed]
[22:16:59]  Unzipping Cypress        63% 26s [title changed]
[22:16:59]  Unzipping Cypress        63% 27s [title changed]
[22:16:59]  Unzipping Cypress        64% 26s [title changed]
[22:16:59]  Unzipping Cypress        65% 25s [title changed]
[22:17:00]  Unzipping Cypress        66% 24s [title changed]
[22:17:00]  Unzipping Cypress        67% 23s [title changed]
[22:17:00]  Unzipping Cypress        68% 22s [title changed]
[22:17:01]  Unzipping Cypress        69% 21s [title changed]
[22:17:13]  Unzipping Cypress        69% 27s [title changed]
[22:17:13]  Unzipping Cypress        70% 26s [title changed]
[22:17:14]  Unzipping Cypress        71% 25s [title changed]
[22:17:14]  Unzipping Cypress        72% 24s [title changed]
[22:17:14]  Unzipping Cypress        73% 23s [title changed]
[22:17:15]  Unzipping Cypress        74% 22s [title changed]
[22:17:15]  Unzipping Cypress        75% 21s [title changed]
[22:17:15]  Unzipping Cypress        76% 20s [title changed]
[22:17:16]  Unzipping Cypress        77% 19s [title changed]
[22:17:16]  Unzipping Cypress        78% 18s [title changed]
[22:17:17]  Unzipping Cypress        79% 17s [title changed]
[22:17:17]  Unzipping Cypress        80% 16s [title changed]
[22:17:17]  Unzipping Cypress        81% 15s [title changed]
[22:17:18]  Unzipping Cypress        82% 14s [title changed]
[22:17:18]  Unzipping Cypress        83% 13s [title changed]
[22:17:18]  Unzipping Cypress        84% 12s [title changed]
[22:17:19]  Unzipping Cypress        85% 11s [title changed]
[22:17:19]  Unzipping Cypress        85% 12s [title changed]
[22:17:19]  Unzipping Cypress        86% 11s [title changed]
[22:17:19]  Unzipping Cypress        87% 10s [title changed]
[22:17:20]  Unzipping Cypress        88% 9s [title changed]
[22:17:20]  Unzipping Cypress        89% 8s [title changed]
[22:17:20]  Unzipping Cypress        90% 7s [title changed]
[22:17:21]  Unzipping Cypress        91% 7s [title changed]
[22:17:21]  Unzipping Cypress        92% 6s [title changed]
[22:17:21]  Unzipping Cypress        93% 5s [title changed]
[22:17:22]  Unzipping Cypress        94% 4s [title changed]
[22:17:22]  Unzipping Cypress        95% 4s [title changed]
[22:17:22]  Unzipping Cypress        96% 3s [title changed]
[22:17:23]  Unzipping Cypress        97% 2s [title changed]
[22:17:23]  Unzipping Cypress        98% 1s [title changed]
[22:17:23]  Unzipping Cypress        99% 1s [title changed]
[22:17:24]  Unzipping Cypress        100% 0s [title changed]
[22:17:24]  Unzipped Cypress        [title changed]
[22:17:24]  Unzipped Cypress        [completed]
[22:17:24]  Finishing Installation  [started]
[22:17:24]  Finished Installation   /root/.cache/Cypress/3.4.1 [title changed]
[22:17:24]  Finished Installation   /root/.cache/Cypress/3.4.1 [completed]

You can now open Cypress by running: node_modules/.bin/cypress open

https://on.cypress.io/installing-cypress

npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.9 (node_modules/jest-haste-map/node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.9: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.9 (node_modules/chokidar/node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.9: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.0.6 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.0.6: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 1588 packages from 806 contributors and audited 902711 packages in 136.381s
found 1 high severity vulnerability
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container d2bef45149c0
 ---> f8ca99cf7b9d
Step 8/15 : ADD public /app/public
 ---> 02c4d605934a
Step 9/15 : ADD src /app/src
 ---> 31c84c5d4ea9
Step 10/15 : ARG CERTIFICATE_HOST
 ---> Running in ed3e0fe67837
Removing intermediate container ed3e0fe67837
 ---> efefdf4ea1de
Step 11/15 : ENV REACT_APP_CERTIFICATE_HOST=${CERTIFICATE_HOST}
 ---> Running in 957055d3db2d
Removing intermediate container 957055d3db2d
 ---> a8bc605db036
Step 12/15 : RUN npm run build
 ---> Running in 8a854408a856

> clerk-frontend@0.2.1 build /app
> react-scripts build

Creating an optimized production build...
Browserslist: caniuse-lite is outdated. Please run next command `npm update`
Compiled with warnings.

./node_modules/@discipl/core/src/connector-loader.js
Critical dependency: the request of a dependency is an expression

Search for the keywords to learn more about each warning.
To ignore, add // eslint-disable-next-line to the line before.

File sizes after gzip:

  288.25 KB  build/static/js/2.ce062947.chunk.js
  3.43 KB    build/static/js/main.5a39cc69.chunk.js
  762 B      build/static/js/runtime~main.a8a9905a.js
  393 B      build/static/css/main.cb968b21.chunk.css

The project was built assuming it is hosted at the server root.
You can control this with the homepage field in your package.json.
For example, add this to build it for GitHub Pages:

  "homepage" : "http://myname.github.io/myapp",

The build folder is ready to be deployed.
You may serve it with a static server:

  npm install -g serve
  serve -s build

Find out more about deployment here:

  https://bit.ly/CRA-deploy

Removing intermediate container 8a854408a856
 ---> abd1fb1b605c
Step 13/15 : FROM nginx:1.15.8
1.15.8: Pulling from library/nginx
6ae821421a7d: Pull complete
da4474e5966c: Pull complete
eb2aec2b9c9f: Pull complete
Digest: sha256:dd2d0ac3fff2f007d99e033b64854be0941e19a2ad51f174d9240dda20d9f534
Status: Downloaded newer image for nginx:1.15.8
 ---> f09fe80eb0e7
Step 14/15 : ADD nginx/nginx.conf /etc/nginx/nginx.conf
 ---> 09b11a56bce7
Step 15/15 : COPY --from=0 /app/build /usr/share/nginx/html
 ---> 73dc37cdba11
Successfully built 73dc37cdba11
Successfully tagged waardepapieren_clerk-frontend:latest
WARNING: Image for service clerk-frontend was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating waardepapieren_mock-nlx_1 ... 
Creating waardepapieren_mock-nlx_1 ... error

ERROR: for waardepapieren_mock-nlx_1  Cannot start service mock-nlx: driver failed programming external connectivity on endpoint waardepapieren_mock-nlx_1 (cf6f076e9054ac0b10c13038fc3d1a63d6ba3cb7467f7b793f5e41e35bf725e8): Bind for 0.0.0.0:80 failed: port is already allocated

ERROR: for mock-nlx  Cannot start service mock-nlx: driver failed programming external connectivity on endpoint waardepapieren_mock-nlx_1 (cf6f076e9054ac0b10c13038fc3d1a63d6ba3cb7467f7b793f5e41e35bf725e8): Bind for 0.0.0.0:80 failed: port is already allocated
ERROR: Encountered errors while bringing up the project.

```
