FROM node:23.11-alpine3.21

# set working directory
WORKDIR /home/app/

# npm install is only required when some packages are added or updated
COPY package*.json .
RUN npm install

# copy required files
COPY index.js index.js

ENV PORT=8000
EXPOSE 8000

# command to run the app
CMD [ "npm", "start" ]