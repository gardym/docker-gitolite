FROM ubuntu

MAINTAINER Mike Gardiner <conversationing@gmail.com>

RUN apt-get update

RUN apt-get -y install sudo
RUN apt-get -y install openssh-server
RUN apt-get -y install git

RUN mkdir /var/run/sshd

RUN adduser --system --group --shell /bin/sh git
RUN su git -c "mkdir /home/git/bin"

ADD id_rsa.pub /home/git/id_rsa.pub

RUN cd /home/git; su git -c "git clone git://github.com/sitaramc/gitolite";
RUN cd /home/git; su git -c "gitolite/install -ln";\
RUN cd /home/git; su git -c "bin/gitolite setup -pk id_rsa.pub"

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

EXPOSE 22
