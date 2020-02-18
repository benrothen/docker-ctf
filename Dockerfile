FROM ubuntu:18.04
# basic environment
ENV LC_CTYPE C.UTF-8

# disable user-prompts for build
ARG DEBIAN_FRONTEND=noninteractive
# enable multiarch for 32bit support
RUN dpkg --add-architecture i386 && apt-get update

# install basicsi, debugging, sys tools, and build essentials
RUN apt-get update && apt-get install -y vim \
    curl \
    less \
    wget \
    git \
    netcat \
    socat \
    dnsutils \
    net-tools \
    nmap \
    binwalk \
    gdb \
    gdb-multiarch \
    ltrace \
    strace \
    procps \
    jq \
    build-essential \
    gcc-multilib \
    nasm \
    libssl-dev \
    libffi-dev \
    libpcre3-dev \
    libdb-dev \
    libxt-dev \
    libxaw7-dev \
#    libc6:i386 \
#    libncurses5:i386 \
#    libstdc++6:i386 \
    python \
    python3 \
    python-pip \
    python3-pip \
    python3-dev \
    ruby \
    ruby-dev \
    rubygems \
    && apt-get clean

# python & ruby packages 
RUN pip install capstone \ 
    requests \
    pwntools \
    r2pipe \
    angr
RUN pip3 install pwntools \
    keystone-engine \
    unicorn \
    capstone \
    ropper
RUN gem install one_gadget \
    seccomp-tools

# other tools from github
RUN mkdir tools && cd tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && \
cd .. && git clone https://github.com/niklasb/libc-database && cd libc-database && ./get

