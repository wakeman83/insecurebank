@Library("TemplateLibrary") _

pipeline {
 agent any
stages{
  stage ('CodeBuild'){
     steps{
         script{
           checkoutfrom.checkOutfromgit('https://github.com/wakeman83/insecurebank.git', 'develop','d2d051a1-abeb-40d1-9a4f-f5a2fcdec990')
           echo 'Checkout done'
           //git branch: 'develop', credentialsId: 'd2d051a1-abeb-40d1-9a4f-f5a2fcdec990', url: 'https://github.com/wakeman83/insecurebank.git'
           sh 'mvn clean package -DskipTests'

           //docker.build ('insecurebank:latest')
           //echo 'Image is built'
           //aquaMicroscanner imageName: 'insecurebank:latest',notCompliesCmd: '',onDisallowed:'fail',outputFormat: 'json'
           stash includes: '**/target/*.war', name:'warfile'
           stash includes: '**/**',name: 'Source'
         }
           
        } 
      }
      

   stage ('SAST') {
            steps  {
                unstash 'Source'
                sh 'cd Source'
                sh "mvn com.github.spotbugs:spotbugs-maven-plugin:4.0.4:spotbugs"
                archiveArtifacts 'target/spotbugsXml.xml'
                
                    }
                        
               }

        
  //  stage ('SCA'){
//        steps{
    //        unstash 'Source'
  //          unstash 'warfile'
            
     //       synopsys_detect detectProperties: '--detect.source.path=.', returnStatus: true
     //   }
      //  }
        
    //stage('SonarQube Security Gate') {
     //       steps {
      //          
    //            script {
      //              withSonarQubeEnv('SonarQube-Local') {
    //                    def scannerhome = tool name: 'SonarScanner-Local', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
     //                   sh "${scannerhome}/bin/sonar-scanner -Dsonar.java.binaries=target"
      //              }
    //            }
      //      }
        //}

    
   //stage('IAST') {
    // steps{
     // script {
     //   print 'Deploy to Tomcat'
      //  unstash 'warfile'
//        sh 'mv ./target/*.war app.war'
  //      sh 'sudo cp app.war /opt/tomcat/webapps/'
    //    sh 'sudo systemctl start tomcat.service'
      //  sh 'sudo systemctl start zap.service'
    //    sleep 60
     //   sh 'wget http://localhost:8181/app'
     //   
     //   sh 'zap-cli -p 2375 status -t 120'
      //  sh 'zap-cli -p 2375 open-url http://localhost:8181/app'
    //    sh 'zap-cli -p 2375 spider http://localhost:8181/app'
      //  sh 'zap-cli -p 2375 active-scan -r http://localhost:8181/app'
    //    sh 'zap-cli -p 2375 alerts'
     //}
    //}
    }
}
//post {
 //         always {
  //            sh 'sudo systemctl stop tomcat.service'
//              sh 'sudo systemctl stop zap.service'
 //        }
// }
//}
