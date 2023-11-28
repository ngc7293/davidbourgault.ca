FROM blang/latex:latest AS cv

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y texlive-full

WORKDIR         /cv
COPY /src/cv    /cv
RUN pdflatex davidbourgault.en
RUN pdflatex davidbourgault.fr

FROM node:alpine AS build

WORKDIR             /workspace
COPY package.json   /workspace/package.json
RUN npm install

COPY --from=cv /cv/*.pdf  /workspace/public/

COPY public         /workspace/public
COPY vite.config.js /workspace/vite.config.js
COPY src            /workspace/src
COPY index.html     /workspace/index.html

RUN npm run build

FROM nginx:alpine AS runtime

COPY --from=build /workspace/dist /usr/share/nginx/html