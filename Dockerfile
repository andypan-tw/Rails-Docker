FROM ubuntu:16.04 AS ruby

RUN apt-get update 
RUN apt-get install -y \
            autoconf \
            bison \
            build-essential \
            libssl-dev \
            libyaml-dev \
            libreadline6-dev \
            zlib1g-dev \
            libncurses5-dev \
            libffi-dev \
            libgdbm3 \
            libgdbm-dev \
            git \
            curl \
            vim
RUN apt-get clean

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

# Install ruby
RUN rbenv install 2.3.8
RUN rbenv global 2.3.8


FROM ruby as rails

RUN gem update --system
