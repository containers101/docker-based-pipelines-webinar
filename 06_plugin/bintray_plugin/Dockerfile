FROM debian:stable-slim

WORKDIR /app

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl

RUN curl -fL https://getcli.jfrog.io | sh

ENV JFROG_CLI_OFFER_CONFIG false

CMD /app/jfrog bt package-show $BINTRAY_PACKAGE --user $BINTRAY_USER --key $BINTRAY_KEY

