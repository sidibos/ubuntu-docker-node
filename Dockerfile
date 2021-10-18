#
# Ubuntu Node.js Dockerfile
#
# https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# https://docs.docker.com/examples/nodejs_web_app/
#

# Pull base image.
FROM ubuntu:14.04

WORKDIR /app
COPY package.json /app/

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install nodejs -y
RUN apt-get install nodejs-legacy -y
RUN apt-get install npm -y
RUN apt-get install -y apt-transport-https

# Install Node.js
RUN apt-get install --yes curl
#RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
#RUN apt-get install -y apt-transport-https --yes node
#RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
RUN npm config set strict-ssl false
RUN sudo npm install -g n
RUN sudo n stable
RUN node -v

#RUN     npm install -g bower 
RUN     sudo npm install -g grunt-cli
RUN     npm install 
#RUN     bower install --allow-root
#RUN npm install util -g
RUN grunt --version

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
#COPY . /src

# Install app dependencies
#RUN cd /src; npm install

# Binds to port 8080
#EXPOSE  8080

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
#CMD ["node", "/src/index.js"]
