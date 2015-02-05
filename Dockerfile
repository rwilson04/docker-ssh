FROM shinymayhem/base

RUN apt-get update && \
	apt-get install -y openssh-server && \
	mkdir -p /var/run/sshd


ADD conf/sshd_config /etc/ssh/sshd_config
ADD run.sh /opt/deploy/run.sh
ADD ssh.sh /opt/deploy/ssh.sh
ADD addUser.sh /opt/deploy/addUser.sh
ADD addAuthorizedKeys.sh /opt/deploy/addAuthorizedKeys.sh

RUN chmod +x /*.sh

ENV LOCAL_USER username
ENV AUTHORIZED_KEYS blank

EXPOSE 22
#CMD ["/run.sh"]
CMD /bin/bash /opt/deploy/run.sh
