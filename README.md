# Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst
Waardepapieren AZURE ACI met ICTU/Belastingdienst

Met Compose gebruikt u een eenvoudig tekstbestand om een toepassing te definiëren die uit meerdere Docker-containers bestaat. Vervolgens draait u uw toepassing op met een enkele opdracht die er alles aan doet om uw gedefinieerde omgeving te implementeren. 



`type: Microsoft.ContainerInstance/containerGroups`

![kubernetes](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/kubernetes.PNG)

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

## docker-compose ... close very close now

` sudo apt install docker-compose` 



