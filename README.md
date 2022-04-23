# Docker

This repository instructs you how to build a docker container for WunderGraph. It's aligned with [best practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md) of the community.

## Getting Started

1. Copy `Dockerfile` and `.dockerignore` to your project directory.
2. Run `docker build -t wundergraph .` to build your final image.
3. Run `docker run -p 9991:9991 wundergraph` to test your image.