# Base Image
FROM node:20.17.0-alpine3.19

WORKDIR /home/app/

COPY package*.json .
RUN npm install

# Copying the source code to docker image
COPY index.js index.js

COPY Dockerfile Dockerfile

ENV PORT=8000
EXPOSE 8000

CMD [ "npm", "start" ]




# FROM node:20-alpine3.19 as base


# # Stage 1: Build Stuff
# FROM base as builder

# WORKDIR /home/build

# COPY package*.json .
# COPY tsconfig.json .

# RUN npm install

# COPY src/ src/

# RUN npm run build

# # Stage 2: Runner
# FROM base as runner

# WORKDIR /home/app

# COPY --from=builder /home/build/dist dist/
# COPY --from=builder /home/build/package*.json .

# RUN npm install --omit=dev

# RUN addgroup --system --gid 1001 nodejs
# RUN adduser --system --uid 1001 nodejs

# USER nodejs


# EXPOSE 8000
# ENV PORT=8000

# CMD [ "npm", "start" ]