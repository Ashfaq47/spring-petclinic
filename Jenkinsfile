pipeline{
    agent none
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
                agent MAVEN-3.9.5
                git url: 'https://github.com/Ashfaq47/spring-petclinic.git' ,
                branch: 'main'
            }            
        }
        stage('build'){
            steps{
                agent JAVA-17
                sh 'mvn clean package'
                archiveArtifacts artifacts: '**/spring-petclinic-*.jar'
                junit testResults: '**/TEST-*.xml'
                
            }
        }
    }
}