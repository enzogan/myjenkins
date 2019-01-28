node {

    checkout scm

    env.DOCKER_API_VERSION="1.30"
    
    int tag = readFile('version.txt') as Integer
    appName = "mywebsite"
    registryHost = "100.125.0.94:20202/org-demo-aurelien/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName
    ntag = tag + 1
    
    stage "Build"
          sh "docker build -t ${imageName} mywebsite/"
        writeFile file: 'version.txt', text: ntag
    
    stage "Push"

        sh "docker push ${imageName}"

    stage "Deploy"

        kubernetesDeploy configs: "manifests/*.yaml", kubeconfigId: 'mycluster_kubeconfig'

}
