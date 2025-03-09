FROM node:23.8.0-alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app

RUN mkdir /app/output && touch /app/output/tailwind.css

RUN npm install tailwindcss @tailwindcss/cli

CMD ["tailwindcss", "--help"]
