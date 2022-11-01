FROM debian:stable-slim
ARG KEYSERVER="keyserver.ubuntu.com"
ARG RECVKEYS="605C66F00D6C9793 0E98404D386FA1D9 648ACFD622F3D138 8E61C2AB9A6D1557"
RUN echo "speedtest build" && \
    apt-get update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr curl && \
    set -a && \
    . /etc/os-release && \
    set +a && \
    apt-key adv --keyserver ${KEYSERVER} --recv-keys ${RECVKEYS} && \
    echo "deb https://packagecloud.io/ookla/speedtest-cli/${ID}/ ${VERSION_CODENAME} main" > /etc/apt/sources.list.d/ookla_speedtest-cli.list && \
    apt-get update && \
    apt-get install -y speedtest && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
CMD [ "speedtest", "--accept-license", "--accept-gdpr", "-f", "json" , "|" , "grep" , "timestamp" ]
