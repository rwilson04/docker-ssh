if [ "${LOCAL_USER}" != "username" ]; then
	useradd -m ${LOCAL_USER} -s /bin/bash
	usermod -a -G admin ${LOCAL_USER}
fi
