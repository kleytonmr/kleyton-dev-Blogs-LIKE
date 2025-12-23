# 🔧 Resolver Erro 404 do CSS

## ❌ Problema
O CSS retorna 404: `GET https://kleytonmr.github.io/Blogs-Like/assets/css/main.css net::ERR_ABORTED 404`

## ✅ Solução Passo a Passo

### 1. Fazer commit e push da mudança atual

```bash
git commit -m "Forçar novo deploy do CSS"
git push origin main
```

### 2. Verificar GitHub Actions

1. Acesse: https://github.com/kleytonmr/Blogs-Like/actions
2. Verifique se há um workflow rodando ou que completou recentemente
3. Se houver erro, clique no workflow e veja os logs

### 3. **IMPORTANTE: Reconfigurar GitHub Pages**

Após renomear o repositório, o GitHub Pages precisa ser reconfigurado:

1. Acesse: https://github.com/kleytonmr/Blogs-Like/settings/pages
2. Verifique a seção **"Source"**:
   - Se estiver como **"Deploy from a branch"**, mude para **"GitHub Actions"**
   - Se já estiver como **"GitHub Actions"**, clique em **"Save"** mesmo assim para forçar atualização
3. Aguarde alguns minutos

### 4. Verificar se o arquivo está no repositório

O arquivo deve estar em: `assets/css/main.css`

Verifique:
```bash
git ls-files assets/css/main.css
```

Se não aparecer nada, adicione:
```bash
git add assets/css/main.css
git commit -m "Adicionar CSS"
git push origin main
```

### 5. Aguardar e testar

- Aguarde 5-10 minutos após o push
- Limpe o cache do navegador:
  - **Chrome/Edge**: `Ctrl+Shift+R` (Windows) ou `Cmd+Shift+R` (Mac)
  - **Firefox**: `Ctrl+Shift+R` (Windows) ou `Cmd+Shift+R` (Mac)
  - Ou abra DevTools (F12) → Network → marque "Disable cache"

### 6. Testar diretamente

Acesse no navegador:
```
https://kleytonmr.github.io/Blogs-Like/assets/css/main.css
```

- ✅ Se aparecer o conteúdo do CSS → está funcionando! (limpe o cache)
- ❌ Se aparecer 404 → aguarde mais alguns minutos ou verifique os passos acima

## 🔍 Debug Avançado

### Verificar se o build está gerando o CSS

Localmente:
```bash
bundle exec jekyll build
ls -lh _site/assets/css/main.css
```

Se o arquivo existir localmente mas não no GitHub Pages, o problema é no deploy.

### Verificar logs do GitHub Actions

1. Acesse: https://github.com/kleytonmr/Blogs-Like/actions
2. Clique no último workflow
3. Veja se há erros no step "Build Jekyll site" ou "Upload artifact"

### Verificar configuração do repositório

Certifique-se de que:
- ✅ Repositório é público (ou você tem GitHub Pro)
- ✅ GitHub Pages está ativado
- ✅ Source está como "GitHub Actions"
- ✅ Workflow está habilitado

## ⚠️ Problemas Comuns

1. **GitHub Pages não configurado**: Após renomear, precisa reconfigurar
2. **Workflow não executando**: Verifique se está habilitado em Settings → Actions
3. **Cache do navegador**: Sempre limpe o cache após mudanças
4. **Tempo de propagação**: Pode levar até 10 minutos após o deploy

## 📞 Se nada funcionar

1. Verifique se o repositório está público
2. Verifique se GitHub Pages está ativado
3. Verifique se o workflow completou com sucesso
4. Tente criar um arquivo de teste para verificar se o deploy está funcionando:
   ```bash
   echo "test" > _site/test.txt
   git add _site/test.txt
   git commit -m "Test deploy"
   git push origin main
   ```

---

**Dica**: O problema geralmente se resolve após reconfigurar o GitHub Pages e aguardar alguns minutos!

