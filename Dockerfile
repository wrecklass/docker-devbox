## DevBox
## Running Ubuntu 16.04 (Wheezy)
FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y mercurial
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y ruby
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y strace
RUN apt-get install -y diffstat
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump
RUN apt-get install -y tmux
# Install go
RUN curl https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz | tar -C /usr/local -zx

ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH
# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev:dev /home/dev
RUN mkdir -p /home/dev/go /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib
ENV GOPATH /home/dev/go
# $GOPATH

# RUN go get github.com/dotcloud/gordon/pulls
# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared
WORKDIR /home/dev
ENV HOME /home/dev
ADD vimrc /home/dev/.vimrc
ADD vim /home/dev/.vim
ADD bash_profile /home/dev/.bash_profile
ADD bash_prompt /home/dev/.bash_prompt
ADD bash_aliases /home/dev/.bash_aliases
ADD gitconfig /home/dev/.gitconfig
ADD bashrc /home/dev/.bashrc
ADD inputrc /home/dev/.inputrc
ADD functions /home/dev/.functions
ADD shenv /home/dev/.shenv

# Link in shared parts of the home directory
RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.bash_history
RUN ln -s /var/shared/.maintainercfg
RUN chown -R dev:dev /home/dev
USER dev
CMD /bin/bash
