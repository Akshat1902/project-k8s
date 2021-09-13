pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/Akshat1902/project-k8s.git'
            }
        }

        stage('SonarQube analysis'){
            steps{
            script {
              scannerHome = tool 'Example-voting-app'
            }
            withSonarQubeEnv('Example-voting-app') {
             sh "${scannerHome}/bin/sonar-scanner \
             -D sonar.login=admin \
             -D sonar.password=password123 \
             -D sonar.projectKey=Example-voting-app"
            }
          }
        }
         stage('Docker'){
            steps{
                sh "ansible-playbook azure-docker.yml"
                sh "sleep 60"
            }
        }
        stage('Docker Images'){
            steps{
                sh "ansible-playbook -i hosts buildImages.yml"
            }
        } 
        stage('Kubernetes and minikube'){
            steps{
                sh "ansible-playbook -i hosts install-minikube.yml"
            }
        }
        stage('Deploy'){
            steps{
                sh "ansible-playbook -i hosts ansible-minikube.yml"
            }
        }  
        stage('PF'){
            steps{
                sh "ansible-playbook -i hosts DeployForward.yml"
            }
        }
        }
}