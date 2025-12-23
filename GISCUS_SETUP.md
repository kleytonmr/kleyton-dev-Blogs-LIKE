# 🎯 Configuração do Giscus - Comentários no Blog

## ✅ O que já foi feito

- Código do Giscus adicionado ao layout dos posts
- Configurações básicas adicionadas ao `_config.yml`
- Estilos CSS integrados ao design do blog

## 🚀 Como ativar o Giscus

### Passo 1: Instalar o Giscus App no GitHub

1. Acesse: https://github.com/apps/giscus
2. Clique em **"Install"** (Instalar)
3. Selecione seu repositório: **Blogs-Like**
4. Clique em **"Install"** novamente

### Passo 2: Ativar GitHub Discussions

1. Acesse seu repositório: https://github.com/kleytonmr/Blogs-Like
2. Vá em **Settings** (Configurações)
3. No menu lateral, clique em **General**
4. Role até a seção **Features**
5. Marque a opção **"Discussions"**
6. Clique em **"Set up discussions"** (Configurar discussões)
7. Escolha um template ou deixe em branco
8. Clique em **"Start discussion"** (Iniciar discussão)

### Passo 3: Obter os IDs necessários

1. Acesse: https://giscus.app
2. Preencha os campos:
   - **Repository**: `kleytonmr/Blogs-Like`
   - **Discussion Category**: Escolha uma categoria (ex: "Announcements")
   - **Page ↔ Discussions Mapping**: `pathname`
   - **Discussion Term**: Deixe padrão
   - **Features**: Marque "Enable reactions" (Reações)
   - **Theme**: Escolha um tema (recomendo "Light" ou "Dark")
   - **Language**: `pt` (Português)
3. Role até o final da página
4. Copie os valores de:
   - **data-repo-id**: Um número longo
   - **data-category-id**: Um número longo

### Passo 4: Atualizar o _config.yml

Edite o arquivo `_config.yml` e preencha os valores vazios:

```yaml
giscus:
  repo: kleytonmr/Blogs-Like
  repo_id: "COLE_AQUI_O_REPO_ID" # Exemplo: "R_kgDOJ..."
  category: "Announcements"
  category_id: "COLE_AQUI_O_CATEGORY_ID" # Exemplo: "DIC_kwDOJ..."
  mapping: "pathname"
  reactions_enabled: "1"
  emit_metadata: "0"
  input_position: "bottom"
  theme: "light" # ou "dark" se preferir
  lang: "pt"
```

### Passo 5: Fazer commit e push

```bash
git add _config.yml _layouts/post.html assets/css/main.css
git commit -m "Adicionar sistema de comentários Giscus"
git push origin main
```

## ✨ Funcionalidades

Após configurar, você terá:

- ✅ **Comentários** nos posts
- ✅ **Reações** (curtidas): 👍 ❤️ 🎉 👀 🚀
- ✅ **Moderação** via GitHub Discussions
- ✅ **Notificações** quando alguém comentar
- ✅ **Sincronização** automática entre blog e GitHub

## 🎨 Personalização

Você pode alterar no `_config.yml`:

- **theme**: `"light"`, `"dark"`, `"preferred_color_scheme"`, ou `"transparent_dark"`
- **input_position**: `"top"` ou `"bottom"`
- **reactions_enabled**: `"1"` (sim) ou `"0"` (não)
- **lang**: `"pt"`, `"en"`, etc.

## 🔍 Verificar se está funcionando

1. Acesse qualquer post do blog
2. Role até o final
3. Você deve ver a seção "Comentários" com o widget do Giscus
4. Se não aparecer, verifique:
   - Se o Giscus App está instalado no repositório
   - Se GitHub Discussions está ativado
   - Se os IDs estão corretos no `_config.yml`

## 📚 Documentação

- Site oficial: https://giscus.app
- Documentação: https://github.com/giscus/giscus

---

**Dica**: Os comentários só aparecerão após você preencher os IDs no `_config.yml`!

