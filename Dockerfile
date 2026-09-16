FROM node:lts-buster
USER root
RUN apt-get update && apt-get install -y ffmpeg webp git && rm -rf /var/lib/apt/lists/*
WORKDIR /home/node/HASSAN-MD
COPY --chown=node:node . .
USER node
RUN yarn install --network-concurrency 1
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
