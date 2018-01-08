FROM node:alpine

LABEL maintainer="marc@marclewis.io, siddv19@gmail.com"

WORKDIR /usr/src/app

# make a dir for mounting the local ./app to a docker volume in docker-compose
RUN mkdir ./app

# install everything else
COPY package.json .

RUN npm install

# install pm2 to run the app
RUN npm install -g pm2

# run the app
COPY process.yaml .

CMD pm2 start --no-daemon process.yaml --watch
