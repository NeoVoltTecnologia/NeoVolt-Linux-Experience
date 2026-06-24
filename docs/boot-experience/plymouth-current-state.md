# Plymouth Current State

## Resultado da investigação

O Plymouth está instalado e presente no initramfs.

## Tema padrão antes dos testes

Arquivo:

```text
/usr/share/plymouth/themes/default.plymouth
```

Apontava para:

```text
/etc/alternatives/default.plymouth
```

Tema identificado:

```text
Mint Logo
```

## Tema NeoVolt existente

Diretório:

```text
/usr/share/plymouth/themes/neovolt
```

Arquivos encontrados:

```text
background.png
neovolt.plymouth
neovolt.script
```

## Teste realizado

O tema NeoVolt foi registrado nas alternativas do Plymouth e ativado manualmente.

Depois foi executado:

```bash
sudo update-initramfs -u
```

## Resultado

O Plymouth NeoVolt carregou, porém após os testes o sistema apresentou falha de login para usuários não privilegiados.

Mensagem observada:

```text
System is booting up. Unprivileged users are not permitted to log in yet.
```

O problema impedia:

* Login pelo LightDM
* Login automático
* Login via TTY para usuários comuns

## Investigação

Foram verificados:

* LightDM
* systemd-logind
* polkit
* accounts-daemon
* Cinnamon Desktop

Todos os serviços principais estavam operacionais.

A causa identificada foi a permanência indevida do arquivo:

```text
/run/nologin
```

que bloqueava a autenticação de usuários comuns.

## Recuperação

O sistema foi iniciado em Recovery Mode.

Foi executado:

```bash
rm -f /run/nologin
systemctl daemon-reexec
reboot
```

## Validação

Após a recuperação foi confirmado:

* GRUB NeoVolt funcionando
* Dual Boot funcionando
* Tela LUKS funcionando
* LightDM ativo
* Cinnamon carregando normalmente
* Login automático funcionando
* Nenhuma unidade falha em `systemctl --failed`

## Status Atual

Sistema operacional estável.

Tema Plymouth NeoVolt mantido apenas para estudos e desenvolvimento.

Tema ativo do sistema restaurado para o padrão estável do Linux Mint.

## Próximos Passos

Criar Plymouth NeoVolt v2 baseado no tema estável Mint Logo, substituindo apenas:

* Logotipo
* Imagens
* Cores
* Textos

Evitar alterações estruturais no mecanismo de inicialização até a conclusão dos testes em ambiente controlado.
