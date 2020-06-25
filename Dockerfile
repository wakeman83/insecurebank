FROM tomcat:latest

RUN apt-get update && apt-get install tomcat9
COPY warfile /data/

