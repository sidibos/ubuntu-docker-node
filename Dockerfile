#
# Ubuntu Node.js Dockerfile
#
# https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# https://docs.docker.com/examples/nodejs_web_app/
#

# Pull base image.
FROM ubuntu:14.04

# Create app directory
#VOLUME ["/app"]
#RUN mkdir /var/app && chown -R root /var/app/
RUN mkdir /app/
RUN mkdir /app/output/

# Define working directory
WORKDIR /app/
#VOLUME /app
COPY ./package.json /app/
COPY ./Gruntfile.js /app/
COPY ./blog.html ./app/
COPY ./index.html /app/

RUN apt-get update -y
RUN apt-get upgrade -y

#RUN apt-get install chromium-browser -y
#RUN export PUPPETEER_EXECUTABLE_PATH=/snap/bin/chromium
#RUN sudo npm install puppeteer --unsafe-perm=true --allow-root
RUN sudo apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget


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

#RUN sudo npm install -g critical

#RUN     npm install -g bower 
RUN     sudo npm install -g grunt-cli
#RUN sudo npm install puppeteer --unsafe-perm=true --allow-root
RUN     npm install 
#RUN     bower install --allow-root
#RUN npm install util -g
RUN grunt -d

RUN grep '<style>' generated_index.html
#RUN mv generated_blog.html /app/output/

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
#COPY . /src

# Install app dependencies
#RUN cd /src; npm install

# Binds to port 8080
EXPOSE  9000
#CMD ["run"]

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
#CMD ["node", "/src/index.js"]
