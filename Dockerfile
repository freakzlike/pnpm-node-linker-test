FROM node:16-alpine

RUN npm install -g pnpm@next --no-audit --no-fund

RUN pnpm config set store-dir /home/node/.pnpm-store

CMD [ "/bin/sh" ]
