FROM node:20-alpine3.20

WORKDIR /tmp

COPY index.js package*.json ./

EXPOSE 3000

RUN apk update && apk add --no-cache bash openssl curl && \
    chmod +x index.js && \
    npm install --omit=dev && \
    npm cache clean --force && \
    rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/bin/npm \
           /usr/local/bin/npx \
           /usr/local/lib/node_modules/corepack \
           /usr/local/bin/corepack \
           /root/.npm

CMD ["node", "index.js"]
