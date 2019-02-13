# Get the base image
FROM ubuntu:18.04
MAINTAINER Aslamkv

ENV DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN \
apt-get update && \
apt-get -y upgrade && \
apt-get install -y curl && \
apt-get install -y vim && \
apt-get install -y gnupg2 && \
apt-get install -y unzip

# Install nodejs and yarn
RUN \
curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && \
apt-get install -y nodejs && \
apt-get install -y yarn

# Install vue-cli
RUN yarn global add @vue/cli

# Scripts
COPY scripts/init.sh /root/init.sh

# Configurations
COPY config/.bash_history /root/

WORKDIR /root/app/
EXPOSE 8080

# Initialization
CMD ["/bin/bash","/root/init.sh"]
