FROM centos:7
MAINTAINER prasanth

ADD jdk-14.0.1_linux-x64_bin.tar.gz /root
RUN mv /root/jdk-14.0.1/ /usr/local/jdk1.14
ENV JAVA_HOME=/usr/local/jdk1.14
ENV CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
ENV PATH=$JAVA_HOME/bin:$PATH

ADD apache-tomcat-7.0.104.tar.gz /root
RUN mv /root/apache-tomcat-7.0.104/ /usr/local/tomcat
RUN ln -s /usr/local/tomcat/bin/shutdown.sh /usr/local/bin/;ln -s /usr/local/tomcat/bin/startup.sh /usr/local/bin/

EXPOSE 8080
ENTRYPOINT /usr/local/tomcat/bin/startup.sh && /bin/bash && tail -f /usr/local/tomcat/logs/catalina.out


