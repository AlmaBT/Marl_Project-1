# Marl_Project-1

Project Assignment: Deploying a Containerized Application on a Self-
Managed Kubernetes Cluster on EC2. (This project assumes you already 
have a functional k8s cluster on EC2).
Project Description:
The MARL – PROJECT-1 incorporates several DevOps tools to automate 
infrastructure provisioning, containerization, orchestration, and deployment. For 
infrastructure as code (IaC), Terraform is used to automate the provisioning of 
AWS EC2 instances, ensuring that Docker is installed upon launch. The EC2 
instances serve as the foundation for the self-managed Kubernetes cluster, where 
the containerized application will be deployed. Docker is utilized for 
containerization, allowing the application to be packaged with all dependencies, 
while DockerHub acts as the container registry where the image is stored and 
retrieved for deployment.
To manage and orchestrate containers, Kubernetes is used, with kubectl as the 
CLI tool to interact with the cluster. The deployment process involves defining a 
Kubernetes Deployment YAML file (deployment.yaml) to configure the 
application and a Kubernetes Service YAML file (service.yaml) to expose it 
externally using an AWS Load Balancer. Networking is handled through AWS 
Route 53, where a custom domain name is registered and mapped to the 
application via an A Record, enabling browser access.
Note: AWS Load Balancer expects traffic on port 80 (HTTP) or 443 (HTTPS) by default when
mapping to a domain name in Route 53. Route 53 does not handle ports—it simply resolves 
the domain to the LoadBalancer’s DNS.
For version control and collaboration, Git and GitHub are essential, allowing 
Terraform files, Kubernetes manifests, and application code to be stored, managed,
and shared efficiently. An optional Horizontal Pod Autoscaler (HPA) can also be 
implemented to enable dynamic scaling based on CPU utilization.
By leveraging these DevOps tools, the project streamlines infrastructure 
management, automates deployment, and ensures scalability, high availability, 
fault tolerance and security of the containerized application.
In this Project, you will:
Download an example application code from Free CSS | 3552 Free Website 
Templates, CSS Templates and Open Source Templates and extract the code 
into your working directory.
Create a Terraform configuration file that provisions an EC2 instance and 
ensures Docker is automatically installed upon launch. The configuration 
should also transfer your application code and Dockerfile from your local 
machine to the remote server during instance initialization.
SSH into the EC2 Instance
Create a Docker image and push it to your private repository on DockerHub.
Deploy the containerized application on a self-managed Kubernetes cluster 
running on EC2 instances.
Configure your deployment so that the application can be accessed from a 
browser using a custom domain name registered in Route 53.
Use a LoadBalancer service to expose your application externally.
Instructions:
Step 1: Create and Push a Docker Image to DockerHub
Set up a simple web application (e.g., an Nginx-based webpage or a simple 
Node.js app).
Create a Dockerfile for your application.
Build the Docker image using the command:
docker build -t your-dockerhub-username/your-image-name:version .
Login to DockerHub (if not already logged in):
docker login
Push the image to your private DockerHub repository:
docker push your-dockerhub-username/your-image-name:version
Step 2: Deploy the Application on Kubernetes
Create a Kubernetes Deployment YAML file (deployment.yaml) for your 
application.
Apply the Deployment.
kubectl apply -f deployment.yaml
Step 3: Expose the Application Using a LoadBalancer Service
Create a Service YAML file (service.yaml) to expose your deployment.
Apply the Service configuration.
Step 4: Configure Route 53 for Domain Name Resolution
Register a domain name in AWS Route 53 (or use an existing one).
Create an "A" Record in Route 53 pointing to the LoadBalancer's external IP 
obtained in the previous step.
Verify that your application is accessible via the domain name by visiting it 
in a browser.
Submission:
Provide the link to your application to your team mates to verify.
Finally:
Push your project to your Github Repository.
Bonus Challenge (Optional):
Implement Horizontal Pod Autoscaling to dynamically scale your application 
based on CPU usage.
