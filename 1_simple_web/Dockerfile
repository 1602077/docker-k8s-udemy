FROM node:alpine

WORKDIR /usr/app

# Copy simple_web wd inside docker container
COPY ./package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "start"]
