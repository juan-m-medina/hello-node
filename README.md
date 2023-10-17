# Description
Small sample dockerized nodejs project that uses a token for an authenticated registry.

## How to build

```shell
docker build . --tag hello-node --build-arg npm_token=${NPM_TOKEN}
```

## How to run

```shell
docker run --rm hello-node
```

