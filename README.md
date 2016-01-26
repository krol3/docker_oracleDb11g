#Build a docker file
docker build -t sciensa2/oracle-db11g .
docker build -t krol/oracle-db11g .

#run docker file
docker run -it --rm=true -p 1521:1521 -p 8080:8080 sciensa2/oracle-db11g /bin/bash 

docker run -it --rm=true -p 1521:1521 -p 8080:8080 krol/oracle-db11g 

#run docker daemonized
docker run --name dbxe11g -p 8080:8080 -p 1521:1521 -itd krol/oracle-db11g /bin/bash 

docker exec -it ID_container /dbscritps/startup.sh 

Instalation from oracle-xe-11.2.0-1.0.x86_64

http://localhost:8080/apex/f?p=4950:1
user:sys
password:oracle
