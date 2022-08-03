FROM kalilinux/kali-rolling

ENV KALI_PASS=_set_this_
ENV KALI_PORT=22

LABEL org.opencontainers.image.authors="caligari@treboada.net"
LABEL org.opencontainers.image.url="https://github.com/Treboada/docker-kali-sshd"

ENV ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
	openssh-server

COPY docker_entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/bin/bash", "/usr/local/bin/docker_entrypoint.sh" ]

CMD [ "-c", "while true; do sleep 5; done" ]

EXPOSE ${KALI_PORT}/tcp

