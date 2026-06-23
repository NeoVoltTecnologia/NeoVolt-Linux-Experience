# Kernel Messages

## Problema

Após selecionar o sistema no GRUB, aparece uma tela preta intermediária contendo mensagens como:

```text
EFI stub: WARNING:
failed to measure data for event
```

Essas mensagens interrompem a experiência visual do NeoVolt Boot Experience.

---

## Estado atual

GRUB_CMDLINE_LINUX_DEFAULT:

```text
quiet splash
```

---

## Objetivo

Fluxo desejado:

GRUB NeoVolt

↓

Plymouth NeoVolt

↓

Tela LUKS NeoVolt

↓

Login NeoVolt

---

## Possíveis causas

- EFI
- TPM
- Secure Boot
- Kernel Linux
- Plymouth

---

## Possíveis parâmetros para investigação

quiet

splash

loglevel=0

systemd.show_status=false

vt.global_cursor_default=0

udev.log_level=0

---

## Estratégia

1. Documentar.
2. Fazer backup.
3. Alterar um parâmetro por vez.
4. Executar update-grub.
5. Reiniciar.
6. Registrar screenshots.
7. Registrar resultados.

---

## Regra

Nenhuma alteração será aplicada sem:

- backup;
- commit no GitHub;
- possibilidade de rollback.