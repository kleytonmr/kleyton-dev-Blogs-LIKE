#!/bin/bash

# Script para substituir Blogs-like por Blogs-Like em todos os arquivos

echo "🔍 Procurando arquivos com 'Blogs-like'..."

# Encontrar e substituir em todos os arquivos relevantes
find . -type f \( -name "*.yml" -o -name "*.md" -o -name "*.html" -o -name "*.rb" -o -name "*.sh" \) ! -path "./.git/*" ! -path "./_site/*" ! -path "./node_modules/*" ! -path "./vendor/*" -exec grep -l "Blogs-like" {} \; | while read file; do
    echo "📝 Atualizando: $file"
    sed -i '' 's/Blogs-like/Blogs-Like/g' "$file"
done

echo "✅ Substituição concluída!"
echo ""
echo "📋 Arquivos modificados:"
find . -type f \( -name "*.yml" -o -name "*.md" -o -name "*.html" -o -name "*.rb" -o -name "*.sh" \) ! -path "./.git/*" ! -path "./_site/*" ! -path "./node_modules/*" ! -path "./vendor/*" -exec grep -l "Blogs-Like" {} \;

echo ""
echo "🔍 Verificando mudanças:"
git status --short

