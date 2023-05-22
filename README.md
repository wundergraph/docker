[![Tests](https://github.com/wundergraph/docker/actions/workflows/ci.yml/badge.svg)](https://github.com/wundergraph/docker/actions/workflows/ci.yml)

# Docker

This repository instructs you how to build a docker container for WunderGraph. It's aligned with [best practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md) of the community.

> **Note**: The approach used in this repository assumes that you build your dependencies inside docker. While this a good practice, it's not always practical. For example, if you want to take advantage of the CI cache you need to modify the dockerfile accordingly.

## Example

```
.
└── app/
    ├── .wundergraph/
    │   ├── generated/
    │   ├── operations/
    │   ├── wundergraph.config.ts
    │   ├── wundergraph.server.ts
    │   └── wundergraph.operations.ts
    ├── Dockerfile
    ├── .dockerignore
    ├── tsconfig.json
    └── package.json
```

### Test

```shell
# Install your project to generate a lockfile
npm i
# Build the docker image. Set public url to generate a compatible client 
docker build --build-arg wg_public_node_url=https://your-public-url.com \
             -t wundergraph .
```

Run `docker run -p 9991:9991 wundergraph:latest` to test your image.

### Get dragons

```shell
curl -X GET http://localhost:9991/operations/Dragons
```