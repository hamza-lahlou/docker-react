FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <-- all the stuff that we care about

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#--from indicate that we are copying from the previous step
