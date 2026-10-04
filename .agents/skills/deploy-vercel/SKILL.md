---
name: deploy-vercel
description: Publica e sincroniza automaticamente todas as alterações do projeto Kau Festas com o repositório GitHub e deploy na Vercel via git add, commit e push.
---

# Deploy Kau Festas (GitHub / Vercel)

Quando o usuário pedir para publicar, fazer deploy, subir alterações ou atualizar a Vercel:

1. Execute o comando PowerShell no workspace:
```powershell
git add . ; git commit -m "Atualizacao do site e catalogo" ; git push origin main
```

2. Avise o usuário que as alterações foram enviadas para o GitHub e que a Vercel atualizará o site em https://kau-festas.vercel.app/ em ~1 minuto.
