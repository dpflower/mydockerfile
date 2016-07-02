FROM centos

MAINTAINER dp 

RUN yum -y update; yum clean all
RUN yum install -y vim wget unzip tar; yum clean all

RUN curl -SLO "http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz"; tar -xzf "apache-tomcat-8.5.3.tar.gz" -C /usr/local/; rm "apache-tomcat-8.5.3.tar.gz"

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz;  tar -xzf "jdk-8u92-linux-x64.tar.gz" -C /usr/local/; rm "jdk-8u92-linux-x64.tar.gz"


ENV JAVA_HOME /usr/local/jdk1.8.0_92
ENV CATALINA_HOME /usr/local/apache-tomcat-8.5.3  
ENV PATH $JAVA_HOME/bin:$PATH:$CATALINA_HOME/lib
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$CATALINA_HOME/bin

RUN ln -s /usr/local/apache-tomcat-8.5.3/ /usr/local/tomcat

EXPOSE 8080

CMD ["/bin/bash"]


