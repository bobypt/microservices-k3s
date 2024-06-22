FROM node:22.3.0-alpine3.19

# Create app directory
WORKDIR /opt/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

ENV NODE_ENV production
EXPOSE 8080
CMD [ "npm", "start" ]