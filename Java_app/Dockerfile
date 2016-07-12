#Base Image ubuntu with tag 14.04
FROM ubuntu:14.04

#update ubuntu image
RUN apt-get update

#Install jdk7 to run java application
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes openjdk-7-jre-headless wget

ENV TOMCATVER 7.0.70

#Install tomcat7 application webserver
RUN (wget -O /tmp/tomcat7.tar.gz \
    http://www.us.apache.org/dist/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz && \
    cd /opt && \
    tar zxf /tmp/tomcat7.tar.gz && \
    mv /opt/apache-tomcat* /opt/tomcat && \
    rm /tmp/tomcat7.tar.gz && \
    ls -a)

#Install tomcat7 application webserver
#RUN apt-get install -y tomcat7

#Add script to run tomcat7 service
ADD ./run.sh /usr/local/bin/run


# Add volumes for volatile directories that aren't usually shared with child images. 
VOLUME ["/tomcat/logs", "/tomcat/temp", "/tomcat/work"]

### to deploy a specific war to ROOT,(Java application war)
RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
ADD EmployeeApplication.war  /opt/tomcat/webapps/ROOT.war

#Expose port inside container to run tomcat7 service on 8080
EXPOSE 8080

#Start tomcat7 process inside container with java application
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
