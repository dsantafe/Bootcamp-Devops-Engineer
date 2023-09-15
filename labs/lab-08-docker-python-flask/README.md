# 1. Construir la imagen:
```shell
$ docker build -t api-python-custom .
```

# 2. Ejecutar un contenedor a partir de la imagen:
```shell
$ docker run -d -p 8081:6000 --name api-python-docker api-python-custom
```

Ahora puedes acceder a tu API en http://localhost:8081 desde tu navegador o cualquier cliente REST.