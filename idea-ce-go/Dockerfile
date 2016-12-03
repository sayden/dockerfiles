FROM golang:latest
MAINTAINER mariocaster@gmail.com

RUN apt-get update && apt-get install -y \
  ca-certificates \
  wget \
  libxext6 \
  libxtst6 \
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

RUN wget https://download.jetbrains.com/idea/ideaIC-2016.3.tar.gz

RUN mkdir idea && \
    tar -xf ideaIC-2016.3.tar.gz -C idea --strip-components=1 && \
    rm ideaIC-2016.3.tar.gz

RUN wget "http://plugins.jetbrains.com/plugin/download?pr=idea_ce&updateId=30425" -O go-plugin.zip && \
    unzip go-plugin.zip -d /app/idea/plugins

RUN wget "http://plugins.jetbrains.com/plugin/download?pr=idea_ce&updateId=30382" -O acejump-plugin.zip && \
    unzip acejump-plugin.zip -d /app/idea/plugins

WORKDIR $HOME
USER user

RUN mkdir $HOME/workspace

ENTRYPOINT ["/bin/bash"]

CMD ["/app/idea/bin/idea.sh"]