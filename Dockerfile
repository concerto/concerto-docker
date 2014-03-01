FROM debian

MAINTAINER Concerto Authors "team@concerto-signage.org"

RUN echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential git-core imagemagick nodejs
RUN apt-get install -y ruby1.9.1-full
RUN apt-get install -y libmysqlclient18 librmagick-ruby libruby1.9.1 libpq5
RUN apt-get install -y zlib1g-dev libmagickcore-dev libmagickwand-dev libsqlite3-dev libmysqlclient-dev libpq-dev libxslt-dev libssl-dev

RUN apt-get install -y libreoffice

RUN gem install bundler
RUN gem install puma

RUN adduser --disabled-password --home=/opt/concerto --gecos "Concerto User" concerto
ADD concerto /opt/concerto/rails-root
ADD utilities /opt/concerto/bin
RUN sh -c "cd /opt/concerto/rails-root/ && bundle install"

VOLUME ["/opt/concerto/config"]
RUN sh -c "cp -r /opt/concerto/config /opt/concerto/rails-root/config"

USER concerto
ENTRYPOINT ["/bin/sh", "-c", "/opt/concerto/bin/concerto"]