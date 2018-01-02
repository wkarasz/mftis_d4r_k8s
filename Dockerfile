FROM tibco/bwce:v2.3.1.29
MAINTAINER wkarasz@tibco.com
ADD mftdocker_1.0.2.ear content.zip /
RUN unzip /content.zip -d /content && chmod +x /content/install_prep1.sh && chmod +x /content/install_prep2.sh && chmod +x /content/get_hostname.sh && chmod +x /content/get_ip.sh
EXPOSE 7443 21 22 990 46464 47777 56565