# CoreNLP-English

This repo creates standard images of Stanford's CoreNLP with the default Chinese model.

Documentation
=============

See https://transcrob.es for information about how Stanford's CoreNLP is used in Transcrobes.

See https://stanfordnlp.github.io/CoreNLP/ for information on Stanford's CoreNLP itself.


## Build Configuration

Gitlab CI also requires the following CI ENV variables:

`EXT_REG_REGISTRY`: Docker registry (e.g., docker.io for Dockerhub)

`EXT_REG_ORGANISATION`: First level of image tag name (i.e, the 'Organisation' for Dockerhub, e.g., `transcrobes`)

`EXT_REG_USER`: External registry username

`EXT_REG_PASSWORD`: External registry user's password

These should be set at the project or group level.

## Run Configuration

Three ENV variables can be set to control the running CoreNLP process and should be passed to `docker run` (or to Kubernetes, etc.):

`TIMEOUT`: Default 30000 (milliseconds)

`JAVA_XMX`: Default 300m (megabytes)

`PORT`: Default listen 9000

## Contributing

See [the Transcrobes website](https://transcrob.es/page/contribute) for more information. Please also take a look at our [code of conduct](https://transcrob.es/page/code_of_conduct) (or CODE\_OF\_CONDUCT.md in this repo).

## External Open Source code used in/by this repo and licences

This repo contains code/resources for building and pushing Docker container images of Stanford's CoreNLP running on eclipse-temurin:17 base images. It does not directly include any of the code from those projects.
