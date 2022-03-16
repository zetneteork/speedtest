FROM debian:stable-slim
ARG gpg_key_url="https://packagecloud.io/ookla/speedtest-cli/gpgkey"
ARG gpg_keyring_path="/usr/share/keyrings/ookla_speedtest-cli-archive-keyring.gpg"
ARG apt_source_path="/etc/apt/sources.list.d/ookla_speedtest-cli.list"
RUN echo "speedtest build" && \
    . /etc/os-release && \
    apt_config_url_modified="https://packagecloud.io/install/repositories/ookla/speedtest-cli/config_file.list?os=${ID}&dist=${VERSION_CODENAME}&source=script" &&\
    apt-get update && \
    apt-get install -y gnupg1 apt-transport-https dirmngr curl && \
    echo ${apt_config_url_modified} && \
    curl -sSf ${apt_config_url_modified} > ${apt_source_path} && \
    curl -fsSL ${gpg_key_url} | gpg --dearmor > ${gpg_keyring_path} && \
    apt-get update && \
    apt-get install -y speedtest && \
    apt-get install -fyq && \
    apt-get clean && \
    rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
ENTRYPOINT [ "speedtest" ]
CMD [ "speedtest", "--accept-license", "--accept-gdpr", "-f", "json" ]