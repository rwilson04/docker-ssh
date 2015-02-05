if [ "${AUTHORIZED_KEYS}" != "blank" ]; then
    echo "=> Found authorized keys"
    mkdir -p /home/${LOCAL_USER}/.ssh
    chmod 700 /home/${LOCAL_USER}/.ssh
    touch /home/${LOCAL_USER}/.ssh/authorized_keys
    chmod 600 /home/${LOCAL_USER}/.ssh/authorized_keys
    IFS=$'\n'
    arr=$(echo ${AUTHORIZED_KEYS} | tr "," "\n")
    for x in $arr
    do
        x=$(echo $x |sed -e 's/^ *//' -e 's/ *$//')
        cat /home/${LOCAL_USER}/.ssh/authorized_keys | grep "$x" >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "=> Adding public key to /home/${LOCAL_USER}/.ssh/authorized_keys: $x"
            echo "$x" >> /home/${LOCAL_USER}/.ssh/authorized_keys
        fi
        chown -R ${LOCAL_USER} /home/${LOCAL_USER}/.ssh
    done
fi
