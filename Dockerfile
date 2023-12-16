FROM elixir:1.15.7-alpine as builder

WORKDIR /todo_trek

ENV MIX_ENV prod

RUN apk add --update --no-cache bash git openssh openssl

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config
COPY assets assets
COPY priv priv
COPY lib lib

RUN apk add --update --no-cache --virtual .gyp g++ make
RUN mix do deps.get --only ${MIX_ENV}, deps.compile
ENV PATH="/root/.mix/escripts:${PATH}"

WORKDIR /todo_trek
RUN mix assets.deploy

RUN mix release todo_trek

# Run Release
FROM alpine:latest

RUN apk add --update --no-cache bash openssl postgresql-client libstdc++

ENV MIX_ENV prod

EXPOSE 5000

WORKDIR /todo_trek
COPY --from=builder /todo_trek/dist/ .

HEALTHCHECK CMD curl --fail http://localhost:4000/ || exit 1

CMD ["sh", "-c", "/todo_trek/bin/todo_trek start"]
