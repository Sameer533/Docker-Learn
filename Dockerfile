FROM ubuntu
#BASE IMAGE
RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN nano /tmp/nodesource_setup.sh
RUN apt install node.js
#copying whole source code
COPY index.js index.js
COPY package-lock.json package-lock.json
COPY package.json package.json

RUN npm install
#need to install npm and node ;