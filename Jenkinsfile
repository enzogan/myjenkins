
pipeline { 
    agent any
    environment {
        tag = "1.0.${env.BUILD_NUMBER}"
        appName = "mywebsite"
        registryHost = "100.125.0.94:20202/org-demo-aurelien/"
        imageName = "${registryHost}${appName}:${tag}"
    }
    stages {
        stage('Build') {
            steps {
                sh "docker build -t ${imageName} mywebsite/"
            }
        }
        stage('push'){
            steps {
                sh "docker push ${imageName}"
            }
        }
        stage('Deploy') {
            steps {
                kubernetesDeploy configs: "manifests/*.yaml", kubeconfigId: 'mycluster_kubeconfig', enableConfigSubstitution: true
            }
        }
    }
}
