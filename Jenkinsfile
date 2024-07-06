pipeline{
    agent {
        label 'MAVEN-3.9.5'
    }
    tools{
        jdk 'JDK_17'
        maven 'MAVEN_3.9.5'
    }
    options{
        timeout(time:15, unit: 'MINUTES')
    }
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage("git"){
            steps{
                git url: 'https://github.com/Ashfaq47/spring-petclinic.git' ,
                branch: 'main'
            }            
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
                archiveArtifacts artifacts: '**/spring-petclinic-*.jar'
                junit testResults: '**/TEST-*.xml'

            }
        }
    }
    post{
        success{
            archiveArtifacts artifacts: '**/*.jar'
            junit testResults: '**/TEST-*.xml'
            mail subject: 'Build stage succesful'
                 from: 'qtdevops@learningthought.io'
                 to: 'all@learningthought.io'
                 body: 'Refer $BUILD_URL for more details'
        }
        failure{
            mail subject: 'Build stage failed'
                 from: 'qtdevops@learningthought.io'
                 to: 'all@learningthought.io'
                 body: 'Refer $BUILD_URL for more details'
        }
    }
}