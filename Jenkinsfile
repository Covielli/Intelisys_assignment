pipeline {
  agent {
    docker {
      args '-p 3000:3000'
      image 'ubuntu'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'apt-get update && apt-get install -y git maven'
        sh '''rm -rf ~/lab6
mkdir ~/lab6
cd ~/lab6 && git clone --recursive https://github.com/halushko/appz_bot_example.git
cd ~/lab6/appz_bot_example && mvn clean install && cd hello_bot'''
        sh 'cd lab6/appz_bot_example/hello_bot && mvn  exec:java -Dexec.mainClass="kpi.acts.appz.bot.hellobot.HelloWorldBot" -Dexec.args="1631350081:AAGSyDbixGxarcrbILrgjex6oInkFSleveE Pikachu"'
      }
    }

  }
}