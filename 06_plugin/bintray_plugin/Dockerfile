FROM debian:stable-slim

WORKDIR /app

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl

RUN curl -fL https://getcli.jfrog.io | sh


RUN /app/jfrog bt config --user $BINTRAY_USER --key $BINTRAY_KEY

CMD /app/jfrog bt package-show $BINTRAY_PACKAGE

