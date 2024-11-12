FROM node:20-alpine
ARG RENDER_GIT_COMMIT

RUN apk --no-cache add curl
RUN npm i -g pnpm@9.12.1

RUN mkdir -p /app
WORKDIR /app

COPY package.json pnpm-lock.yaml /app/

RUN pnpm install --frozen-lockfile
COPY . /app

RUN mkdir ~/.ssh
RUN echo "PermitRootLogin no" > ~/.ssh/config