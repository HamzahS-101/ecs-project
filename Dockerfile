FROM node:22-alpine AS build 

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build

FROM node:22-alpine 

WORKDIR /app

RUN yarn global add serve

COPY --from=build /app /app

EXPOSE 3000

CMD ["serve", "-s", "build"]