FROM node:slim

WORKDIR /nodejs 
COPY package*.json ./

RUN npm install express

COPY . .

EXPOSE 3000
CMD ["node", "index.js"]