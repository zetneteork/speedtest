FROM debian:stable-slim
RUN echo "speedtest build" && \
    apt-get update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr && \
    export INSTALL_KEY=379CE192D401AB61 && \
    # Ubuntu versions supported: xenial, bionic && \
    # Debian versions supported: jessie, stretch, buster && \
    #export DEB_DISTRO=$(lsb_release -sc) && \
    # lsb_release is not part of the debian stable-slim
    export DEB_DISTRO="buster" && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY && \
    echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | tee  /etc/apt/sources.list.d/speedtest.list && \
    apt-get update && \
    apt-get install -y speedtest && \
    apt-get install -fyq && \
    apt-get clean && \
    rm -rf \
        /etc/default/plexmediaserver \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
CMD [ "speedtest", "--accept-license", "--accept-gdpr", "-f", "json"]