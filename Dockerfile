FROM debian:stable-slim
ARG KEYSERVER="keyserver.ubuntu.com"
ARG RECVKEYS=379CE192D401AB61
RUN echo "speedtest build" && \
    export $(grep 'VERSION_CODENAME' /etc/os-release) && \
    apt-get update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr && \
    #export INSTALL_KEY=379CE192D401AB61 && \
    # Ubuntu versions supported: xenial, bionic && \
    # Debian versions supported: jessie, stretch, buster && \
    #export DEB_DISTRO=$(lsb_release -sc) && \
    #export DEB_DISTRO="buster" && \
    apt-key adv --keyserver ${KEYSERVER} --recv-keys ${RECVKEYS} && \
    echo "deb https://ookla.bintray.com/debian ${VERSION_CODENAME} main" | tee  /etc/apt/sources.list.d/speedtest.list && \
    apt-get update && \
    # Other non-official binaries will conflict with Speedtest CLI && \
    # Example how to remove using apt-get && \
    # sudo apt-get remove speedtest-cli && \
    apt-get install -y speedtest && \
    apt-get install -fyq && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
CMD [ "speedtest", "--accept-license", "--accept-gdpr", "-f", "json" ]