FROM ubuntu:bionic

ARG UBUNTU_USER=wroathe

RUN \ 
apt-get update -y && \
apt-get install -y \
    clang \
    git \
    make \
    neovim \
    valgrind && \
useradd -g sudo -m -s /bin/bash "${UBUNTU_USER}"

USER "${UBUNTU_USER}"
WORKDIR "/home/${UBUNTU_USER}"

COPY .bash_profile .vimrc ~/
COPY plug.vim ~/.vim/autoload/plug.vim 

RUN vim +PlugInstall +qall

