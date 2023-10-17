FROM node:20-bullseye-slim as build
ARG npm_token

WORKDIR /usr/local/app

RUN npm config set registry "https://npm.ltvops.com"
RUN npm config set //npm.ltvops.com/:_authToken=${npm_token}

COPY package*.json .

RUN npm ci

COPY . .

RUN npm run build

FROM node:20-bullseye-slim
ARG npm_token

WORKDIR /usr/local/app

COPY --from=build /usr/local/app/dist ./dist
COPY --from=build /usr/local/app/package*.json ./

RUN npm config set registry "https://npm.ltvops.com"
RUN npm config set //npm.ltvops.com/:_authToken=${npm_token}

RUN npm ci --only=prod

CMD ["node", "dist/index.js"]
