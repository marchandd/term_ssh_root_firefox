FROM ubuntu:14.10
MAINTAINER Marchand D. https://github.com/marchandd/vncxvfb_wine_firefox
RUN apt-get update && apt-get install -y openssh-server firefox supervisor dbus-x11 pwgen
RUN mkdir /var/run/sshd
#Fixed root password
#RUN echo 'root:root' |chpasswd
#Dynamic root password
RUN PASSWD=`pwgen -c -n -1 15`
RUN echo 'root:$PASSWD' |chpasswd
RUN echo 'root password access: $PASSWD' > ~/password.log
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# Supervisor settings for ssl
COPY ./supervisor/supervisor.conf /etc/supervisor/supervisor.conf
RUN chmod 775 /etc/supervisor/*.conf
COPY ./supervisor/ssl.conf /etc/supervisor/conf.d/
RUN chmod 775 /etc/supervisor/conf.d/ssl.conf
# SSL port
EXPOSE 22
# Directory ready
WORKDIR /etc/supervisor
# Supervisor daemon
CMD supervisord -c /etc/supervisor/supervisor.conf
#docker run -d -p 127.0.0.1:50022:22 YOUR_IMAGE_NAME
#ssh root@127.0.0.1 -p 50022
