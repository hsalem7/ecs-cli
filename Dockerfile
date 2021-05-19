FROM alpine:3.10

WORKDIR /

RUN apk add gnupg
RUN apk add curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh


RUN curl -Lo /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest

COPY ./amazon-pgp-public-key ./amazon-pgp-public-key

RUN gpg --import ./amazon-pgp-public-key

RUN curl -Lo ecs-cli.asc https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest.asc

RUN gpg --verify ecs-cli.asc /usr/local/bin/ecs-cli

RUN chmod +x /usr/local/bin/ecs-cli

ENTRYPOINT ["/entrypoint.sh"]
