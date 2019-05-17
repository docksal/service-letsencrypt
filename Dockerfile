ARG FROM
FROM ${FROM}

USER root

RUN apk add --no-cache \
	bash \
	curl \
	socat \
	openssl && \
    :>/root/.profile && \
    mkdir -p /data/crt && \
    curl https://get.acme.sh | sh && \
    ln -s /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

