FROM node:18-bookworm-slim

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node package*.json ./

USER node

COPY --chown=node:node . .

RUN npm install

EXPOSE 5173

CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0"]
