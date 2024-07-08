pipeline{
    agent{
        label 'MAVEN-3.9.5'
    }
    tools{
        jdk 'JDK_17'
        maven 'MAVEN_3.9.5'
    }
    options{
        timeout(time: 15, unit: 'MINUTES')
    }
    triggers{
        cron('0 15 * * 1-5')
    }
    stages{
        stage("git"){
            steps{
                git url: 'https://github.com/Ashfaq47/spring-petclinic.git' ,
                    branch: 'release'
            }
        }
        stage("build"){
            steps{
                sh 'mvn clean package'
            }
        }
    }
    post{
        success{
            archiveArtifacts artifacts: '**/*.jar'
            junit testResults: '**/TEST-*.xml'
            mail subject: 'build stage succeeded' ,
                 from:'qtdevops@learningthought.io' ,
                 to:'all@learningthought.io' ,
                 body: 'Refer ${env.BUILD_URL} for more details'
        }
        failure{
            mail subject: 'build stage failed' ,
                 from:'qtdevops@learningthought.io' ,
                 to:'all@learningthought.io' ,
                 body:'Refer ${env.BUILD_URL} for more details'
        }        
    }
}