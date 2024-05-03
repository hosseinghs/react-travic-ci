# build phase
FROM node:16-alpine as builder

WORKDIR /app

COPY package.json ./

RUN npm install

COPY ./ ./

CMD ["npm", "run", "start"]

# run phase
FROM nginx

# copy the build files from builder phase
COPY --from=builder /app/build /usr/share/nginx/html