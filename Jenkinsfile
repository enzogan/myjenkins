node {

    checkout scm

    env.DOCKER_API_VERSION="1.30"
    
    tag = readFile('version.txt')
    appName = "mywebsite"
    registryHost = "100.125.0.94:20202/org-demo-aurelien/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName

    stage "Build"
        ntag = tag + 1
        printf ntag
        sh "docker build -t ${imageName} mywebsite/"
        writeFile file: 'version.txt', text: ntag
    
    stage "Push"

        sh "docker push ${imageName}"

    stage "Deploy"

        kubernetesDeploy configs: "manifests/*.yaml", kubeconfigId: 'mycluster_kubeconfig'

}
