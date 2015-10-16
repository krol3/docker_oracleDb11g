Build a docker file
docker build -t krol/oracledb11g .

docker run -i -t -p 1521:1521 -p 8080:8080 krol/oracledb11g

Instalation from oracle-xe-11.2.0-1.0.x86_64.rpm
