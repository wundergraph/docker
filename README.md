# Docker

This repository instructs you how to build a docker container for WunderGraph. It's aligned with [best practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md) of the community.

## Example

```
.
└── app/
    ├── .wundergraph
    ├── Dockerfile
    ├── .dockerignore
    ├── wundergraph.config.ts
    ├── wundergraph.server.ts
    └── wundergraph.operations.ts
```
_Depending on your application structure, you may want to include only your WunderGraph files in the image. In that case you can target the build context `app/.wundergraph`._

### Test
Navigate to `app/` and run `docker build -t wundergraph .` to build your final image.
Run `docker run -p 9991:9991 wundergraph` to test your image.