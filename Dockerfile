FROM centos

MAINTAINER dp 

RUN yum -y update; yum clean all
RUN yum install -y vim wget unzip tar

CMD ["/bin/bash"]



