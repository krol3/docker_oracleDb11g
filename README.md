#Build a docker file
docker build -t sciensa2/oracle-db11g .
docker build -t krol/oracle-db11g .

#run docker file
docker run -it --rm=true -p 1521:1521 -p 8080:8080 sciensa2/oracle-db11g /bin/bash
docker run -it --rm=true -p 1521:1521 -p 8080:8080 krol/oracle-db11g
docker run -it -p 1521:1521 -p 8080:8080 krol/oracle-db11g /bin/bash

#run docker daemonized
Step1: for ever running bin/bash
docker run --name dbxe11g -p 8080:8080 -p 1521:1521 -itd krol/oracle-db11g /bin/bash

Step2: run inside the container the script
docker exec -it ID_container /dbscritps/startup.sh

Instalation from oracle-xe-11.2.0-1.0.x86_64

http://localhost:8080/apex/f?p=4950:1
user:sys
password:oracle

----------------Create RCU instance -----------------------------------
ofm_rcu_linux_11.1.1.7.0_64_disk1_1of1/rcuHome/bin

#create a new image, without a name
docker commit abcd12345abc
#to apply the TAG and version name
docker tag IMAGE_ID krol/oracle-db11g_rcu:latest
docker tag  df300cafaecb krol/oracle-db11g_rcu:latest

#to run
docker run -it -p 1521:1521 -p 8080:8080 krol/oracle-db11g_rcu:latest /bin/bash

localhost / 1521 / xe /
sys / oracle
role sysdba

PREFIX : DEV
components: SOA and BPM infraestruture *************
BD RCU:
hostname: localhost
port 1521
service name XE
connected ad sys
prefix DEV_XXXXX all schemas
password : oraclercu
same password for all schemas
user: DEV_SOAINFRA
