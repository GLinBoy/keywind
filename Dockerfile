FROM node:18.16.0-alpine3.17 AS builder

WORKDIR /keywind

COPY . .

RUN npm i -g pnpm

RUN pnpm install

RUN pnpm build:jar


FROM quay.io/keycloak/keycloak:21.1.1

COPY --from=builder /keywind/out/keywind.jar /opt/keycloak/providers
