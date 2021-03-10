FROM debian:buster

RUN apt-get update && apt-get install -y cups wget
WORKDIR /install
RUN wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-C4010ND/uld_V1.00.39_01.17.tar.gz && \
    tar -xzvf uld_V1.00.39_01.17.tar.gz && \
    SKIP_EULA_PAGER=TRUE AGREE_EULA="Y" ./uld/install.sh
CMD cupsd -f
