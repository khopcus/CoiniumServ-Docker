FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ && \
    yum check-update && \
    yum -y update && \
    yum install -y mono-complete && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
#ADD run-httpd.sh /run-httpd.sh
#RUN chmod -v +x /run-httpd.sh

#CMD ["/run-httpd.sh"]
