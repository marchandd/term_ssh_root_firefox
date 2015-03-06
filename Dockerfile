FROM ubuntu:14.10
MAINTAINER Marchand D. https://github.com/marchandd/term_ssh_root_firefox
ENV VE_version="MarchandD_20150306_v01.01" 
RUN apt-get update && apt-get install -y openssh-server firefox supervisor dbus-x11 pwgen
RUN mkdir /var/run/sshd
# Copy root privileges script from local to ve and run it
COPY ./root_privileges.sh /
RUN chmod 755 /*.sh
RUN bash -c '/root_privileges.sh'
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
