# 1. reference to builder phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2. reference to run phase
FROM nginx
# copy sth from builder phase
COPY --from=builder /app/build /usr/share/nginx/html