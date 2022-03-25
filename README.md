# nightwatch-docker

[![nightwatch-docker-workflow](https://github.com/vaibhavsingh97/nightwatch-docker/actions/workflows/workflow.yml/badge.svg)](https://github.com/vaibhavsingh97/nightwatch-docker/actions/workflows/workflow.yml)

Docker setup for [Nightwatch][NightwatchLink] containerized versions of Chrome, Firefox and Edge on Linux.
# 🚀 Usage

## chrome

```sh
docker-compose -f docker-compose.chrome.yml up --exit-code-from nightwatch
```
## firefox

```sh
docker-compose -f docker-compose.firefox.yml up --exit-code-from nightwatch
```
## edge

```sh
docker-compose -f docker-compose.edge.yml up --exit-code-from nightwatch
```

## selenium hub

```sh
docker-compose -f docker-compose.selenium-hub.yml up --exit-code-from nightwatch
```

Stop and remove container set:

```sh
docker-compose -f docker-compose.<service-name>.yml down
```
> service-name would be from either of these `chrome/firefox/edge/selenium-hub`

## 🐛 Issues

Issues with this nightwatch-docker can filed [here](https://github.com/nightwatchjs/nightwatch-docker/issues)

[NightwatchLink]:https://nightwatchjs.org/
