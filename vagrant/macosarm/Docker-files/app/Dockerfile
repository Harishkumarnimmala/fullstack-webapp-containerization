FROM tomcat:10-jdk21

RUN rm -rf /usr/local/tomcat/webapps/*

# 👇 Correct relative path assuming you're running docker compose from root
COPY fullstack-webapp-containerization/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
