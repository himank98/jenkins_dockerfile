node{
     
    stage('Cloning The Repo'){
        git credentialsId: 'GIT_CREDENTIALS', url:  'https://github.com/himank98/task.git',branch: 'master'

    }

    stage('Building the Image'){
        sh 'docker build -t himank98/jenkins_ubuntu:latest .'
    }

    stage('Push To Docker Hub'){
        withCredentials([string(credentialsId: 'DOKCER_HUB_PASSWORD', variable: 'DOKCER_HUB_PASSWORD')]) {
          sh "docker login -u 2307297 -p ${DOKCER_HUB_PASSWORD}"
        }
        sh 'docker push himank98/jenkins_ubuntu:latest'
    }

}
