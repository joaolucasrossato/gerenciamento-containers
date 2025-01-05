#!/bin/bash

lista_container(){
    echo "Ativos"
    docker ps

    echo "\n Inativos"
    docker ps -a

    printf "Listagem Completa."
}

criar_container(){
    read -p "Imagem: " IMAGEM
    docker run -d "$IMAGEM"

    printf "Container criado.\n"
}

parar_container(){
    read -p "Informe o ID do container: " CONTAINER
    docker stop "$CONTAINER"
    
    printf "$CONTAINER parado.\n"
}

remover_container(){
    read -p "Informe o ID do container: " CONTAINER
    docker rm "$CONTAINER"

    printf "$CONTAINER removido.\n"
}

reiniciar_container(){
    read -p "Informe o ID do container: " CONTAINER
    docker restart "$CONTAINER"

    printf "$CONTAINER reiniciado.\n"
}

while true; do
    echo "1. Listar Containers"
    echo "2. Criar Container"
    echo "3. Parar Container"
    echo "4. Remover Container"
    echo "5. Reiniciar Container"
    echo "6. Sair"
    read -p "Opção: " OP

    case $OP in
        1) lista_container ;; 
        2) criar_container ;;
        3) parar_container ;;
        4) remover_container ;;
        5) reiniciar_container ;;
        6) printf "Encerrado."; 
        break ;;
    esac
done