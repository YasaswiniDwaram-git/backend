FROM node:20 AS builder
WORKDIR /opt/server
COPY *.js .
COPY package.json .
RUN npm install


FROM node:20.18.0-alpine3.20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN addgroup -S expense && \
    adduser -S expense && \
    mkdir /opt/server
WORKDIR /opt/server
COPY --from=builder /opt/server /opt/server
USER expense
CMD ["nodejs" , "index.js"]