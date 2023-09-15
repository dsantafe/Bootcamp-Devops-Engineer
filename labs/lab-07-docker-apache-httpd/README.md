# 1. Construir la imagen:
```shell
$ docker build -t apache-custom .
```

# 2. Ejecutar un contenedor a partir de la imagen:
```shell
$ docker run -d -p 8080:80 --name apache-docker apache-custom
```

# Verificar que el contenedor funciona correctamente:
http://localhost:8080