#FROM tomcat:8.5.78-jre8-temurin-focal
FROM lunasec/tomcat-9.0.59-jdk11

ADD target/helloworld.war /helloworld/helloworld.war
WORKDIR /helloworld/
RUN mv helloworld.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]

