
pipeline { 
    agent any
    environment {
        tag = "latest"
        appName = "mywebsite"
        registryHost = "100.125.0.94:20202/org-demo-aurelien/"
        imageName = "${registryHost}${appName}:${tag}"
    }
    stages {
        stage('Build') {
            steps {
                echo "ID1: ${env.BUILD_ID}"
                echo "ID2: ${env.BUILD_NUMBER}"
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
                kubernetesDeploy configs: "manifests/*.yaml", kubeconfigId: 'mycluster_kubeconfig'
            }
        }
    }
}
