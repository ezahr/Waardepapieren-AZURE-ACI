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

## ubuntu 18.0
Ubuntu OS supports docker as wel as azure-cli (and gitHub ofcourse)

## using docker-compose to --build the images

This is done as follows:


1 `git clone https://github.com/discipl/waardepapieren.git`
`cd waardepapieren`


2. Hack into docker-compose-travis.yml. 

Set the environment variable CERT_HOST_IP is with an IP (fqdn=`waardepapieren.westeurope.azurecontainer.io`) that the validator app can use to reach  the clerk-frontend container. ( Ensure that the validator app runs on the same (wifi) network as the clerk frontend. you can use an offline mock, which replicates the NLX environment. )

```
version: '3'
services:
  waardepapieren-service:
    volumes:
      - ./waardepapieren-service/system-test/certs:/certs:ro
      - ./waardepapieren-service/system-test/ephemeral-certs:/ephemeral-certs:ro
      - ./waardepapieren-service/configuration/:/app/configuration:ro
    build: waardepapieren-service/.
    links:
      - mock-nlx
    ports:
      - 3232:3232
      - 3233:3233
    environment:
      - WAARDEPAPIEREN_CONFIG=/app/configuration/waardepapieren-config-compose-travis.json
      # Ignore self-signed ephemeral cert issues
      - NODE_TLS_REJECT_UNAUTHORIZED=0
  clerk-frontend:
    build:
      context: clerk-frontend/
      args:
        - CERTIFICATE_HOST=http://waardepapieren.westeurope.azurecontainer.io:8880
    links:
      - waardepapieren-service
    ports:
      - 443:443
      - 8880:8880
    healthcheck:
      test: service nginx status
    volumes:
      - ./clerk-frontend/nginx/certs:/etc/nginx/certs:ro
  mock-nlx:
    build: mock-nlx/
    ports:
      - 80:80
```

2. cd clerk-frontend
hack into Dockerfile
```
FROM node:10
RUN mkdir /app
ADD package.json package-lock.json /app/
ENV REACT_APP_EPHEMERAL_ENDPOINT=https://waardepapieren.westeurope.azurecontainer.io:443/api/eph
ENV REACT_APP_EPHEMERAL_WEBSOCKET_ENDPOINT=wss://waardepapieren.westeurope.azurecontainer.io:443/api/eph-ws
WORKDIR /app
RUN npm install --unsafe-perm
ADD public /app/public
ADD src /app/src
ARG CERTIFICATE_HOST
ENV REACT_APP_CERTIFICATE_HOST=${CERTIFICATE_HOST}
RUN npm run build

FROM nginx:1.15.8
ADD nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/build /usr/share/nginx/html

```


3 Run `docker-compose -f docker-compose-travis.yml up`

This will start 3 container applications:

- clerk-frontend
- waardepapieren-service, with embedded ephemeral-server
- nlx-mock, which is an nlx-outway that provides access to a mock BRP service for BSN = `663678651`

The clerk frontend will (eventually) be available at `https://waardepapieren.westeurope.azurecontainer.io`*:443*
with a green Padlock and SSL Certificate? 


## pushing images to hub.docker.com

![containerization](https://github.com/boscp08/waardepapieren/wiki/containerization)

# DOCKER WAARDEPAPIEREN START docker-compose-travis.yml

![Proces](https://github.com/boscp08/waardepapieren/blob/master/pictures/3545A488-D550-4DDB-A9BF-A071FE182E8A.jpeg)
yet another markup language **docker-compose-Travis.yml**
```
version: '3'
services:
  waardepapieren-service:
    volumes:
      - ./waardepapieren-service/system-test/certs:/certs:ro
      - ./waardepapieren-service/system-test/ephemeral-certs:/ephemeral-certs:ro
      - ./waardepapieren-service/configuration/:/app/configuration:ro
    build: waardepapieren-service/.
    links:
      - mock-nlx
    ports:
      - 3232:3232
      - 3233:3233
    environment:
      - WAARDEPAPIEREN_CONFIG=/app/configuration/waardepapieren-config-compose-travis.json
      # Ignore self-signed ephemeral cert issues
      - NODE_TLS_REJECT_UNAUTHORIZED=0
  clerk-frontend:
    build:
      context: clerk-frontend/
      args:
        - CERTIFICATE_HOST=http://$CERT_HOST_IP:8880
    links:
      - waardepapieren-service
    ports:
      - 443:443
      - 8880:8880
    healthcheck:
      test: service nginx status
    volumes:
      - ./clerk-frontend/nginx/certs:/etc/nginx/certs:ro
  mock-nlx:
    build: mock-nlx/
    ports:
      - 80:80
```

PS C:\Projects\scratch\virtual-insanity\waardepapieren> `docker-compose -f docker-compose-travis.yml up`


push https: hub.docker.com
```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Try the new cross-platform PowerShell https://aka.ms/pscore6

PS C:\Users\bosch> cd  C:\Projects\scratch\virtual-insanity\waardepapieren\
PS C:\Projects\scratch\virtual-insanity\waardepapieren> `docker-compose -f docker-compose-travis.yml up`
                                                             

Attaching to waardepapieren_mock-nlx_1, waardepapieren_waardepapieren-service_1, waardepapieren_clerk-frontend_1
mock-nlx_1                |
mock-nlx_1                | > mock-nlx@0.1.0 start /app
mock-nlx_1                | > node index.js
mock-nlx_1                |
waardepapieren-service_1  |
waardepapieren-service_1  | > waardenpapieren-service@0.2.0 start /app
waardepapieren-service_1  | > node --require @babel/register src/index.js
waardepapieren-service_1  |
waardepapieren-service_1  | Booting with configuration:  { EPHEMERAL_ENDPOINT: 'https://localhost:3232',
waardepapieren-service_1  |   EPHEMERAL_WEBSOCKET_ENDPOINT: 'wss://localhost:3232',
waardepapieren-service_1  |   EPHEMERAL_CERT: '/ephemeral-certs/org.crt',
waardepapieren-service_1  |   EPHEMERAL_KEY: '/ephemeral-certs/org.key',
waardepapieren-service_1  |   NLX_OUTWAY_ENDPOINT: 'http://mock-nlx:80',
waardepapieren-service_1  |   NLX_CERT: '/certs/org.crt',
waardepapieren-service_1  |   NLX_KEY: '/certs/org.key',
waardepapieren-service_1  |   LOG_LEVEL: 'info',
waardepapieren-service_1  |   EPHEMERAL_RETENTION_TIME: 86400,
waardepapieren-service_1  |   PRODUCT_NEED: 'BRP_UITTREKSEL_NEED',
waardepapieren-service_1  |   SOURCE_NLX_PATH: '/brp/basisregistratie/natuurlijke_personen/bsn/{BSN}',
waardepapieren-service_1  |   SOURCE_ARGUMENT: 'BSN',
waardepapieren-service_1  |   PRODUCT_ACCEPT: 'BRP_UITTREKSEL_ACCEPT',
waardepapieren-service_1  |   PRODUCT_NAME:
waardepapieren-service_1  |    'Gewaarmerkt digitaal afschrift van gegevens uit de basisregistratie personen (BRP)',
waardepapieren-service_1  |   PRODUCT_DESCRIPTION: 'Uittreksel Basis Registratie Persoonsgegevens',
waardepapieren-service_1  |   PRODUCT_PURPOSE: 'Bewijs verblijfadres in woonplaats',
waardepapieren-service_1  |   SOURCE_DATA_SELECTION:
waardepapieren-service_1  |    [ { 'Burgerservicenummer (BSN)': 'burgerservicenummer' },
waardepapieren-service_1  |      { 'Woonplaats verblijfadres': 'verblijfadres.woonplaats' } ] }
waardepapieren-service_1  | { EPHEMERAL_ENDPOINT: 'https://localhost:3232',
waardepapieren-service_1  |   EPHEMERAL_WEBSOCKET_ENDPOINT: 'wss://localhost:3232',
waardepapieren-service_1  |   EPHEMERAL_CERT: '/ephemeral-certs/org.crt',
waardepapieren-service_1  |   EPHEMERAL_KEY: '/ephemeral-certs/org.key',
waardepapieren-service_1  |   NLX_OUTWAY_ENDPOINT: 'http://mock-nlx:80',
waardepapieren-service_1  |   NLX_CERT: '/certs/org.crt',
waardepapieren-service_1  |   NLX_KEY: '/certs/org.key',
waardepapieren-service_1  |   LOG_LEVEL: 'info',
waardepapieren-service_1  |   EPHEMERAL_RETENTION_TIME: 86400,
waardepapieren-service_1  |   PRODUCT_NEED: 'BRP_UITTREKSEL_NEED',
waardepapieren-service_1  |   SOURCE_NLX_PATH: '/brp/basisregistratie/natuurlijke_personen/bsn/{BSN}',
waardepapieren-service_1  |   SOURCE_ARGUMENT: 'BSN',
waardepapieren-service_1  |   PRODUCT_ACCEPT: 'BRP_UITTREKSEL_ACCEPT',
waardepapieren-service_1  |   PRODUCT_NAME:
waardepapieren-service_1  |    'Gewaarmerkt digitaal afschrift van gegevens uit de basisregistratie personen (BRP)',
waardepapieren-service_1  |   PRODUCT_DESCRIPTION: 'Uittreksel Basis Registratie Persoonsgegevens',
waardepapieren-service_1  |   PRODUCT_PURPOSE: 'Bewijs verblijfadres in woonplaats',
waardepapieren-service_1  |   SOURCE_DATA_SELECTION:
waardepapieren-service_1  |    [ { 'Burgerservicenummer (BSN)': 'burgerservicenummer' },
waardepapieren-service_1  |      { 'Woonplaats verblijfadres': 'verblijfadres.woonplaats' } ] }
waardepapieren-service_1  | Secure ephemeral server listening on 3232!
waardepapieren-service_1  | NLX_CERT -----BEGIN CERTIFICATE-----
waardepapieren-service_1  | MIIEWzCCAkMCFEtek3GjA7gyg+naWD/darqG95RcMA0GCSqGSIb3DQEBCwUAMHMx
waardepapieren-service_1  | CzAJBgNVBAYTAk5MMRUwEwYDVQQIDAxadWlkLUhvbGxhbmQxETAPBgNVBAcMCERl
waardepapieren-service_1  | biBIYWFnMQ0wCwYDVQQKDARJQ1RVMRAwDgYDVQQLDAdEaXNjaXBsMRkwFwYDVQQD
waardepapieren-service_1  | DBBkZW1vLmRpc2NpcGwub3JnMB4XDTE5MDkwMjA3MTIzN1oXDTIxMTExMDA3MTIz
waardepapieren-service_1  | N1owYTELMAkGA1UEBhMCTkwxFTATBgNVBAgMDFp1aWQtSG9sbGFuZDERMA8GA1UE
waardepapieren-service_1  | BwwIRGVuLUhhYWcxGTAXBgNVBAoMEEdlbWVlbnRlIEhhYXJsZW0xDTALBgNVBAsM
waardepapieren-service_1  | BElDVFUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDUCPdXIpXwtIuc
waardepapieren-service_1  | uZrAuLw4UEg6rOpbsWQ+s2aCNEZy058kGvEI6b8zOUMnk8tWPAkwt+0fqxFHbX1M
waardepapieren-service_1  | 8RUY021wndgwFNW45oXszzi7dxBphxeavDMOla8l3wbCGoHfayjUTKxkMMSa3ZXI
waardepapieren-service_1  | mFWlmDM+tVY9/4gtrX7cwnX+2c/ScmxcOpl+x9iWwt8aYtkmFb38Q9/EYebQ0xTk
waardepapieren-service_1  | xMHDNt4/C9BYdimoK1Z+G0HcMOJ1Vk4bYYDFN+zR8tqX3xBP1YJKLPF98pQjZHkB
waardepapieren-service_1  | djvKmJ3wpMP1q5WqxQlSnmT87KoK2aUq/azOOsB/jKx8Jn/xQVy0YegRGVdMxJDd
waardepapieren-service_1  | xQ43R2ffAgMBAAEwDQYJKoZIhvcNAQELBQADggIBAIF1KGgKaKnSjETGnxR+LQ1c
waardepapieren-service_1  | aHzdg/SzNpqcDgG/lgT6lIogBZu0DwLdkY6PzUy5zonDwok5q4i0f77y/mNUyoXH
waardepapieren-service_1  | kjO+MdBs25F6GNG7vPWmZ9VRblaYdjlVhxs4UHdEPMEZ/bATaS4s2NW+osgrVfAp
waardepapieren-service_1  | NXz2WnlWJW8CPyCqZemEOwwmAdYHTKLY0sG8PocUBRbo7ttrROgoXMmpz90cxkMi
waardepapieren-service_1  | UOUbbop2XLalArk5/y6/2i8PQKeD14BjuYMgcX2Uq3NQeKcpJR+sRXhAfquJbql2
waardepapieren-service_1  | l9IyQZ5H1YZ022wiaTgNIEGfBbIF03h0+EffYwncv1EiXjsIAONdcwQJ5rIifSyR
waardepapieren-service_1  | nzTwtZ0tWas8UeYE2j/aSERPmhpQWFqgOBYaDRmrmI4NYBcnOvm6oGmlz7/RDlCv
waardepapieren-service_1  | q7Yl3GAaREb0c+ZURxXlNv+v3oIFd5fnwbkkTeU6Ebe80B4F07xRPKWMx3hA+cg/
waardepapieren-service_1  | 8u2v7e/cZDxy7ZNfGLBFy5k8yNgEZ/IdCm9dpIMsYVaX+DDymNylhPplwWZkFP4a
waardepapieren-service_1  | ZYnexHm0rw3WIO2O4PhafyY4rX/t6vNKxITuj7Oq52Z+GXKD0HNV5g6sazXqa/Jb
waardepapieren-service_1  | OsjI2PtpTrCjMsmwtdAMUBTRPUFyj8FLc84OwE/bHgir7nAdaKoC0jgLevIL8EN8
waardepapieren-service_1  | 3smSKf4k50Cx/xNz2PHf
waardepapieren-service_1  | -----END CERTIFICATE-----
waardepapieren-service_1  |
```
**waardepapieren-service_1  | Serving needs**

Starting waardepapieren_mock-nlx_1 ... done                                                                             Starting waardepapieren_waardepapieren-service_1 ... done                                                               Starting waardepapieren_clerk-frontend_1         ... done  

# DOCKER WAARDEPAPIEREN STOP
```
Gracefully stopping... (press `Ctrl+C` again to force)
Stopping waardepapieren_clerk-frontend_1         ... done
Stopping waardepapieren_waardepapieren-service_1 ... done
Stopping waardepapieren_mock-nlx_1               ... done
```

# CONTAINERS

`docker container ls `

|CONTAINER ID | IMAGE |  COMMAND |  CREATED |STATUS|PORTS | NAMES|
|----------- | --------------------------------- |------------------|----------- |-----------|--------------|------------------|
|c0a8e0d21ad7|waardepapieren_clerk-frontend|  "nginx -g 'daemon ofÔÇª" | 5 hours ago| Up 5 hours (healthy) |  0.0.0.0:443->443/tcp, 80/tcp, 0.0.0.0:8880->8880/tcp |  waardepapieren_clerk-frontend_1|
|be9c0845ef51|waardepapieren_waardepapieren-service | "docker-entrypoint.sÔÇª" | 5 hours ago | Up 5 hours | 0.0.0.0:3232-3233->3232-3233/tcp|  waardepapieren_waardepapieren-service_1|
|21c2c3348def|waardepapieren_mock-nlx | "docker-entrypoint.sÔÇª"| 5 hours ago | Up 5 hours| 0.0.0.0:80->80/tcp| waardepapieren_mock-nlx_1|

# IMAGES

PS C:\Projects\scratch\virtual-insanity\waardepapieren> `docker image ls`

|seq START|seq STOP|REPOSITORY |TAG|IMAGE ID|CREATED|SIZE|
|---|---|------------------|----------|--------|-------------|--------|
|1|3|waardepapieren_mock-nlx | latest| cb4103b9bb91|4 weeks ago| 906MB|
|2|2|waardepapieren_waardepapieren-service| latest| c40bed724d95 |8 hours ago| 972MB|
|3|1|waardepapieren_clerk-frontend| latest| e9621b0230aa |3 days ago| 117MB|


**Microsoft Windows [Version 10.0.18362.418]**
(c) 2019 Microsoft Corporation. Alle rechten voorbehouden.

C:\Users\Gebruiker>`docker container ps`

```
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS
         PORTS                                                  NAMES
c0a8e0d21ad7        waardepapieren_clerk-frontend           "nginx -g 'daemon of"   18 hours ago        Up 18 hours (hea
lthy)   0.0.0.0:443->443/tcp, 80/tcp, 0.0.0.0:8880->8880/tcp   waardepapieren_clerk-frontend_1
be9c0845ef51        waardepapieren_waardepapieren-service   "docker-entrypoint.s"   18 hours ago        Up 18 hours
        0.0.0.0:3232-3233->3232-3233/tcp                       waardepapieren_waardepapieren-service_1
21c2c3348def        waardepapieren_mock-nlx                 "docker-entrypoint.s"   18 hours ago        Up 18 hours
        0.0.0.0:80->80/tcp                                     waardepapieren_mock-nlx_1
```

C:\Users\Gebruiker>`docker image ls`
```
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
waardepapieren_waardepapieren-service   latest              c40bed724d95        21 hours ago        972MB
waardepapieren_clerk-frontend           latest              e9621b0230aa        3 days ago          117MB
waardepapieren_mock-nlx                 latest              cb4103b9bb91        4 weeks ago         906MB
```

C:\Users\Gebruiker>`docker container ls`

```
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS
         PORTS                                                  NAMES
c0a8e0d21ad7        waardepapieren_clerk-frontend           "nginx -g 'daemon of"   18 hours ago        Up 18 hours (hea
lthy)   0.0.0.0:443->443/tcp, 80/tcp, 0.0.0.0:8880->8880/tcp   waardepapieren_clerk-frontend_1
be9c0845ef51        waardepapieren_waardepapieren-service   "docker-entrypoint.s"   18 hours ago        Up 18 hours
        0.0.0.0:3232-3233->3232-3233/tcp                       waardepapieren_waardepapieren-service_1
21c2c3348def        waardepapieren_mock-nlx                 "docker-entrypoint.s"   18 hours ago        Up 18 hours
        0.0.0.0:80->80/tcp                                     waardepapieren_mock-nlx_1
cddf221cc6aa        prakhar1989/static-site                 "./wrapper.sh"           2 days ago          Up 2 days
         80/tcp, 443/tcp                                        clever_kilby
8c41be0f6cb8        prakhar1989/static-site                 "./wrapper.sh"           2 days ago          Up 2 days
         443/tcp, 0.0.0.0:8888->80/tcp                         affectionate_pasteur
```

C:\Users\Gebruiker>`docker login -u boscp08`
Password:
**Login Succeeded**


C:\Users\Gebruiker>`docker commit  c0a8e0d21ad7 boscp08/waardepapieren_clerk-frontend:1.0`
**sha256:7461405ebd9bd4cbf78d6e294c9c322000e3b33ee0e9c734debfb147806d052c**

C:\Users\Gebruiker>`docker images`
```
REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
boscp08/waardepapieren_clerk-frontend   1.0                 7461405ebd9b        20 seconds ago      117MB
waardepapieren_waardepapieren-service   latest              c40bed724d95        21 hours ago        972MB
waardepapieren_clerk-frontend           latest              e9621b0230aa        3 days ago          117MB
waardepapieren_mock-nlx                 latest              cb4103b9bb91        4 weeks ago         906MB
```

# REPOSITORIES
![Push image](https://github.com/boscp08/waardepapieren/blob/master/pictures/F7CBCC59-787A-40C7-9C97-07D580C3D7F6.jpeg)

C:\Users\Gebruiker>`docker push boscp08/waardepapieren_clerk-frontend:1.0`

```
The push refers to repository [docker.io/boscp08/waardepapieren_clerk-frontend]
d97fb9ba1c1b: Pushed
d622900c9ad6: Pushed
f29f4d404c87: Pushed
6b5e2ed60418: Mounted from library/nginx
92c15149e23b: Mounted from library/nginx
0a07e81f5da3: Mounted from library/nginx
1.0: digest: sha256:dd6d66f360bd497d51f912939240be94ac740121eafdf57fee31401819fabdf8 size: 1573
```

C:\Users\Gebruiker>`docker commit be9c0845ef51 boscp08/waardepapieren_service:1.0`
**sha256:43bc03756b254c6ab32eeebd1d3d073c765b91ea5d4b92ebfb5562f2957fe4a2**

C:\Users\Gebruiker>`docker commit 21c2c3348def boscp08/waardepapieren_mock-nlx:1.0`
**sha256:e2718a431de192203d795c094978d8b6f94c07bb38c2477610d0f76137cd2e71**

C:\Users\Gebruiker>`docker images`

|REPOSITORY |TAG|IMAGE ID|CREATED|SIZE|
|-------|-----|-----------|-------|-------|
|boscp08/waardepapieren_mock-nlx|1.0| f0304ed8a8fa|4 seconds ago|906MB|
|boscp08/waardepapieren_service|1.0 |43bc03756b25|About a minute ago|972MB
|boscp08/waardepapieren_clerk-frontend|1.0 |7461405ebd9b|10 minutes ago|117MB|
|waardepapieren_waardepapieren-service|latest|c40bed724d95|21 hours ago|972MB|
|waardepapieren_clerk-frontend|latest|e9621b0230aa|3 days ago|117MB|
|waardepapieren_mock-nlx |latest|cb4103b9bb91| 4 weeks ago|906MB|

C:\Users\Gebruiker>`docker push boscp08/waardepapieren_service:1.0`

```
The push refers to repository [docker.io/boscp08/waardepapieren_service]
d0c936f934a7: Pushed
5ba600311444: Pushed
dcf7d81f33f6: Pushed
777723cd1ad1: Pushed
787df003f9a4: Pushed
cacd464c5340: Pushed
e8fb1bc83a7b: Mounted from library/node
77e12dcdfd3f: Mounted from library/node
92c70f59b8b4: Mounted from library/node
72be3b1da83c: Mounted from library/node
409170aec809: Mounted from library/node
2e669e0134f5: Mounted from library/node
8bacec4e3446: Mounted from library/node
26b1991f37bd: Mounted from library/node
55e6b89812f3: Mounted from library/node
1.0: digest: sha256:58050da6f9867c77fad30cdfd0ce80d900305383a7696b6505eff8ac520a5101 size: 3467

```
C:\Users\Gebruiker>`docker push boscp08/waardepapieren_mock-nlx:1.0`
```
The push refers to repository [docker.io/boscp08/waardepapieren_mock-nlx]
ca66a1823219: Pushed
5e8d679ed446: Pushed
338cb3eb280f: Pushed
cacd464c5340: Mounted from boscp08/waardepapieren_service
e8fb1bc83a7b: Mounted from boscp08/waardepapieren_service
77e12dcdfd3f: Mounted from boscp08/waardepapieren_service
92c70f59b8b4: Mounted from boscp08/waardepapieren_service
72be3b1da83c: Mounted from boscp08/waardepapieren_service
409170aec809: Mounted from boscp08/waardepapieren_service
2e669e0134f5: Mounted from boscp08/waardepapieren_service
8bacec4e3446: Mounted from boscp08/waardepapieren_service
26b1991f37bd: Mounted from boscp08/waardepapieren_service
55e6b89812f3: Mounted from boscp08/waardepapieren_service
1.0: digest: sha256:be53fe3ca27323318071e71996eb173bd2935ca68b0bda2e4a4656248301fd70 size: 3047
```
![docker push](https://github.com/boscp08/waardepapieren/blob/master/pictures/Screenshot%20from%202019-10-25%2008-59-34.png)

# PULL

`docker pull boscp08/waardepapieren_mock-nlx:1.0`

```
macos-catalina:~ boscp08$ docker pull boscp08/waardepapieren_mock-nlx:1.0
1.0: Pulling from boscp08/waardepapieren_mock-nlx
092586df9206: Pull complete 
ef599477fae0: Pull complete 
4530c6472b5d: Pull complete 
d34d61487075: Pull complete 
87fc2710b63f: Pull complete 
e83c771c5387: Pull complete 
7e2d41c53938: Pull complete 
a51441770e67: Pull complete 
e9542e67f971: Pull complete 
c1fff4d4d2d3: Pull complete 
baf38db91f43: Pull complete 
00d94fe88392: Pull complete 
8aafb3badb84: Pull complete 
Digest: sha256:be53fe3ca27323318071e71996eb173bd2935ca68b0bda2e4a4656248301fd70
Status: Downloaded newer image for boscp08/waardepapieren_mock-nlx:1.0
docker.io/boscp08/waardepapieren_mock-nlx:1.0
```
***

`docker pull boscp08/waardepapieren_service:1.0`

```
macos-catalina:~ boscp08$ docker pull boscp08/waardepapieren_service:1.0
1.0: Pulling from boscp08/waardepapieren_service
092586df9206: Already exists 
ef599477fae0: Already exists 
4530c6472b5d: Already exists 
d34d61487075: Already exists 
87fc2710b63f: Already exists 
e83c771c5387: Already exists 
7e2d41c53938: Already exists 
a51441770e67: Already exists 
e9542e67f971: Already exists 
c1fff4d4d2d3: Already exists 
084bc13ae107: Pull complete 
f4f8ee1088fc: Pull complete 
5ec536cab498: Pull complete 
f0b80e4123a3: Pull complete 
27d6e8939383: Pull complete 
Digest: sha256:58050da6f9867c77fad30cdfd0ce80d900305383a7696b6505eff8ac520a5101
Status: Downloaded newer image for boscp08/waardepapieren_service:1.0
docker.io/boscp08/waardepapieren_service:1.0
macos-catalina:~ boscp08$ docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED             SIZE
boscp08/waardepapieren_mock-nlx   1.0                 e2718a431de1        25 hours ago        906MB
boscp08/waardepapieren_service    1.0                 43bc03756b25        26 hours ago        972MB
```
***
`docker pull boscp08/waardepapieren_clerk-frontend:1.0`
```
macos-catalina:~ boscp08$ docker pull boscp08/waardepapieren_clerk-frontend:1.0
1.0: Pulling from boscp08/waardepapieren_clerk-frontend
6ae821421a7d: Pull complete 
da4474e5966c: Pull complete 
eb2aec2b9c9f: Pull complete 
91cdfff61958: Pull complete 
5ccde6b0eb16: Pull complete 
fb12ef1ac984: Pull complete 
Digest: sha256:dd6d66f360bd497d51f912939240be94ac740121eafdf57fee31401819fabdf8
Status: Downloaded newer image for boscp08/waardepapieren_clerk-frontend:1.0
docker.io/boscp08/waardepapieren_clerk-frontend:1.0

```

macos-catalina:~ boscp08$ `docker images`


REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
boscp08/waardepapieren_mock-nlx         1.0                 e2718a431de1        26 hours ago        906MB
boscp08/waardepapieren_service          1.0                 43bc03756b25        26 hours ago        972MB
boscp08/waardepapieren_clerk-frontend   1.0                 7461405ebd9b        26 hours ago        117MB



**

Build and Ship any Application Anywhere Docker Hub is the world's easiest way to create, manage, and deliver your teams' container applications.



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
