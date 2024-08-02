# wp-eks-rds-example

1.create aws s3 bucket for terraform backend to store statefile. 
'''
aws s3api create-bucket --bucket {your-terraform-state-bucket} --region {your-region}
'''
2. intilize terraform, check plan and apply this can take some time while the eks cluster and rds resources are created and deployed. 
'''terraform init'''
'''terraform plan'''
'''terraform apply'''

3. get coffee. 

4. configure kube config file now that it has been deployed.  
'''aws eks update-kubeconfig --name {cluster-name} --region {your-region}'''

5. check rds endpoint in the AWS concole and create k8s db-secret
	'''kubectl create secret generic db-secret --from-literal=DB_HOST={yourdbendpoint}.rds.amazonaws.com --from-literal=DB_NAME={db-name} --from-literal=DB_USER={admin} --from-literal=DB_PASSWORD={rdspassword}'''

7. apply wp services and deployment 
	'''kubectl apply -f wordpress-svc.yaml'''
	'''kubectl apply -f wordpress-deployment'''
