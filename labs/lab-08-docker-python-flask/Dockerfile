# Utiliza la imagen oficial de Python 3.8 como base
FROM python:3.8

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de la aplicación al directorio de trabajo
COPY . /app

# Instala las dependencias de la aplicación
RUN pip install -r requirements.txt

# Expone el puerto en el que la aplicación Flask va a estar escuchando
EXPOSE 6000

# Define el comando para ejecutar la aplicación
CMD ["python", "app.py"]
