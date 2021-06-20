FROM centos:7
RUN mkdir /root/src/
WORKDIR /root/src/

COPY ./src/ /root/src/

RUN ./install.sh
RUN echo "rvm use 2.5.5" >> ~/.bashrc
RUN bash -l -c bundle install