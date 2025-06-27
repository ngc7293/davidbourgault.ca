FROM alpine:latest AS build

RUN apk add --update hugo

WORKDIR             /build

COPY config.toml /build/config.toml
COPY assets      /build/assets
COPY layouts     /build/layouts
COPY content     /build/content

RUN hugo build --minify

FROM nginx:alpine-slim AS runtime

COPY --from=build /build/public /usr/share/nginx/html