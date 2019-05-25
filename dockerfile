FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install
# If you are building your code for production
RUN npm ci --only=production


# Bundle app source
COPY . .

RUN npm run build

EXPOSE 3100
CMD [ "npm", "run", "serve" ]