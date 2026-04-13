#!/bin/bash

arquivo_config="ip-fixo.cfg"

# Coleta informações do arquivo de configurações.
function coleta_info(){
    local nome="$1"
    local arquivo="$2"
    info=$(grep "^$nome" "$arquivo" | \
            cut -d"=" -f2 | \
            sed "s|^[ \t]*||;s|[ \t]*$||")
    echo $info
}


interface="$(coleta_info "Interface" "$arquivo_config")"
ip="$(coleta_info "IP" $arquivo_config)/$(coleta_info "MASK" $arquivo_config)"
gateway="$(coleta_info "Gateway" "$arquivo_config")"



# Garante que a interface exista.
ip link show "$interface" > /dev/null 2>&1 || exit 0

# Sobe a interface
ip link set "$interface" up

# Remove IPs antigos
ip addr flush dev "$interface"

# Adiciona IP fixo
ip addr add "$ip" dev "$interface"

# Remove rota default antiga (se existir)
ip route del default 2> /dev/null

# Adiciona gateway
ip route add default via "$gateway" dev "$interface"


