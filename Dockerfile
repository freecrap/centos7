FROM centos:7
RUN mkdir /root/src/
WORKDIR /root/src/

COPY ./src/ /root/src/

RUN ./install.sh
RUN echo "rvm use 3.0.2" >> ~/.bashrc
RUN bash -l -c "gem install pg -v 1.5.3 -- --with-pg-config=/usr/pgsql-11/bin/pg_config"
RUN bash -l -c bundle install --jobs=8
