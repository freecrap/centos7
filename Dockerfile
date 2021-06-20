FROM centos:7
RUN mkdir /root/src/
WORKDIR /root/src/
COPY ./src/ /root/src/
RUN ./install.sh
