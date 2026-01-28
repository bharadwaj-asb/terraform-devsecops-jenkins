# terraform-devsecops-jenkins

## Hosting Jenkins

1. Create volume first to save the configurations made in Jenkins. This helps later when restarting the container.
``` 
docker volume create jenkins_home 
```

2. Enter directory containing Dockerfile
```
docker build -t jenkins-terraform .
```

3. Run command to run the custom image

```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-terraform:latest
```

4. Below command can be used to keep Jenkins running.
```
docker update --restart unless-stopped jenkins
```
