
pipeline { 
    agent any 
    stages {
        stage('Build') { 
            steps { 
                echo "Running ${env.BUILD_ID}"
                tag = "latest"
                appName = "mywebsite"
                registryHost = "100.125.0.94:20202/org-demo-aurelien/"
                imageName = "${registryHost}${appName}:${tag}"
                
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
