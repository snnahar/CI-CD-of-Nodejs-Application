FROM node:14

WORKDIR /cicd-project
COPY package*.json ./

RUN npm install

COPY . .

CMD ["node", "index.js"]