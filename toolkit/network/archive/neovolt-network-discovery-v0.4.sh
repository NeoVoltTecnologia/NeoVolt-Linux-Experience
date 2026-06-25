#!/bin/bash

echo "=================================="
echo " NeoVolt Network Discovery v0.4"
echo "=================================="
echo

echo "[+] Endereço IP local:"
hostname -I
echo

NETWORK=$(ip route | grep kernel | grep src | head -n1 | awk '{print $1}')

if [ -z "$NETWORK" ]; then
    echo "[!] Não foi possível detectar a rede."
    exit 1
fi

echo "[+] Rede detectada: $NETWORK"
echo

echo "[+] Descobrindo hosts ativos..."
HOSTS=$(nmap -sn "$NETWORK" | awk '/Nmap scan report/{print $NF}' | tr -d '()')

echo

for HOST in $HOSTS
do
    echo "=================================="
    echo " Host: $HOST"
    echo "=================================="

    nmap -Pn \
    -p 22,80,443,554,8000,37777,3389 \
    "$HOST"

    echo
done

echo "[+] Diagnóstico concluído."