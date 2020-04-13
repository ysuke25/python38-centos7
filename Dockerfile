FROM centos:7

LABEL title="python3.8"

RUN yum -y groupinstall "Development Tools" \
&&  yum -y install openssl-devel bzip2-devel libffi-devel \
&&  rm -rf /var/cache/yum/* \
&&  yum clean all

workdir /root
RUN yum -y install wget\
&&  wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz

RUN tar xvf Python-3.8.2.tgz
workdir /root/Python-3.8.2

RUN ./configure --enable-optimizations && make altinstall
RUN python3.8 --version

# clean up
workdir /root
RUN rm -f Python-3.8.2.tgz
RUN yum -y groupremove "Development Tools"

#python3.8 [command]