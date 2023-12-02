#!/bin/bash

<<'--COMENTARIO--'
Certifique-se de ter o curl e, opcionalmente, o jq instalados para executar este script. O jq é utilizado para processar a resposta JSON obtida pelo curl e extrair o endereço IP.

Se você estiver usando um sistema operacional Linux, pode salvar esse script em um arquivo, dar permissão de execução com chmod +x nome-do-script.sh e depois executá-lo com ./nome-do-script.sh. Se estiver em um ambiente Unix ou macOS, o processo é semelhante.
--COMENTARIO--

## sudo apt install curl
## sudo apt-get install jq
## sudo apt-get install inetutils-traceroute

# Função para verificar e instalar programas necessários em sistemas Ubuntu :
install_program_ubuntu() {
    program=$1
    if ! command -v $program &> /dev/null; then
        echo "Instalando $program..."
        sudo apt-get update
        sudo apt-get install -y $program
    fi
}

# 3.5 Certifique-se de instalar os programas curl, jq, traceroute necessários :
install_program_ubuntu "curl"
install_program_ubuntu "jq"
install_program_ubuntu "inetutils-traceroute"

# 3.1 Imprimir no console utilizando variável de ambiente o nome do usuário atual da máquina :
echo "··············································"
            echo "———————————————————————————————————"
            echo "•→ Usuário atual: «$USER» ←•"
            echo "———————————————————————————————————"

# 3.2 Imprimir a data e horário no formato "%Y-%m-%d %H:%M:%S" :
            echo "———————————————————————————————————"
            echo "•→ Data e Horário: «$(date +'%Y-%m-%d %H:%M:%S')» ←•"
            echo "———————————————————————————————————"

# 3.3 Usando o curl, imprima na tela o endereço ip da máquina :
##ip_address_external=$(curl -s https://api64.ipify.org?format=json | jq -r '.ip')
ip_address_external=$(curl -s ifconfig.me)
            echo "———————————————————————————————————"
            echo "•→ Endereço IP externo da máquina: «$ip_address_external» ←•"
            echo "———————————————————————————————————"

ip_address_internal=$(ip addr show dev eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
            echo "———————————————————————————————————"
            echo "•→ Endereço IP interno da máquina: «$ip_address_internal» ←•"
            echo "———————————————————————————————————"

# 3.4 Usando um comando de “rastreamento” de rota, imprima na tela o rastreamento da rota entre a máquina e google.com :
traceroute google.com
echo "·············································➔ ¯\_(ツ)_/¯"
