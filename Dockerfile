FROM shinymayhem/base

RUN apt-get update && \
	apt-get install -y openssh-server

ADD conf/sshd_config /etc/ssh/sshd_config
ADD run.sh /run.sh

RUN chmod +x /run.sh

EXPOSE 22
CMD ["/run.sh"]
