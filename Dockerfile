# Image layer for building the application
FROM node:lts as build

# global npm dependencies: recommended to place those dependencies in the non-root user directory
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
# optionally if you want to run npm global bin without specifying path
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /usr/src/app

# rebuild image when package.json or lock has changed
COPY package*.json ./

# install dependencies
RUN npm ci --only=production

# install wunderctl in correct version
RUN curl -s -L https://github.com/wundergraph/wunderctl/releases/download/v0.74.7/wunderctl_0.74.7_Linux_x86_64.tar.gz | tar xzvf - && \
    chmod +x wunderctl && mv wunderctl /usr/local/bin
RUN wunderctl version

# add project artifacts to docker image
ADD . .

# generate your wundergraph application
RUN cd .wundergraph && wunderctl generate

# Image layer for production
from node:lts-alpine as runner
WORKDIR /usr/src/app

# copy entire project and dependencies
COPY --from=build --chown=node:node /usr/src/app/node_modules ./node_modules
COPY --from=build --chown=node:node /usr/src/app/.wundergraph ./.wundergraph
# copy wunderctl to start the server
COPY --from=build --chown=node:node /usr/local/bin/wunderctl /usr/local/bin/wunderctl

# run as non-root user
USER node

CMD wunderctl start --listen_addr 0.0.0.0:9991 --debug

EXPOSE 9991