FROM node:latest
ARG npm_token

WORKDIR /usr/local/app

RUN npm config set registry "https://npm.ltvops.com"
RUN npm config set //npm.ltvops.com/:_authToken=${npm_token}

COPY package*.json .

RUN npm ci

COPY . .

RUN npm run build

CMD ["node", "dist/index.js"]
