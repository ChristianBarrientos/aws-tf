FROM node:10-alpine
RUN mkdir -p /app-back && chown -R node:node /app-back
WORKDIR /app-back
COPY package*.json ./
USER node
RUN npm install
ENV DB_MONGO=mongodb+srv://root:oj8YDLJbUlQKicge@cluster0-ker89.mongodb.net/mascoteros

COPY --chown=node:node . .
EXPOSE 4000
CMD [ "node", "index.js" ]