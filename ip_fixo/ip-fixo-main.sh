#!/bin/bash

# Source Code
source ./ip-dns.sh



pasta_config="/etc/ip-fixo"
arquivo_config="ip-fixo.cfg"


# Cria uma pasta de configuração.
if [ ! -d $pasta_config ]; then
    mkdir -p $pasta_config
fi

# Copia o arquivo de configuração para a pasta de configuração.
if [ -f $arquivo_config ]; then
    cp $arquivo_config $pasta_config
else
    echo "Erro: Arquivo $arquivo_config, não existe!"
    exit 1
fi

