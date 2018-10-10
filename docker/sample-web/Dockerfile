FROM ruby:2.1.10

RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa

RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

RUN apt-get update
RUN apt-get install -y curl

RUN gem update --system
RUN apt-get update -qq && apt-get install -y build-essential patch libicu-dev git libmysqlclient-dev 
RUN gem install bundler
RUN mkdir /sample
WORKDIR /sample
ADD . /sample
RUN bundle install
