pipeline{
    environment { 
        registry = "gaurav2203/flight_price_prediction" 
        registryCredential = 'docker_hub' 
        dockerImage = ''
    }
    agent any
    stages{
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }
       stage("Launching deployment on Gcloud"){
            steps{
                sh 'sudo chmod +x kube.sh'
                sh './kube.sh'
            }
        } 
    }
}
