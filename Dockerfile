FROM node:20-alpine

# Instala o socat
RUN apk add --no-cache socat

WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do Node.js
RUN npm install

# Expõe a porta do painel (se houver)
EXPOSE 3000

# Inicia o proxy TCP e o server.js
CMD sh -c "socat TCP-LISTEN:50000,fork,reuseaddr TCP:jogar.rederevo.com:25565 & node server.js"
