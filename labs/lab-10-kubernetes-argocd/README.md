# Despliegue de Aplicación en Kubernetes usando Minikube y Argo CD

Este repositorio contiene los archivos y comandos necesarios para desplegar una aplicación en un clúster de Kubernetes utilizando Minikube y Argo CD.


## Pasos para desplegar la aplicación

1. **Iniciar Minikube:**

   Asegúrate de que Minikube esté iniciado antes de aplicar las configuraciones. Si no está iniciado, inicia Minikube con el siguiente comando:
   ```shell
   $ minikube start
   $ minikube dashboard
   ```

1. **Instalar e iniciar Argo CD:**

   Instalación del Chart
   ```shell
   $ kubectl create ns argo-cd
   $ helm repo add argo https://argoproj.github.io/argo-helm
   $ helm install argocd argo/argo-cd -n argo-cd
   ```

   Para acceder a la interfaz de usuario del servidor, tiene las siguientes opciones y luego abra el navegador en http://localhost:8080 y acepte el certificado.
   ```shell
   $ kubectl port-forward service/argocd-server -n argo-cd 8080:443
   ```

   Después de acceder a la interfaz de usuario por primera vez, puede iniciar sesión con el nombre de usuario: admin y la contraseña aleatoria generada durante la instalación. Puede encontrar la contraseña ejecutando:
   ```shell
   $ kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
   ```

2. Aplicar el archivo de Deployment:
Aplica el archivo de Deployment para desplegar la aplicación en Kubernetes. Este archivo especifica cómo se deben ejecutar las réplicas de la aplicación.
    ```shell
    $ cd /argocd/deployments
    $ kubectl apply -f dockerapp-deployments.yaml -n argo-cd
    ```
    ![Instancias](./assets/dockerapp-service.png)

3. Aplicar el archivo de Service:
Aplica el archivo de Service para exponer la aplicación en un puerto específico en Minikube.
    ```shell
    $ cd /argocd/services
    $ kubectl apply -f dockerapp-services.yaml -n argo-cd
    ```
    ![Instancias](./assets/dockerapp-deployment.png)

4. Obtener la URL del servicio:
Obtén la URL para acceder a la aplicación a través de Minikube.
    ```shell
    $ kubectl port-forward service/dockerapp-service -n dockerapp-namespace 8081:8080
    ```

    Copia la URL generada y pégala en tu navegador web o utilízala para acceder a tu aplicación.

5. Acceso a la aplicación http://localhost:8081/swagger
    ```shell
    $ curl -X 'GET' \
    'http://localhost:8081/WeatherForecast' \
    -H 'accept: text/plain'

    [{"date":"2023-10-04T03:37:27.9362486+00:00","temperatureC":27,"temperatureF":80,"summary":"Sweltering"},{"date":"2023-10-05T03:37:27.9371344+00:00","temperatureC":4,"temperatureF":39,"summary":"Chilly"},{"date":"2023-10-06T03:37:27.9371437+00:00","temperatureC":20,"temperatureF":67,"summary":"Chilly"},{"date":"2023-10-07T03:37:27.9371439+00:00","temperatureC":42,"temperatureF":107,"summary":"Freezing"},{"date":"2023-10-08T03:37:27.937144+00:00","temperatureC":23,"temperatureF":73,"summary":"Freezing"}]
    ```
    ![Instancias](./assets/dockerapp-minikube.png)