#Prerequisites

Before you start:

- Docker (for building the image)  
- Kubernetes cluster (e.g. kind, Minikube, or a real cluster) + `kubectl` configured  
- CI CD GitHub Actions  workflow

---

#Deployed  Wisecow Application Using Docker Container

#Clone repo
git clone https://github.com/sairamsolake/wisecow.git
cd wisecow

1.docker build -t wisecow:latest .
2.docker tag docker tag wisecow sairam2107/wisecow
3.docker push sairam2107/wisecow

#You Can Expose Application On Port 4499
http://Public Ip:4499

#Kubernetes Deployment:
#Apply manifests:

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

#Check pods & service:

kubectl get pods
kubectl get svc
kubectl get ingress 

You Can Expose Application On  Port 32022
http://Public Ip:32022

<img width="1629" height="446" alt="image" src="https://github.com/user-attachments/assets/71633c03-c681-4766-acfc-c719a935ced8" />

<img width="1260" height="401" alt="image" src="https://github.com/user-attachments/assets/151e4cad-13aa-40a0-8e89-5b682faf8ed2" />

#TLS Implementation

1.mkdir tls
openssl req -x509 -newkey rsa:4096 -nodes -keyout tls/tls.key -out tls/tls.crt -days 365 \
  -subj "/CN=wisecow/O=wisecow"

2.Create a Kubernetes TLS Secret
kubectl create secret tls wisecow-tls \
  --key=tls/tls.key \
  --cert=tls/tls.crt

3.verify
kubectl get secret wisecow-tls

4.Create a TLS-enabled Service (NodePort)
kubectl apply -f k8s/wisecow-service-tls.yaml

5.Update Wisecow Deployment
kubectl apply -f k8s/wisecow-deployment-tls.yaml

#Now access:
https://<PUBLIC-IP>:30443

<img width="1232" height="430" alt="image" src="https://github.com/user-attachments/assets/b2a7751b-0a57-407d-83ec-2264aeff9c64" />

#CI/CD with GitHub Actions
1.Ensure .github/workflows/ci-cd.yml is present in repo

2.In your GitHub settings → Secrets:

3.Add registry credentials (if using Docker Hub or private registry)

Optionally add KUBE_CONFIG secret (base64-encoded kubeconfig) if you want GitHub Actions to deploy automatically to cluster

On each push to main, workflow will run automatically

 
