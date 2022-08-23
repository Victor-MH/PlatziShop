FROM node:16

#Create app directory
WORKDIR /usr/src/app

#Install app dependencies
#A wildcard is used to ensure both package.json and package-lock.json are copied
#where available (npm@5+)
COPY package*.json ./

RUN npm install

#Bundle app source
COPY . .

RUN npm run build

EXPOSE 8080
CMD ["npm", "run", "start"]

#docker run --rm --name platzishop -p 8080:8080 -v /localpath/project/src:/usr/src/app/src imageID