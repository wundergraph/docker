[![Tests](https://github.com/wundergraph/docker/actions/workflows/ci.yml/badge.svg)](https://github.com/wundergraph/docker/actions/workflows/ci.yml)

# Docker

This repository instructs you how to build a docker container for WunderGraph. It's aligned with [best practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md) of the community.

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
npm i && docker build -t wundergraph .
```

Run `docker run -p 9991:9991 wundergraph:latest` to test your image.