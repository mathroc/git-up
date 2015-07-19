FROM debian:jessie

RUN apt-get update && apt-get install -y curl git-core
RUN useradd -m karin

USER karin
WORKDIR /home/karin
RUN git config --global user.email "karin@herocorp.fr" && git config --global user.name "Captain Sports Extrêmes"

ADD tests/containers/workstation.id_rsa.pub /home/karin/.ssh/id_rsa.pub
ADD tests/containers/workstation.id_rsa /home/karin/.ssh/id_rsa
ADD bin/setup /tmp/setup

RUN /tmp/setup
