#!/bin/bash

echo "=================================="
echo " NeoVolt Network Discovery v0.2"
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

echo "[+] Dispositivos conhecidos na rede (ARP):"
arp -a 2>/dev/null || echo "Comando arp não disponível."
echo

echo "[+] Tabela de vizinhos:"
ip neigh
echo

echo "[+] Testando conectividade..."
ping -c 4 8.8.8.8
echo

echo "Diagnóstico concluído."