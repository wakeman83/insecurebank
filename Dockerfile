FROM tomcat:latest

COPY **/target/*.war /data/app.war

