FROM centos
RUN yum updates
RUN yum install -y vim

CMD ["/bin/bash"]

