FROM hypriot/rpi-alpine-scratch:v3.3

MAINTAINER Yves Mettier <ymettier@nowhere.fr> (@free.fr)

ENV DEBUG=false              \
	DOCKER_GEN_VERSION=0.7.3 \
	DOCKER_GEN_ARCH=armhf \
	DOCKER_HOST=unix:///var/run/docker.sock

RUN apk --update add bash curl ca-certificates procps jq tar && \
	curl -L -O https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-$DOCKER_GEN_ARCH-$DOCKER_GEN_VERSION.tar.gz && \
	tar -C /usr/local/bin -xvzf docker-gen-linux-$DOCKER_GEN_ARCH-$DOCKER_GEN_VERSION.tar.gz && \
	rm -f docker-gen-linux-$DOCKER_GEN_ARCH-$DOCKER_GEN_VERSION.tar.gz && \
	apk del tar && \
	rm -rf /var/cache/apk/*

WORKDIR /app

# Install simp_le program
COPY /install_simp_le.sh /app/install_simp_le.sh
RUN chmod +rx /app/install_simp_le.sh && sync && /app/install_simp_le.sh && rm -f /app/install_simp_le.sh

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh" ]
CMD ["/bin/bash", "/app/start.sh" ]

COPY /app/ /app/
