#!/bin/bash

echo "=================================="
echo " NeoVolt Network Discovery v0.1"
echo "=================================="
echo

echo "[+] Endereço IP local:"
hostname -I
echo

echo "[+] Interfaces de rede:"
ip -br addr
echo

echo "[+] Gateway:"
ip route | grep default
echo

echo "[+] Testando conectividade..."
ping -c 4 8.8.8.8

echo
echo "Diagnóstico concluído."
