# Meu Blog com Jekyll e GitHub Pages

Um blog simples e elegante usando Jekyll, que permite escrever posts em Markdown e publicá-los automaticamente no GitHub Pages.

## 🚀 Características

- ✅ Escreva posts em Markdown
- ✅ Preview local antes de publicar
- ✅ Organização por categorias/tópicos
- ✅ Sistema de tags
- ✅ Publicação automática no GitHub Pages
- ✅ Design responsivo e moderno

## 📋 Pré-requisitos

- Ruby (versão 2.7 ou superior)
- Bundler (`gem install bundler`)

## 🛠️ Instalação

1. **Clone ou baixe este repositório**

2. **Instale as dependências:**
```bash
bundle install
```

## 📝 Como Usar

### Escrever um Novo Post

1. Crie um novo arquivo na pasta `_posts/` com o formato:
   ```
   YYYY-MM-DD-titulo-do-post.md
   ```

2. Adicione o front matter (cabeçalho YAML) no início do arquivo:
```yaml
---
layout: post
title: "Título do Seu Post"
date: 2024-01-20 14:30:00 -0300
categories: [tecnologia, programacao]
tags: [jekyll, markdown, blog]
excerpt: "Breve descrição do post que aparece na listagem"
---
```

3. Escreva seu conteúdo em Markdown abaixo do front matter.

### Campos do Front Matter

- **layout**: Sempre use `post`
- **title**: Título do post (entre aspas)
- **date**: Data e hora no formato `YYYY-MM-DD HH:MM:SS -0300`
- **categories**: Array de categorias (tópicos) - ex: `[tecnologia, ciencia]`
- **tags**: Array de tags - ex: `[jekyll, markdown]`
- **excerpt**: Resumo do post (opcional)

### Visualizar Localmente

Para ver seu blog localmente antes de publicar:

```bash
bundle exec jekyll serve
```

Acesse `http://localhost:4000` no seu navegador.

O Jekyll irá recarregar automaticamente quando você salvar alterações nos arquivos.

### Organização por Tópicos

Você pode criar quantas categorias quiser! Basta adicioná-las no campo `categories` do front matter:

```yaml
categories: [tecnologia, programacao, ciencia, filosofia, viagens]
```

Os posts serão automaticamente organizados por categoria e você poderá navegar por tópicos na página inicial.

## 🌐 Publicar no GitHub Pages

### Opção 1: GitHub Actions (Recomendado)

1. Crie um arquivo `.github/workflows/jekyll.yml`:
```yaml
name: Jekyll site CI

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'
          bundler-cache: true
      - name: Jekyll build
        run: bundle exec jekyll build
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_site
```

2. Configure o GitHub Pages no repositório:
   - Vá em Settings > Pages
   - Source: selecione "GitHub Actions"

### Opção 2: Branch gh-pages

1. Configure o repositório:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
git push -u origin main
```

2. Ative o GitHub Pages nas configurações do repositório:
   - Vá em Settings > Pages
   - Source: selecione a branch `main` ou `gh-pages`

## 📁 Estrutura do Projeto

```
.
├── _config.yml          # Configurações do Jekyll
├── _layouts/            # Templates HTML
│   ├── default.html
│   ├── home.html
│   └── post.html
├── _posts/             # Seus posts em Markdown
│   └── YYYY-MM-DD-titulo.md
├── assets/             # CSS, imagens, etc.
│   └── css/
│       └── main.css
├── Gemfile             # Dependências Ruby
├── index.html          # Página inicial
└── README.md           # Este arquivo
```

## 🎨 Personalização

### Alterar Informações do Blog

Edite o arquivo `_config.yml`:
- `title`: Título do blog
- `description`: Descrição do blog
- `author`: Seu nome
- `url`: URL do seu site no GitHub Pages

### Personalizar Cores e Estilos

Edite o arquivo `assets/css/main.css` para alterar cores, fontes e estilos.

## 📚 Recursos Úteis

- [Documentação do Jekyll](https://jekyllrb.com/docs/)
- [GitHub Pages](https://pages.github.com/)
- [Markdown Guide](https://www.markdownguide.org/)

## 🤝 Contribuindo

Sinta-se à vontade para fazer fork deste projeto e adaptá-lo às suas necessidades!

## 📄 Licença

Este projeto é de código aberto e está disponível sob a licença MIT.

---

**Dica**: Sempre teste localmente antes de fazer commit e push para o GitHub!

