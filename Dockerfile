FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine
COPY --from=builder /app/dist/mean-stack ./
CMD node server/server.mjs
EXPOSE 4000

