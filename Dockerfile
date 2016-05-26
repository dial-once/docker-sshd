FROM alpine:edge

MAINTAINER Julien Kernec'h <docker@dial-once.com>

RUN apk --no-cache --update add bash git openssh rsync \
 && mkdir -p ~root/.ssh \
 && chmod 700 ~root/.ssh/ \
 && echo -e "Port 22\n" >> /etc/ssh/sshd_config \
 && echo -e "PasswordAuthentication no\n" >> /etc/ssh/sshd_config \
 && echo -e "ChallengeResponseAuthentication no\n" >> /etc/ssh/sshd_config \
 && cp -a /etc/ssh /etc/ssh.cache \
 && rm -rf /var/cache/apk/*

EXPOSE 22

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
