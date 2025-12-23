# 📝 Guia de Configuração do GitHub Pages

## ✅ Configuração já feita

O arquivo `_config.yml` já está configurado com:
- **URL base**: `https://kleytonmr.github.io`
- **Base URL**: `/kleyton-dev-Blogs-LIKE`
- **Usuário GitHub**: `kleytonmr`

## 🌐 URL do seu blog

Após ativar o GitHub Pages, seu blog estará disponível em:

**https://kleytonmr.github.io/kleyton-dev-Blogs-LIKE/**

## 🚀 Como ativar o GitHub Pages

### Passo 1: Fazer commit e push das mudanças

```bash
git add .
git commit -m "Configurar URL do blog"
git push origin main
```

### Passo 2: Ativar o GitHub Pages

1. Acesse seu repositório no GitHub: https://github.com/kleytonmr/kleyton-dev-Blogs-LIKE
2. Vá em **Settings** (Configurações)
3. No menu lateral, clique em **Pages**
4. Em **Source**, selecione **"GitHub Actions"**
5. Clique em **Save** (Salvar)

### Passo 3: Aguardar o deploy

- O GitHub Actions vai executar automaticamente após o push
- Você pode acompanhar o progresso em **Actions** (no menu do repositório)
- Quando o workflow completar com sucesso, seu blog estará no ar!

## ⏱️ Tempo de publicação

- Primeira publicação: 5-10 minutos
- Atualizações futuras: 2-5 minutos após cada push

## 🔍 Verificar se está funcionando

1. Acesse: https://kleytonmr.github.io/kleyton-dev-Blogs-LIKE/
2. Se aparecer "404 Not Found", aguarde alguns minutos e tente novamente
3. Se ainda não funcionar, verifique:
   - Se o workflow do GitHub Actions completou com sucesso
   - Se o GitHub Pages está configurado corretamente (Settings > Pages)

## 📝 Notas importantes

- **Base URL**: Como seu repositório não se chama `kleytonmr.github.io`, você precisa do baseurl `/kleyton-dev-Blogs-LIKE`
- **Links**: Todos os links já estão configurados para funcionar com o baseurl
- **Domínio customizado**: Se quiser usar um domínio próprio depois, é só adicionar em Settings > Pages > Custom domain

## 🎯 Próximos passos

1. ✅ Configuração do `_config.yml` - **FEITO**
2. ⏳ Fazer commit e push
3. ⏳ Ativar GitHub Pages nas configurações
4. ⏳ Aguardar deploy
5. ⏳ Acessar seu blog!

---

**Dica**: Se quiser que a URL seja mais simples (sem o nome do repositório), você pode renomear o repositório para `kleytonmr.github.io` e atualizar o `baseurl` para `""` no `_config.yml`.

