FROM ubuntu:20.04

#Definindo o responsável pela aplicação :
LABEL maintainer="Iran Filho"

#Copiar o script para o contêiner :
RUN echo "[ ***** ***** ***** ] ➔ Copying files to Image ***** ***** ***** "
COPY script.sh /usr/local/bin/script.sh

#Permissão de execução para o script :
RUN chmod +x /usr/local/bin/script.sh

#Instalar os programas necessários no contêiner :
RUN echo "[ ***** ***** ***** ] ➔ Installing ***** ***** ***** "
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    traceroute \
    nano \
    git

#Executar o script ao iniciar o contêiner :
CMD ["/usr/local/bin/script.sh"]