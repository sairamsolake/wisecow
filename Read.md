#Deployed  Wisecow Application Using Docker Container
1.docker build -t wisecow:latest .
2.docker tag docker tag wisecow sairam2107/wisecow
3.docker push sairam2107/wisecow

#You Can Expose Application On Port 4499
http://Public Ip:4499

<img width="1896" height="469" alt="image" src="https://github.com/user-attachments/assets/88dac276-924e-4b6e-b9df-188c6612e903" />

#Kubernetes Deployment:
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

You Can Expose Application On Node Port 30499

<img width="1380" height="441" alt="image" src="https://github.com/user-attachments/assets/ae7c3f10-f2b4-4b01-bf78-2acc441348e9" />

<img width="1899" height="427" alt="image" src="https://github.com/user-attachments/assets/6e47cff7-d6c5-4d25-95ed-88973a486bfa" />

#TLS Implementation
<img width="1679" height="214" alt="image" src="https://github.com/user-attachments/assets/e11d3614-c5a0-4076-b142-1038c5f95d12" />
 
