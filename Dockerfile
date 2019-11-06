FROM nikolaik/python-nodejs:python3.8-nodejs12

WORKDIR /usr/src

ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN set -eux; \
  apt-get update -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND dialog

RUN pip install awscli
RUN npm install -g aws-cdk
RUN mkdir /root/.aws

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

