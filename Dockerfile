FROM tomcat:latest

COPY target/insecure-bank.war /data/app.war

