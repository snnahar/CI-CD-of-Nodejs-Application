FROM node:14

WORKDIR /cicd-project
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000
CMD ["node", "index.js"]