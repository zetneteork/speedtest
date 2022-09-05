FROM debian:stable-slim
#ARG KEYSERVER="keyserver.ubuntu.com"
#ARG RECVKEYS=379CE192D401AB61
#COPY tmp/install.deb.sh ./install.deb.sh
RUN echo "speedtest build" && \
    #export $(grep 'VERSION_CODENAME' /etc/os-release) && \
    apt-get update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr curl && \
    #export INSTALL_KEY=379CE192D401AB61 && \
    # Ubuntu versions supported: xenial, bionic && \
    # Debian versions supported: jessie, stretch, buster && \
    #export DEB_DISTRO=$(lsb_release -sc) && \
    #export DEB_DISTRO="buster" && \
    #https://packagecloud.io/install/repositories/ookla/speedtest-cli/config_file.list?os=${os}&dist=${dist}&source=script && \
    #echo "deb https://ookla.bintray.com/debian ${VERSION_CODENAME} main" | tee  /etc/apt/sources.list.d/speedtest.list && \
    #bash /install.deb.sh && \
    echo "deb https://packagecloud.io/ookla/speedtest-cli/debian/ bullseye main" > /etc/apt/sources.list.d/ookla_speedtest-cli.list && \
    #apt-key adv --keyserver ${KEYSERVER} --recv-keys ${RECVKEYS} && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605C66F00D6C9793 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8E61C2AB9A6D1557 && \
    apt-get update && \
    apt-get install -y speedtest && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
CMD [ "speedtest", "--accept-license", "--accept-gdpr", "-f", "json" , "|" , "grep" , "timestamp" ]
