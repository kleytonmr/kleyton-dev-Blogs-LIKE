# 🔄 Guia para Renomear o Repositório

## 📋 O que foi atualizado no projeto

Todas as configurações já foram atualizadas para o novo nome `Blogs-like`:

- ✅ `_config.yml` - baseurl e configurações do Giscus
- ✅ `GISCUS_SETUP.md` - referências atualizadas
- ✅ `CONFIGURACAO.md` - URLs atualizadas

## 🚀 Como renomear no GitHub

### Passo 1: Renomear o repositório

1. Acesse seu repositório: https://github.com/kleytonmr/kleyton-dev-Blogs-LIKE
2. Clique em **Settings** (Configurações)
3. Role até a seção **Repository name**
4. Altere o nome de `kleyton-dev-Blogs-LIKE` para `Blogs-like`
5. Clique em **Rename** (Renomear)

### Passo 2: Atualizar o remote local

Após renomear no GitHub, atualize o remote no seu computador:

```bash
git remote set-url origin https://github.com/kleytonmr/Blogs-like.git
```

Ou se você usa SSH:

```bash
git remote set-url origin git@github.com:kleytonmr/Blogs-like.git
```

Verifique se está correto:

```bash
git remote -v
```

### Passo 3: Fazer commit e push das mudanças

```bash
git add .
git commit -m "Atualizar configurações para novo nome do repositório Blogs-like"
git push origin main
```

## 🌐 Nova URL do blog

Após renomear, seu blog estará disponível em:

**https://kleytonmr.github.io/Blogs-like/**

## ⚠️ Importante

1. **GitHub Pages**: O GitHub redireciona automaticamente a URL antiga para a nova, mas é melhor atualizar qualquer link que você tenha compartilhado.

2. **GitHub Actions**: O workflow continuará funcionando normalmente após o rename.

3. **Giscus**: Se você já configurou o Giscus, precisará atualizar o repositório nas configurações do Giscus App.

4. **Links externos**: Se você compartilhou links do blog em algum lugar, eles continuarão funcionando (redirecionamento automático), mas é bom atualizar.

## ✅ Verificação

Após renomear, verifique:

1. ✅ Repositório renomeado no GitHub
2. ✅ Remote local atualizado
3. ✅ Mudanças commitadas e pushadas
4. ✅ Blog acessível na nova URL
5. ✅ GitHub Actions funcionando

---

**Dica**: O trocadilho "Blogs-like" ficou perfeito! 🎉

