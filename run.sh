#!/bin/bash

bash /opt/deploy/addUser.sh
bash /opt/deploy/addAuthorizedKeys.sh
bash /opt/deploy/ssh.sh
#exec /usr/sbin/sshd -D
