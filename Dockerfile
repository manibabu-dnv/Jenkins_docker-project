# syntax=docker/dockerfile:1
FROM node:lts-alpine

WORKDIR /app

# Copy your CA certificate into the image
COPY my-ca.crt /usr/local/share/ca-certificates/my-ca.crt

# Update CA certificates inside the image
RUN apk add --no-cache ca-certificates && update-ca-certificates

# Tell Node.js to use the extra CA certs
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/my-ca.crt

COPY . .

RUN yarn install --production

EXPOSE 3000

CMD ["node", "src/index.js"]
