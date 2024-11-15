FROM bitwalker/alpine-elixir-phoenix:1.10.3

WORKDIR /code

COPY bin .

RUN mix do deps.get, deps.compile

RUN npm install --prefix ./assets

CMD ["mix", "phx.server"]
