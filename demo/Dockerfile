FROM elixir:1.10.3

ENV TZ 'Asia/Tokyo'
ENV ND_VER '12.x'
ENV PHX_VER '1.5.1'

### install library
RUN set -x  \
  && apt-get update -y   \
  && apt-get install -y   \
      curl  \
      vim  \
      inotify-tools   \
  && curl -sL https://deb.nodesource.com/setup_${ND_VER} | bash - \
  && apt-get install nodejs  -y  \
  && npm install npm@latest -g  \
  && apt-get clean

### Phoenix install
RUN set -x  \
  && mix local.hex --force  \
  && mix local.rebar --force  \
  && mix archive.install hex phx_new ${PHX_VER} --force

### workdir
WORKDIR /proj

CMD ["iex"]

