FROM httpd:2.4

MAINTAINER Sergey <sergey@ml1000.net>
 
ARG WEB_USER
ARG WEB_GROUP
ARG APACHE_DIR

RUN useradd -m user && \
        echo "user:user" | chpasswd && \
        usermod --shell /bin/bash user && \
        usermod -aG sudo user && \
        mkdir /etc/sudoers.d && \
        echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/user && \
        chmod 0440 /etc/sudoers.d/user && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 user && \
        groupmod --gid 1000 user
 
#COPY httpd-vhosts.conf ${APACHE_ROOT_DIR}/conf/extra/httpd-vhosts.conf
#COPY httpd.conf ${APACHE_ROOT_DIR}/conf/httpd.conf
 
#RUN chgrp -R ${WEB_GROUP} ${APACHE_ROOT_DIR}/conf/httpd.conf \
# && chgrp -R ${WEB_GROUP} ${APACHE_ROOT_DIR}/conf/extra/httpd-vhosts.conf \
# && mkdir -p ${APACHE_ROOT_DIR}/htdocs/public
 
RUN usermod -u 1000 ${WEB_USER} \
 && groupmod -g 1000 ${WEB_GROUP} \
 && chgrp -R ${WEB_GROUP} ${APACHE_DIR}
