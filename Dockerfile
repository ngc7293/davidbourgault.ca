FROM blang/latex:latest AS build-cv

COPY /src/cv    /data/
RUN pdflatex davidbourgault.en
RUN pdflatex davidbourgault.fr

FROM node:alpine AS build-vue

WORKDIR             /workspace
COPY package.json   /workspace/package.json
RUN npm install

COPY public         /workspace/public
COPY --from=build-cv /data/davidbourgault.en.pdf /workspace/public/davidbourgault.en.pdf
COPY --from=build-cv /data/davidbourgault.fr.pdf /workspace/public/davidbourgault.fr.pdf

COPY vite.config.js /workspace/vite.config.js
COPY src            /workspace/src
COPY index.html     /workspace/index.html

RUN npm run build

FROM nginx:alpine AS runtime

COPY --from=build-vue /workspace/dist /usr/share/nginx/html