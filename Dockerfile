FROM node:7-alpine

RUN apt-get update && apt-get install tomcat9
COPY **/target/*.war /data/

