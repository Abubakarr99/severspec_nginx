FROM debian:stable-slim
LABEL name="apache"
LABEL maintainer="John Doe <john@doe.com>"
LABEL version=1.0
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
