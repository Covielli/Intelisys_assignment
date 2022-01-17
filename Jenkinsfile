pipeline {
  environment {dockerImage = ''}
  agent any
  stages {
    stage('Prepare'){
      steps{
        sh 'docker stop $(docker ps -q --filter "ancestor=lab11botcarrier")'
        sh 'docker rm -f $(docker ps -q --filter "ancestor=lab11botcarrier" --filter "status=exited")'
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t lab11botcarrier /var/jenkins_home/workspace/DockerPipeline/'
      }
    }
    stage('Deploy'){
      steps{
      sh 'docker run -d lab11botcarrier'
      }
    }

  }
}
 
