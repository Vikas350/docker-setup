FROM node:20-alpine3.19 as base

# Stage 1: Build Stuff
FROM base as builder

WORKDIR /home/build

COPY package*.json .
COPY tsconfig.json .

RUN npm install

COPY src/ src/

RUN npm run build

# Stage 2: Runner
FROM base as runner

# after build is done, we only copies the required files and delete the rest
# and then run then install dependencies and run the app
# this is a multi-stage build

WORKDIR /home/app

COPY --from=builder /home/build/dist dist/
COPY --from=builder /home/build/package*.json .

# --omit=dev ==> this will not install dev dependencies
RUN npm install --omit=dev

# we can create user and group
# so that user does not have root privileges
RUN addgroup --system --gid 1001 nodejs
RUN addgroup --system --uid 1001 nodejs

USER nodejs

EXPOSE 8000
ENV PORT=8000

CMD [ "npm", "start" ]
