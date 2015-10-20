#Build a docker file
docker build -t krol/oracledb11g .

#run docker file
docker run -it --rm=true -p 1521:1521 -p 8080:8080 krol/oracledb11g /bin/bash 

#run docker daemonized
docker run --name oracledb11gXE -d -p 1521:1521 -p 8080:8080 krol/oracledb11g startup.sh  

Instalation from oracle-xe-11.2.0-1.0.x86_64

http://localhost:8080/apex/f?p=4950:1
user:sys
password:oracle