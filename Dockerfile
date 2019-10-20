ARG centos_version=7
FROM centos:${centos_version}

ENV REFRESHED_AT=2018-08-16 \
    LANG=en_US.UTF-8 \
    HOME=/opt/build \
    TERM=xterm

WORKDIR /opt/build

ENV HOME /root

RUN \
  yum -y groupinstall "Development Tools" && \
  yum -y install gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git && \
  yum -y install wget && \
  yum -y install epel-release && \
  yum -y install unzip && \
  yum -y install npm

# Install asdf
RUN \
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2 && \
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Install asdf-elixir and erlanf plugins
RUN \
  /bin/bash -i -c 'asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git' && \
  /bin/bash -i -c 'asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git'

# Install Elixir and Erlang versions required by the project
COPY .tool-versions /opt/build
RUN \
  /bin/bash -i -c 'asdf install'


