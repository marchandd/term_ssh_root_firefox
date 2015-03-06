#!/bin/bash
#Fixed root password
#RUN echo 'root:root' |chpasswd
#Dynamic root password
#PASSWD=`pwgen -c -n -1 15`
# Set a basic fixed password for Docker public repository access.
PASSWD='term_ssh_root_firefox'
echo "root:$PASSWD" |chpasswd
echo "root password access: $PASSWD"
echo "root password access: $PASSWD" > ~/password.log
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
