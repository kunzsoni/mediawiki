FROM commonimage
RUN yum install -y wget 
RUN useradd mediawiki
USER mediawiki
RUN  cd $HOME && wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.2.tar.gz &&  wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.2.tar.gz.sig #&& gpg --verify mediawiki-1.36.2.tar.gz.sig mediawiki-1.36.2.tar.gz
USER root
RUN cd /opt/rh/httpd24/root/var/www/html && tar -zxf /home/mediawiki/mediawiki-1.36.2.tar.gz && ln -s mediawiki-1.36.2/ mediawiki 
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/rh/httpd24/root/usr/lib64
EXPOSE 80
CMD ["/opt/rh/httpd24/root/usr/sbin/httpd","-D","FOREGROUND"]
