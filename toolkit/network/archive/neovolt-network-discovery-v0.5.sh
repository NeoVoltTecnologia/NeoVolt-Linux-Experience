#!/bin/bash

echo "=================================="
echo " NeoVolt Network Discovery v0.5"
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

    SCAN=$(nmap -Pn -p 22,80,443,554,8000,37777,3389 "$HOST")
    echo "$SCAN"

    HAS_22=$(echo "$SCAN" | grep -q "22/tcp.*open" && echo "yes")
    HAS_80=$(echo "$SCAN" | grep -q "80/tcp.*open" && echo "yes")
    HAS_443=$(echo "$SCAN" | grep -q "443/tcp.*open" && echo "yes")
    HAS_554=$(echo "$SCAN" | grep -q "554/tcp.*open" && echo "yes")
    HAS_8000=$(echo "$SCAN" | grep -q "8000/tcp.*open" && echo "yes")
    HAS_37777=$(echo "$SCAN" | grep -q "37777/tcp.*open" && echo "yes")
    HAS_3389=$(echo "$SCAN" | grep -q "3389/tcp.*open" && echo "yes")

    echo
    echo "[+] Classificação NeoVolt:"

    if [ "$HAS_8000" = "yes" ] && [ "$HAS_554" = "yes" ]; then
        echo "Possível equipamento Hikvision / NVR / DVR"
    elif [ "$HAS_37777" = "yes" ] && [ "$HAS_554" = "yes" ]; then
        echo "Possível equipamento Dahua / NVR / DVR"
    elif [ "$HAS_554" = "yes" ] && { [ "$HAS_80" = "yes" ] || [ "$HAS_443" = "yes" ]; }; then
        echo "Possível câmera IP / stream RTSP"
    elif [ "$HAS_80" = "yes" ] || [ "$HAS_443" = "yes" ]; then
        echo "Possível roteador, DVR, NVR ou interface web"
    elif [ "$HAS_3389" = "yes" ]; then
        echo "Possível computador Windows com RDP"
    elif [ "$HAS_22" = "yes" ]; then
        echo "Possível equipamento Linux/SSH ou dispositivo de rede"
    else
        echo "Dispositivo ativo sem serviço identificado nas portas verificadas"
    fi

    echo
done

echo "[+] Diagnóstico concluído."