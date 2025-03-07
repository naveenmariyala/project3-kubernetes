### The process contains
#### 1. Configure a Database
## Setting Up the Database
This project uses Kubernetes to set up the database. Run the following commands to deploy config, postgresql from pvc.yaml, file:

kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml
kubectl apply -f postgresql-deployment.yaml 

Run kubectl apply -f postgresql-service.yaml to create service then

Forward port to the database service with command 
kubectl port-forward service/postgresql-service 5433:5432 &

Populate the database in the kubernets with command 
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < <FILE_NAME.sql>

#### 2. Build app
Use dockerfile in folder analytics to create image.
Use buildspec.yaml file to configure the building process for code build.

#### 3. Deploy
Run kubectl apply -f corking.yaml to deploy service
Use coworking.yaml file to set image and load balancer
Run kubectl apply -f corking.yaml to deploy service

#### 4. Trouble shooting
kubectl describe svc postgresql-service
kubectl logs service_name to trouble shoot
