#!/bin/bash

# Arquivo de configurações DDNS.
arquivo_ddns="./ip-fixo.cfg"

# Coleta os DNS no arquivo de configuração e retorna.
function coleta_dns(){
    local dns=$(grep "^DNS" $arquivo_ddns | cut -d= -f2 | tr "," " ")
    echo $dns
}


