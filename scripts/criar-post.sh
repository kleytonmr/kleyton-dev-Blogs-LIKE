#!/bin/bash

# Script para criar um novo post no blog
# Uso: ./scripts/criar-post.sh "Título do Post" categoria1 categoria2

if [ $# -lt 2 ]; then
    echo "Uso: $0 \"Título do Post\" categoria1 [categoria2 ...]"
    echo "Exemplo: $0 \"Meu Novo Post\" tecnologia programacao"
    exit 1
fi

TITLE="$1"
shift
CATEGORIES="$@"

# Converter título para slug (nome do arquivo)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

# Data atual
DATE=$(date +"%Y-%m-%d %H:%M:00 -0300")
FILENAME=$(date +"%Y-%m-%d")-$SLUG.md

# Criar array de categorias no formato YAML
CATEGORIES_YAML="["
for cat in $CATEGORIES; do
    CATEGORIES_YAML="$CATEGORIES_YAML$cat, "
done
CATEGORIES_YAML=$(echo "$CATEGORIES_YAML" | sed 's/, $/]/')

# Criar o arquivo do post
cat > "_posts/$FILENAME" << EOF
---
layout: post
title: "$TITLE"
date: $DATE
categories: $CATEGORIES_YAML
tags: []
excerpt: ""
---

Escreva seu conteúdo aqui...

EOF

echo "Post criado: _posts/$FILENAME"
echo "Agora você pode editar o arquivo e adicionar seu conteúdo!"

