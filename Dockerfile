FROM python:slim-buster

LABEL maintainer="brantan@pando.in"

RUN apt-get update && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    mkdir -p /home/testuser/upload && \
    chmod -R 777 /home/testuser/ && \
    rm -f /etc/ssh/ssh_host_*key* && \
    python --version

COPY files/sshd_config /etc/ssh/sshd_config
COPY files/create-sftp-user /usr/local/bin/
COPY files/entrypoint /

EXPOSE 22
EXPOSE 8000

ENTRYPOINT ["/entrypoint"]