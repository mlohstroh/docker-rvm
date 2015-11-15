FROM ubuntu:14.04

USER root

RUN apt-get update -qq && apt-get install -y autoconf bison build-essential \
       libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
      libncurses5-dev libffi-dev libgdbm3 libgdbm-dev \
      curl

RUN useradd -m playful -G sudo,staff

RUN echo "playful ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER playful

RUN command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN sudo curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.3 --gems=bundler
ENV PATH /home/playful/.rvm/bin:/home/playful/.rvm/rubies/ruby2.2.3/bin:$PATH