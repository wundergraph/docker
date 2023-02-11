FROM docker.io/node:18-alpine
ARG wg_public_node_url
ARG commit_sha

WORKDIR /app
ENV CI=true WG_COPY_BIN_PATH=/usr/bin/wunderctl
COPY package.json package-lock.json /app/
RUN npm ci --prefer-offline --no-audit
COPY .wundergraph ./.wundergraph
WORKDIR /app
ENV WG_NODE_URL=http://127.0.0.1:9991 WG_NODE_HOST=0.0.0.0 WG_NODE_PORT=9991 WG_SERVER_URL=http://127.0.0.1:9992 WG_SERVER_HOST=127.0.0.1 WG_SERVER_PORT=9992 WG_PUBLIC_NODE_URL=${wg_public_node_url}
RUN wunderctl generate --pretty-logging=true --wundergraph-dir=.wundergraph
ENV WG_CLOUD_DEPLOYMENT_ID=1 WG_CLOUD_DEPLOYMENT_COMMIT_SHA=${commit_sha} WG_CLOUD_DEPLOYMENT_COMMIT_URL=https://github.com/wundergraph/docker/commitSHA
CMD wunderctl start --pretty-logging=false --wundergraph-dir=.wundergraph
