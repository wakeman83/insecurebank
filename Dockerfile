FROM tomcat9:latest

COPY **/target/*.war /data/app.war

