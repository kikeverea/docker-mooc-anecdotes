FROM ubuntu

WORKDIR /usr/src/app

RUN apt update

RUN apt install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt install -y nodejs

COPY package* .

RUN npm install
RUN npm install -g serve

COPY . .

RUN npm run build

EXPOSE 5001

CMD ["serve", "-s", "-l", "5001", "build"]
