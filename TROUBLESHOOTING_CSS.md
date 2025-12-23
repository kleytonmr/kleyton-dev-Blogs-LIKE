# 🔧 Troubleshooting - CSS não carrega

## ✅ Verificações já feitas

- ✅ CSS existe e tem conteúdo (669 linhas)
- ✅ Caminho gerado corretamente: `/Blogs-like/assets/css/main.css`
- ✅ Configuração do baseurl está correta no `_config.yml`

## 🚀 Soluções

### 1. Fazer commit e push das mudanças

```bash
git add _layouts/default.html _config.yml
git commit -m "Corrigir caminho do CSS após renomeação"
git push origin main
```

### 2. Aguardar o deploy

- O GitHub Actions precisa executar (2-5 minutos)
- Verifique em: https://github.com/kleytonmr/Blogs-like/actions

### 3. Limpar cache do navegador

**Chrome/Edge:**
- Pressione `Ctrl+Shift+R` (Windows/Linux) ou `Cmd+Shift+R` (Mac)
- Ou abra DevTools (F12) → Network → marque "Disable cache"

**Firefox:**
- Pressione `Ctrl+Shift+R` (Windows/Linux) ou `Cmd+Shift+R` (Mac)

**Safari:**
- Pressione `Cmd+Option+R`

### 4. Verificar se o CSS está acessível

Acesse diretamente no navegador:
```
https://kleytonmr.github.io/Blogs-like/assets/css/main.css
```

Se aparecer o conteúdo do CSS, o problema é cache do navegador.
Se aparecer 404, o problema é no deploy.

### 5. Verificar o GitHub Pages

1. Acesse: https://github.com/kleytonmr/Blogs-like/settings/pages
2. Verifique se está configurado como **"GitHub Actions"**
3. Verifique se o último deploy foi bem-sucedido

### 6. Forçar novo deploy

Se nada funcionar, faça um pequeno ajuste e force um novo deploy:

```bash
# Fazer uma pequena mudança qualquer
echo "/* Updated */" >> assets/css/main.css
git add assets/css/main.css
git commit -m "Forçar novo deploy do CSS"
git push origin main
```

## 🔍 Debug no navegador

1. Abra o DevTools (F12)
2. Vá na aba **Network**
3. Recarregue a página (F5)
4. Procure por `main.css`
5. Veja o status:
   - **200**: CSS carregou (problema pode ser cache)
   - **404**: CSS não encontrado (problema no deploy)
   - **Cached**: CSS em cache (limpe o cache)

## 📝 Checklist

- [ ] Mudanças commitadas e pushadas
- [ ] GitHub Actions completou com sucesso
- [ ] Cache do navegador limpo
- [ ] CSS acessível diretamente pela URL
- [ ] GitHub Pages configurado corretamente

---

**Dica**: Após renomear o repositório, pode levar alguns minutos para o GitHub Pages atualizar completamente.

