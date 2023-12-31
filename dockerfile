FROM node:alpine

RUN mkdir /app
# Crea un directorio de trabajo
WORKDIR /app

# Copia el repositorio local al directorio de trabajo en la imagen
COPY . /app

# Cuidado puede dar error por la instalacio, al ser alpine puede ser apk.
# Instalamos docker, node y kubernetes
RUN apt-get update && \
    apt-get install -y docker.io kubectl && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    NODE_MAJOR=20\
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list\
    sudo apt-get update && sudo apt-get install nodejs -y\
    npm install


# Exponer el puerto 5000
EXPOSE 5000



