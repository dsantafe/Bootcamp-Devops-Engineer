# [Install Kong Gateway on Docker](https://docs.konghq.com/gateway/latest/install/docker/)
## Prepare the database

1. Create a custom Docker network to allow the containers to discover and communicate with each other:
```shell
docker network create kong-net
```
You can name this network anything you want. We use kong-net as an example throughout this guide.

2. Start a PostgreSQL container:
```shell
docker run -d --name kong-database \
  --network=kong-net \
  -p 5432:5432 \
  -e "POSTGRES_USER=kong" \
  -e "POSTGRES_DB=kong" \
  -e "POSTGRES_PASSWORD=kongpass" \
  postgres:13
```

3. Prepare the Kong database:
```shell
docker run --rm --network=kong-net \
 -e "KONG_DATABASE=postgres" \
 -e "KONG_PG_HOST=kong-database" \
 -e "KONG_PG_PASSWORD=kongpass" \
 -e "KONG_PASSWORD=test" \
kong/kong-gateway:3.3.1.0 kong migrations bootstrap
```

4. Run the following command to start a container with Kong Gateway:
```shell
docker run -d --name kong-gateway \
 --network=kong-net \
 -e "KONG_DATABASE=postgres" \
 -e "KONG_PG_HOST=kong-database" \
 -e "KONG_PG_USER=kong" \
 -e "KONG_PG_PASSWORD=kongpass" \
 -e "KONG_PROXY_ACCESS_LOG=logs/access.log" \
 -e "KONG_ADMIN_ACCESS_LOG=logs/access.log" \
 -e "KONG_PROXY_ERROR_LOG=logs/error.log" \
 -e "KONG_ADMIN_ERROR_LOG=logs/error.log" \
 -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
 -e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
 -p 8000:8000 \
 -p 8443:8443 \
 -p 8001:8001 \
 -p 8444:8444 \
 -p 8002:8002 \
 -p 8445:8445 \
 -p 8003:8003 \
 -p 8004:8004 \
 kong/kong-gateway:3.3.0.0
```

5. Verify your installation:
Access the /services endpoint using the Admin API:
```shell
curl -i -X GET --url http://localhost:8001/services
```
You should receive a 200 status code.

6. Verify that Kong Manager is running by accessing it using the URL specified in KONG_ADMIN_GUI_URL:
```shell
http://localhost:8002
```

7. Install a client to connect PostgreSQL container
```shell
docker run -d --name pgadmin4 \
  --network=kong-net \
  -p 8080:80 \
  -e 'PGADMIN_DEFAULT_EMAIL=admin@admin.com' \
  -e 'PGADMIN_DEFAULT_PASSWORD=Qwer1234!' \
  -d dpage/pgadmin4
```

------

# Build your own Docker images (Ubuntu)

1. Create a Dockerfile, Build your image:
```shell
docker build -t kong-gateway .
```

## Kong in Docker Compose
Kong Gateway can be deployed in different ways. This Docker Compose file provides support for running Kong

```shell
$ docker compose -p kong-gateway --env-file .env.dev up -d
```

Docker Application: 
![docker-application](./assets/docker-application.png)

Portal pgadmin: http://localhost:8080
![pgadmin](./assets/pgadmin.png)

Portal Kong Manager: http://localhost:8002
![kong-manager](./assets/kong-manager.png)

------

# Enable the Plugin
- [Plugins in Other Languages Javascript](https://docs.konghq.com/gateway/latest/plugin-development/pluginserver/javascript/)
- [Building a Kong Gateway Plugin with JavaScript](https://konghq.com/blog/kong-gateway-plugin-javascript)
```shell
git clone https://github.com/Kong/docker-kong-js-pdk
cd kong-js-pdk-dev
docker-compose build
```

## 1. Create a Service
```shell
curl -X POST \
--url "http://localhost:8001/services" \
--data "name=example-service" \
--data "url=https://api.gameofthronesquotes.xyz/v1/random"
```
As our file name was clacks.js, our plugin will be called clacks. Let’s enable the plugin in the definition now:

## 2. Create a Route
```shell
curl -X POST \
--url "http://localhost:8001/services/example-service/routes" \
--data "name=example-service" \
--data "paths[]=/"
```

## 3. Adding clacks Plugin
```shell
curl -X POST \
--url "http://localhost:8001/services/example-service/plugins/" \
--data "name=clacks"
```

The docker-compose.yml file forwards the API gateway port to our local machine. That means we can make requests to localhost:8000 to test our service.
```shell
curl -I localhost:8000
```

------

# [Basic Authentication](https://docs.konghq.com/hub/kong-inc/basic-auth/)

## 1. Create a Consumer
You need to associate a credential to an existing Consumer object. To create a Consumer, you can execute the following request:
```shell
curl -X POST \
--url "http://localhost:8001/consumers/" \
--data "username=admin"
```
![curl-create-consumer](./assets/curl-create-consumer.png)

## 2. Create a Credential
```shell
curl -X POST \
--url "http://localhost:8001/consumers/admin/basic-auth" \
--data "username=admin" \
--data "password=12345678"
```
![curl-create-credential-basic-auth](./assets/curl-create-credential-basic-auth.png)
![basic-auth-credentials](./assets/basic-auth-credentials.png)

## 3. Securing resources in Kong, Adding basic-auth plugin in Kong
### 3.1. Create a Service
```shell
curl -X POST \
--url "http://localhost:8001/services" \
--data "name=api-gameofthrones-random-v1" \
--data "url=https://api.gameofthronesquotes.xyz/v1/random"
```
![curl-create-service-basic-auth](./assets/curl-create-service-basic-auth.png)

### 3.2. Create a Route
```shell
curl -X POST \
--url "http://localhost:8001/services/api-gameofthrones-random-v1/routes" \
--data "name=api-gameofthrones-random-v1" \
--data "paths[]=/api/v1/random"
```
![curl-create-route-basic-auth](./assets/curl-create-route-basic-auth.png)

### 3.3. Adding basic-auth plugin
```shell
curl -X POST \
--url "http://localhost:8001/services/api-gameofthrones-random-v1/plugins" \
--data "name=basic-auth"  \
--data "config.hide_credentials=false"
```
![curl-add-plugin-basic-auth](./assets/curl-add-plugin-basic-auth.png)
![service-basic-auth](./assets/service-basic-auth.png)
![service-basic-auth-plugin](./assets/service-basic-auth-plugin.png)

### 3.4. Game Of Thrones Quotes API
- https://gameofthronesquotes.xyz/

```shell
curl -X GET \
--url "https://api.gameofthronesquotes.xyz/v1/random"
```
![api-service](./assets/api-service.png)

### 3.5. Consume Service
http://localhost:8000/api/v1/random (GET)
- Authorization: Basic
- Username: admin
- Password: 12345678

![api-service-basic-auth](./assets/api-service-basic-auth.png)

------

# [OAuth 2.0 Authentication](https://docs.konghq.com/hub/kong-inc/oauth2/)

A Consumer can have many credentials.
## 1. Create an Application
Then you can finally provision new OAuth 2.0 credentials (also called “OAuth applications”) by making the following HTTP request:
```shell
curl -X POST \
--url "http://localhost:8001/consumers/admin/oauth2/" \
--data "name=admin|oauth2" \
--data "client_id=admin" \
--data "client_secret=12345678" \
--data "hash_secret=true"
```
![curl-create-credential-oauth](./assets/curl-create-credential-oauth.png)
![oauth-credentials](./assets/oauth-credentials.png)

# OAuth 2.0 Flows
## 1. Create a Service
Define a service object in kong and use your api server as upstream.
```shell
curl -X POST \
--url "http://localhost:8001/services" \
--data "name=oauth2" \
--data "url=https://docs.konghq.com/"
```
![curl-create-service-oauth-token](./assets/curl-create-service-oauth-token.png)

## 2. Create a Route
Next we will create a path /oauth2/token to access our service.
```shell
curl -X POST \
--url "http://localhost:8001/services/oauth2/routes" \
--data "name=oauth2" \
--data "paths[]=/oauth2/token"
```
![curl-create-route-oauth-token](./assets/curl-create-route-oauth-token.png)

## 3. Enable Oauth2 Plugin
This plugin will be enabled on the service and I am also using my own provision_key . If you don’t define this parameter, kong will generate one for you. I am also enabling all 4 grants for the demonstration purposes. You should only enable the grant that you will use.
```shell
curl -X POST \
--url "http://localhost:8001/services/oauth2/plugins/" \
--data "name=oauth2" \
--data "config.scopes[]=all" \
--data "config.mandatory_scope=true" \
--data "config.provision_key=bBEouj1MfVo5kvpPWDxGPTafXE6cL9O6" \
--data "config.enable_client_credentials=true" \
--data "config.global_credentials=true"
```
![curl-add-plugin-oauth-token](./assets/curl-add-plugin-oauth-token.png)
![service-oauth-token](./assets/service-oauth-token.png)
![service-oauth-token-plugin](./assets/service-oauth-token-plugin.png)

##  4. Securing resources in Kong, Adding oauth2 plugin in Kong
### 4.1. Create a Service
```shell
curl -X POST \
--url "http://localhost:8001/services" \
--data "name=api-gameofthrones-random-v2" \
--data "url=https://api.gameofthronesquotes.xyz/v1/random"
```
![curl-create-service-oauth](./assets/curl-create-service-oauth.png)

### 4.2. Create a Route
```shell
curl -X POST \
--url "http://localhost:8001/services/api-gameofthrones-random-v2/routes" \
--data "name=api-gameofthrones-random-v2" \
--data "paths[]=/api/v2/random"
```
![curl-create-route-oauth](./assets/curl-create-route-oauth.png)

### 4.3. Adding oauth2 plugin
```shell
curl -X POST \
--url "http://localhost:8001/services/api-gameofthrones-random-v2/plugins/" \
--data "name=oauth2" \
--data "config.scopes[]=all" \
--data "config.mandatory_scope=true" \
--data "config.provision_key=bBEouj1MfVo5kvpPWDxGPTafXE6cL9O6" \
--data "config.enable_client_credentials=true" \
--data "config.global_credentials=true"
```
![curl-add-plugin-oauth](./assets/curl-add-plugin-oauth.png)
![service-oauth](./assets/service-oauth.png)
![service-oauth-plugin](./assets/service-oauth-plugin.png)

### 4.4. Consume Service
Endpoint: https://localhost:8443/oauth2/token (POST)
```json
Request: 
{
    "grant_type": "client_credentials",
    "client_id": "admin",
    "client_secret": "12345678",
    "scope": "all"
}
Response:
{
  "token_type": "bearer",
  "access_token": "pAa0MfJWsWzHL9bLC2vbu4hXXqz9FIN2",
  "expires_in": 7200
}
```
![api-service-oauth-token](./assets/api-service-oauth-token.png)

Endpoint: http://localhost:8000/api/v2/random (GET)
- Authorization: Bearer pAa0MfJWsWzHL9bLC2vbu4hXXqz9FIN2

![api-service-oauth](./assets/api-service-oauth.png)