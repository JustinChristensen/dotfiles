FROM ubuntu:bionic

ARG UBUNTU_USER=wroathe

RUN \ 
# the ubuntu image excludes man pages by default, and we like manpages
rm /etc/dpkg/dpkg.cfg.d/excludes && \
apt-get update -y && \
apt-get install -y \
    clang \
    git \
    make \
    man \
    manpages-dev \
    neovim \
    sudo \
    valgrind && \
useradd -g sudo -s /bin/bash -m -k /root "${UBUNTU_USER}" && \
# allow my dev user to sudo without password
echo "${UBUNTU_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER "${UBUNTU_USER}"
WORKDIR "/home/${UBUNTU_USER}"

# copy config files
COPY .bash_profile .vimrc ./
COPY .vim .vim
COPY init.vim .config/nvim/

RUN \
# quiet login sudo message
touch ~/.sudo_as_admin_successful && \
# install vim plugins
vim --headless +PlugInstall +qall && \
sudo chown -R "${UBUNTU_USER}:sudo" ~

ENTRYPOINT ["bash", "-l"]
