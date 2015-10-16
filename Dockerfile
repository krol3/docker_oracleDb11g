FROM oraclelinux:7

# Maintainer
# ----------
#https://github.com/madhead/docker-oracle-xe
MAINTAINER Carolina Guillen <guillen.carolina@gmail.com>

#root
RUN echo "root:root" | chpasswd

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV ORACLE_DB_RPM oracle-xe-11.2.0-1.0.x86_64.rpm

RUN yum -y install net-tools

WORKDIR /u01
USER root

# Pre-requirements
RUN yum install -y libaio bc; \
    yum clean all; \
	yum install -y dos2unix;

# Install Oracle XE
ADD install/$ORACLE_DB_RPM /tmp/
RUN yum localinstall -y /tmp/$ORACLE_DB_RPM; \
    rm -rf /tmp/$ORACLE_DB_RPM

# Configure instance
ADD config/DB11-start.sh config/xe.rsp config/init.ora config/initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/
RUN chown oracle:dba /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
RUN chmod 755        /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID  XE
ENV PATH        $ORACLE_HOME/bin:$PATH

RUN /etc/init.d/oracle-xe configure responseFile=/u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp

# Run script update HOST to DB
ADD config/DB11-start.sh /db-scripts/
RUN dos2unix -o /db-scripts/DB11-start.sh
RUN chmod 0755 /db-scripts/DB11-start.sh
WORKDIR /db-scripts
CMD bash -C '/db-scripts/DB11-start.sh';'bash'

ENV PATH        $ORACLE_HOME/bin:$PATH:/u01/app/oracle/product/11.2.0/xe/bin:/u01/

EXPOSE 1521

#setting environment XE SqlPlus - http://www.davidghedini.com/pg/entry/install_oracle_11g_xe_on
#cd /u01/app/oracle/product/11.2.0/xe/bin 
#. ./oracle_env.sh
# execute start.sh manualmente

# cleanup
RUN rm -rf /var/tmp/install/*
RUN rm -rf /var/tmp/*
RUN rm -rf /tmp/*