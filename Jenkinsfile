node {

    checkout scm

    env.DOCKER_API_VERSION="1.30"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = readFile('commit-id').replace("\n", "").replace("\r", "")
    appName = "mywebsite"
    registryHost = "enzogan/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName

    stage "Build"
    
        sh "docker build -t ${imageName} -f mywebsite/Dockerfile"
    
    stage "Push"

        sh "docker push ${imageName}"

    stage "Deploy"

        kubernetesDeploy configs: "manifests/*.yaml", kubeconfigId: 'mycluster_kubeconfig'

}
