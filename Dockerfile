FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json ..

RUN apt update -y && apt upgrade -y && npm i && apt install ffmpeg -y && apt install imagemagick -y

COPY . .

EXPOSE 5000

CMD ["npm", "start", "--server"]
