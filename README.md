# terraform-devsecops-jenkins

Using tfsec to scan Terraform scripts like Policy-As-Code. This is to ensure the infrastructure spun up using Terraform is secure right from the point it gets pushed to the CI/CD pipeline.

To do this, I used Jenkins and hosted it as a Docker container. 



## Hosting Jenkins

1. Create volume first to save the configurations made in Jenkins. This helps later when restarting the container.
``` 
docker volume create jenkins_home 
```

2. Enter directory containing Dockerfile.
```
docker build -t jenkins-terraform .
```

3. Run command to run the custom image.

```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-terraform:latest
```

4. Below command can be used to keep Jenkins running.
```
docker update --restart unless-stopped jenkins
```

## Jenkins setup

1. In the Jenkins console, created pipeline.

2. Added the github repository link so that Jenkins can pull it for scanning.

3. In the build trigger, selected PollSCM option to make Jenkins poll Github link every 2 mins. CRON job:
```
H/2 * * * *
```
4. Pipeline can also be triggered manually to build on-demand. Helps greatly when troubleshooting.

5. In the pipeline script, used Jenkins file [here](https://github.com/bharadwaj-asb/terraform-devsecops-jenkins/blob/main/Dockerfile) for cloning the repo during execution. This ensure the bash scripts are executed.

6. Tfsec threshold can be set so that findings with higher severity prevent pipelines from going ahead. This can be done using below command.
```
tfsec . --minimum-severity CRITICAL
```

