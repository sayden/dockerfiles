# DESCRIPTION: 
#     Create Franz container with its dependencies. 
#     It doesn't download latest version but a fixed one.
#
# AUTHOR: 
#     Mario Castro <mariocaster@gmail.com>
#
# USAGE:
#     Build Franz image
#     docker build -t franz:4.0.4 .
#
# ISSUES:
#     # No protocol specified
#     Run xhost local:root or xhost +

FROM debian:stretch
MAINTAINER mariocaster@gmail.com

RUN apt-get update && apt-get install -y \
  ca-certificates \
  wget \
  libxext6 \
  libxtst6 \
  libxss1 \
  gconf2 \
  libnss3 \
  curl \
  dirmngr \
  gnupg \
  libasound2 \
  libdbus-glib-1-2 \
  libgtk2.0-0 \
  libxrender1 \
  libxt6 \
  xz-utils \
  unzip \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
  && chown -R user:user $HOME

RUN mkdir /app

WORKDIR /app

RUN wget https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz

RUN mkdir franz && \
    tar -xf Franz-linux-x64-4.0.4.tgz -C franz && \
    rm Franz-linux-x64-4.0.4.tgz

WORKDIR $HOME
USER user

CMD ["/app/franz/Franz"]