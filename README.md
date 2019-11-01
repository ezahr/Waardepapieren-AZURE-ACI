# Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst
Waardepapieren AZURE ACI met ICTU/Belastingdienst

Met Compose gebruikt u een eenvoudig tekstbestand om een toepassing te definiëren die uit meerdere Docker-containers bestaat. Vervolgens draait u uw toepassing op met een enkele opdracht die er alles aan doet om uw gedefinieerde omgeving te implementeren. 

# container brings itś own file system, on every type of system

![A-Z @at hendrik-jan ](https://github.com/boscp08/Workbook_Docker_fundamentals)

`type: Microsoft.ContainerInstance/containerGroups`

Bas kan hem ook prebuilt bijhouden in de docker hub zoals de mensen van irma dat doen dan wordt de deployment eenvoudiger.  
Misschien kan bas hem packagen op docker hub

![bevrijdenregelingen]https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/bevrijden-regelingen-master.zip)

![katacoda](https://www.katacoda.com/courses/kubernetes/playground)

# voorbeeld irma-api-server
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


# Running fqdn waardepapieren.westeurope.azurecontainer.io

##using docker-compose:

This is done as follows:

`git clone https://github.com/discipl/waardepapieren.git`
`cd waardepapieren`


1. Hack into docker-compose-travis.yml. Set the environment variable CERT_HOST_IP is with an IP (fqdn=`waardepapieren.westeurope.azurecontainer.io`) that the validator app can use to reach  the clerk-frontend container. Ensure that the validator app runs on the same (wifi) network as the clerk frontend. you can use an offline mock, which replicates the NLX environment.




Run `docker-compose -f docker-compose-travis.yml up`

This will start 3 container applications:

- clerk-frontend
- waardepapieren-service, with embedded ephemeral-server
- nlx-mock, which is an nlx-outway that provides access to a mock BRP service for BSN = `663678651`

The clerk frontend will be available at `https://waardepapieren.westeurope.azurecontainer.io`*:443*





***

|nr|image|
|---|---------------------------------------------|
|1|docker pull boscp08/waardepapieren_mock-nlx:1.0|  
|2|docker pull boscp08/waardepapieren_service:1.0|  
|3|docker pull boscp08/waardepapieren_clerk-frontend:1.0|
But... how to start a container.  Ask Pim Otte / Bas Kaptijn  :shipit:(
![meetup sjef1](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/meetup_sjef_van_leeuwen_20191031_1.jpg) ![meetup sjef1](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/meetup_sjef_van_leeuwen_20191031_2.jpg)
***
https://portal.azure.com/#home  bosch.peter@outlook.com

https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest

![portal](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/portal_azure_com.png)

```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Try the new cross-platform PowerShell https://aka.ms/pscore6

PS C:\Users\Gebruiker> az login
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
PS C:\Users\Gebruiker>

€164.99 credit remaining
Subscription 'Gratis versie' has a remaining credit of €164.99.
Click here to upgrade to a Pay-As-You-Go subscription.
a minute ago
```

Ps Azure:\> 
`az container create --resource-group MyResourceGroup --file deploy-aci.yml`

# deploy-portal_azure-com-mock-nlx.yml
```
location: westeurope
name: myResourceGroup
properties:
  containers:
  - name: waardepapieren-mock-nlx
    properties:
      image: boscp08/waardepapieren_mock-nlx:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 80
  osType: Linux
  ipAddress:
    type: Public
    dnsNameLabel: "waardepapieren-mock-nlx"
    ports:
    - protocol: tcp
      port: 80
tags: null
type: Microsoft.ContainerInstance/containerGroups
```

# deploy-portal_azure_com-waardepapieren-service.yml
```
location: westeurope
name: myResourceGroup
properties:
  containers:
  - name: waardepapieren-service
    properties:
      image: boscp08/waardepapieren_service:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 3232
  osType: Linux
  ipAddress:
    type: Public
    dnsNameLabel: "waardepapieren-clerk-service"
    ports:
    - protocol: tcp
      port: 3232
tags: null
type: Microsoft.ContainerInstance/containerGroups
```

# deploy-portal_azure_com-clerk-frontend.yml
```
location: westeurope
name: lab
properties:
  containers:
  - name: waardepapieren-clerk-frontend
    properties:
      image: boscp08/waardepapieren_clerk-frontend:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 443
  osType: Linux
  ipAddress:
    type: Public
    dnsNameLabel: "waardepapieren-clerk-frontend"
    ports:
    - protocol: tcp
      port: 443
tags: null
type: Microsoft.ContainerInstance/containerGroups
```


# deploy_service-portal_azure_com_the_whole_sjebang.yml

```
location: westeurope
name: myResourceGroup
properties:
  containers:
  - name: waardepapieren-mock-nlx
    properties:
      image: boscp08/waardepapieren_mock-nlx:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 80
  - name: waardepapieren-service
    properties:
      image: boscp08/waardepapieren_service:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 3232
  - name: waardepapieren-clerk-frontend
    properties:
      image: boscp08/waardepapieren_clerk-frontend:1.0
      resources:
        requests:
          cpu: 1
          memoryInGb: 0.5
      ports:
      - port: 443
  osType: Linux
  ipAddress:
    type: Public
    # fqdn wordt: waardepapieren.westeurope.azurecontainer.io
    dnsNameLabel: "waardepapieren" 
    ports:
    - protocol: tcp
    port: 443
tags: null
type: Microsoft.ContainerInstance/containerGroups
```
# challenge poorten debuggen met pim Otte


![kubernetes](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/kubernetes.PNG)

![k3](https://github.com/boscp08/Waardepapieren-AZURE-ACI-met-ICTU-Belastingdienst/blob/master/pictures/sem_k8s.PNG)
