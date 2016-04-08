# development machine
#
# VERSION: see `TAG`
FROM ubuntu:15.10
MAINTAINER BaseBoxOrg "developer@hostname.io"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        linux-headers-generic \
        software-properties-common \
    && add-apt-repository -y ppa:fcwu-tw/ppa \
    && apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        build-essential \
        locales \
        git \
        curl \
        zsh \
        openssl \
        sudo

# prepare locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen --purge --lang en_US \
    && locale-gen
ENV LANG en_US.utf8

# create docker group and app user
RUN groupadd -g 999 docker \
    && useradd \
        -G sudo,docker \
        -d /home/dev \
        -m \
        -p $(openssl passwd 123app4) \
        -s $(which zsh) \
        dev
USER dev

# prepare home dir
ENV HOME /home/dev
RUN mkdir -p $HOME/data

# install iojs


# install golang

# clone dotfiles


# link to home


# install vim bundles


# install oh-my-zsh


# install docker-compose


# conf container
ENV TERM xterm-256color
VOLUME ["/home/dev/data"]
WORKDIR /home/dev/
CMD ["/usr/bin/zsh"]
