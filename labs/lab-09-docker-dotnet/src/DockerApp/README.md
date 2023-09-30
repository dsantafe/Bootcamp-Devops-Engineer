# Ingress
```shell 
$ cd C:\workspace-bootcamp\repos\Bootcamp-Devops-Engineer\labs\lab-09-docker-dotnet\src\DockerApp\DockerApp
```

# Build docker image
```shell
$ docker build -t dockerapp:v0.0.1 .
$ docker images
```

# Docker run
```shell
docker run -d --name dockerapp \
-e "ASPNETCORE_ENVIRONMENT=Development" \
-p 8080:80 \
dockerapp:v0.0.1
```

# Login in Azure Container Registry and Push image
```shell
$ az acr login --name <acrName>
$ docker tag dockerapp:v0.0.1 <acrName>.azurecr.io/dockerapp:v0.0.1
$ docker push <acrName>.azurecr.io/dockerapp:v0.0.1
```

# Login in Azure and Create Azure Container Instance
```shell
$ az login --tenant <tenantId>
$ docker login azure --tenant-id <tenantId>
$ docker context create aci aci-ctx-local
$ docker context ls
$ docker context use aci-ctx-local
$ docker compose up
```
