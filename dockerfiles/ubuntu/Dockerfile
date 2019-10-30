FROM ubuntu:bionic

ARG UBUNTU_USER=wroathe
ARG RUBY=ruby-2.6.4
ARG LIBCHECK=check-0.12.0

RUN \ 
# the ubuntu image excludes man pages by default, and we like manpages
rm /etc/dpkg/dpkg.cfg.d/excludes && \
# add repositories
apt-get update -y && \
apt-get install -y --no-install-recommends software-properties-common && \
add-apt-repository -y ppa:neovim-ppa/stable && \
add-apt-repository -y ppa:hvr/ghc && \
# install packages
apt-get update -y && \
apt-get install -y --reinstall --no-install-recommends \
    autotools-dev \
    bash \
    bash-completion \
    cabal-install-2.4 \
    coreutils \
    curl \
    clang-8 \
    gdb \
    ghc-8.6.5 \
    git \
    graphviz \
    graphviz-dev \
    less \
    ltrace \
    make \
    man \
    manpages-dev \
    neovim \
    openssl \
    python3-dev \
    python3-pip \
    sudo \
    strace \
    valgrind && \
# use clang-8 as the system's c compiler
update-alternatives --install /usr/bin/cc cc /usr/bin/clang-8 100 && \
update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-8 100 && \
# add my dev user
useradd -g sudo -s /bin/bash -m -k /root "${UBUNTU_USER}" && \
# allow my dev user to sudo without password
echo "${UBUNTU_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# download sources and verify the shas
COPY sha256sums.txt /
RUN  \
curl -sLO "https://cache.ruby-lang.org/pub/ruby/2.6/${RUBY}.tar.gz" && \
curl -sLO "https://github.com/libcheck/check/releases/download/0.12.0/${LIBCHECK}.tar.gz" && \
sha256sum -c sha256sums.txt && rm sha256sums.txt

# install libcheck from source
RUN \
tar -xzf "${LIBCHECK}.tar.gz" && \
cd "${LIBCHECK}" && \
./configure && make -j8 && make install && \
cd ../ && rm -rf check-*

# install ruby from source
RUN \
apt-get install -y --reinstall --no-install-recommends \
# ruby library dependencies    
    libffi-dev \
    libgdbm-dev \
    libgmp-dev \
    libjemalloc-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline6-dev \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev && \
tar -xzf "${RUBY}.tar.gz" && \
cd "${RUBY}" && \
./configure && make -j8 && make install && \
cd ../ && rm -rf ruby-* 

# neovim dependencies
RUN \
pip3 install -U setuptools wheel && \
pip3 install -U neovim && \
gem install neovim 

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
