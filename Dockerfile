FROM ubuntu:latest

# Maintainer
# ----------
MAINTAINER Carolina Guillen <guillen.carolina@gmail.com>

#root
RUN echo "root:root" | chpasswd

RUN mkdir /dbscritps
ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

WORKDIR /dbscritps/
ENTRYPOINT ["/dbscritps/startup.sh"] 

