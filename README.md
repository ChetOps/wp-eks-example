# wp-eks-rds-example

1. Create aws s3 bucket for terraform backend to store statefile. 
```
aws s3api create-bucket --bucket _{your-terraform-state-bucket}_ --region _{your-region}_
```
2. Intilize terraform, check plan and apply this can take some time while the eks cluster and rds resources are created and deployed. 
```
terraform init
```
```
terraform plan
```
```
terraform apply
```

3. Get coffee. 

4. Configure kube config file now that it has been deployed.  
```
aws eks update-kubeconfig --name _{cluster-name}_ --region _{your-region}_
```

5. Check rds endpoint in the AWS concole and create k8s db-secret
```
kubectl create secret generic db-secret --from-literal=DB_HOST=_{yourdbendpoint}_.rds.amazonaws.com --from-literal=DB_NAME=_{db-name}_ --from-literal=DB_USER=_{admin}_ --from-literal=DB_PASSWORD=_{rdspassword}_
```

6. Apply wp services and deployment 
```
kubectl apply -f wordpress-svc.yaml
```
```
kubectl apply -f wordpress-deployment
```
