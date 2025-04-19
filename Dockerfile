FROM ubuntu

# Install curl
RUN apt-get update
RUN apt install -y curl

# Install node js in ubuntu image
RUN curl -sL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt install -y nodejs

# copy required files
COPY index.js /home/app/index.js
COPY package.json /home/app/package.json
COPY package-lock.json /home/app/package-lock.json

# set working directory
WORKDIR /home/app

RUN npm install

