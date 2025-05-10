FROM node:23.11-alpine3.21

# set working directory
WORKDIR /home/app/

#Health check issue due to curl command not found
# --fix--
RUN apk add --no-cache curl

# npm install is only required when some packages are added or updated
COPY package*.json .
RUN npm install

# copy required files
COPY index.js index.js

ENV PORT=8000
EXPOSE 8000

# healthcheck command to check if the app is running
HEALTHCHECK --interval=5s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost:${PORT}/health || exit 1

# command to run the app
CMD [ "npm", "start" ]