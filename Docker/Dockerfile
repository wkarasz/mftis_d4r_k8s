FROM tibco/bwce:v2.3.2.centos
MAINTAINER wkarasz@tibco.com
ADD content.zip /
RUN unzip /content.zip -d /content && chmod +x /content/install_prep1.sh && chmod +x /content/install_prep2.sh && chmod +x /content/get_hostname.sh && chmod +x /content/get_ip.sh
EXPOSE 7443 21 22 990 46464 47777 56565
ADD mftISdocker_1.0.22.ear /