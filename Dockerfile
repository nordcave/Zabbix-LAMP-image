FROM ubuntu:18.04
LABEL maintainer="nordcave"
COPY . /server_build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN chmod -R +x server_build/

RUN /server_build/preconfig.sh
RUN /server_build/lamp-utils.sh
RUN /server_build/zabbix.sh

CMD /server_build/postconfig.sh