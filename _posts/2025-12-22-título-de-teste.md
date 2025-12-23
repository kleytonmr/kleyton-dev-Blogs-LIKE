---
layout: post
title: "DTO no Rails: quando usar, quando evitar e como ele se encaixa na arquitetura"
date: 2025-12-22 22:23:00 -0300
categories: [tecnologia, programacao]
tags: [rails, arquitetura, dto, design-patterns]
excerpt: "Uma visão prática sobre DTO no Rails, comparando com Entities, Repositories e Serializers, e quando realmente faz sentido usar."
---

## DTO no Rails: o que é, quando usar e como ele se diferencia de Entities, Repositories e Serializers

Conforme uma aplicação Rails cresce, algumas perguntas começam a aparecer com mais frequência:

- O que exatamente é um DTO?
- Ele substitui o Model?
- Qual a diferença entre DTO, Entity, Repository e Serializer?
- Rails tem algum padrão oficial para isso?

Essas dúvidas geralmente surgem quando o projeto deixa de ser apenas CRUD e começa a ter mais regra, mais integração e mais responsabilidade.  
A ideia deste post é organizar esses conceitos de forma prática, com exemplos reais em Rails, e ajudar a decidir quando cada abordagem faz sentido — e quando não faz.

---

## O que é um DTO (Data Transfer Object)

DTO significa **Data Transfer Object**.

Na prática, é um objeto simples cujo único papel é **transportar dados entre camadas do sistema**. Ele não contém regra de negócio, não valida estado e não conhece banco de dados.

### Algumas características importantes

- Não persiste dados
- Não conhece ActiveRecord
- Não executa regras de negócio
- Serve apenas para carregar dados estruturados

### Exemplo simples

```ruby
class UserDTO
  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end
end
```

Gosto de pensar que o DTO responde a uma pergunta bem objetiva:  
**“como esses dados precisam viajar dentro da aplicação?”**

---

## DTO vs Model (Entity)

### Entity (Model no Rails)

```ruby
class User < ApplicationRecord
  validates :email, presence: true

  def adult?
    age >= 18
  end
end
```

A Entity representa o domínio. É onde vivem as regras que fazem sentido para aquele conceito do negócio.

**Responsabilidades da Entity:**

- Representar o domínio
- Garantir invariantes
- Conter regras de negócio intrínsecas
- Conhecer o próprio estado

---

### DTO

```ruby
UserDTO = Struct.new(:id, :name, :email, keyword_init: true)
```

Já o DTO não representa domínio nenhum. Ele apenas carrega dados de um ponto a outro.

**Responsabilidades do DTO:**

- Transportar dados
- Estruturar payloads
- Não conter regras de negócio

### Diferença clara

| Entity | DTO |
|------|-----|
| Tem comportamento | Não tem |
| Conhece o domínio | Não conhece |
| Pode validar | Não valida |
| Vive no core do sistema | Vive nas bordas |

---

## DTO vs Serializer (muito comum no Rails)

No ecossistema Rails, serializers acabam sendo usados como uma espécie de “DTO de saída”, principalmente em APIs.

Alguns exemplos comuns:
- ActiveModel::Serializer
- Blueprinter
- FastJsonapi
- Jbuilder

```ruby
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
```

**Responsabilidade do Serializer:**

- Converter objetos em JSON
- Controlar quais campos são expostos
- Formatar respostas de API

### Quando um Serializer é suficiente

- Model → JSON simples
- APIs REST tradicionais
- CRUDs diretos

### Quando um DTO começa a fazer mais sentido

- Dados vêm de vários models
- Existem agregações ou cálculos
- A resposta não mapeia 1:1 com uma entidade
- Dashboards, relatórios ou integrações

Em aplicações simples, o serializer resolve bem.  
Conforme a complexidade aumenta, o DTO tende a organizar melhor o fluxo.

---

## DTO vs Repository

Aqui costuma surgir bastante confusão.

### Repository

Repository é uma abstração para **acesso a dados**.

```ruby
class UserRepository
  def active_users
    User.where(active: true)
  end
end
```

**Responsabilidades do Repository:**

- Buscar dados
- Persistir dados
- Centralizar queries
- Esconder detalhes do ActiveRecord

O Repository responde à pergunta:  
**“de onde esses dados vêm?”**

---

### DTO

```ruby
class DashboardDTO
  attr_reader :total_users, :active_users

  def initialize(total_users:, active_users:)
    @total_users = total_users
    @active_users = active_users
  end
end
```

O DTO responde a outra pergunta:  
**“como esses dados precisam ser transportados?”**

### Comparação direta

| Aspecto | Repository | DTO |
|------|-----------|----|
| Fala com banco | Sim | Não |
| Contém queries | Sim | Não |
| Transporta dados | Não | Sim |
| Pode ter regra de negócio | Às vezes | Não |
| Depende de ActiveRecord | Geralmente | Não |

Eles não competem. Cada um resolve um problema diferente.

---

## Um fluxo bem organizado usando Entity, Repository e DTO

```text
Controller
   ↓
Service (caso de uso)
   ↓
Repository (acesso a dados)
   ↓
Entity (regras do domínio)
   ↓
DTO (formato de transporte)
   ↓
Controller / API
```

### Exemplo prático

```ruby
class DashboardService
  def initialize(user_repository:)
    @user_repository = user_repository
  end

  def call
    users = @user_repository.active_users

    DashboardDTO.new(
      total_users: users.count,
      active_users: users.map(&:id)
    )
  end
end
```

---

## Erros comuns

### Repository virando DTO

```ruby
def dashboard_data
  {
    total: User.count,
    active: User.where(active: true).count
  }
end
```

Aqui tudo acaba misturado: acesso a dados, regra e formato de saída.

---

### DTO com regra de negócio

```ruby
class UserDTO
  def adult?
    age >= 18
  end
end
```

Esse tipo de regra pertence à Entity, não ao DTO.

---

## Rails tem um padrão oficial para DTO?

Não.

Rails segue a estrutura clássica:
- Model
- Controller
- View / Serializer

Na prática, projetos médios e grandes costumam adotar uma separação mais explícita.

---

## Organização comum em projetos Rails mais maduros

```text
app/
 ├── entities/
 ├── repositories/
 ├── services/
 ├── dtos/
 └── serializers/
```

### DTO como Struct

```ruby
UserDTO = Struct.new(:id, :name, :email, keyword_init: true)
```

Simples, legível e suficiente para muitos casos.

---

## Quando DTO é exagero

- CRUD simples
- Model direto para JSON
- Aplicação pequena
- Sem agregações ou múltiplas fontes de dados

Nesses casos, um serializer costuma resolver melhor.

---

## Quando DTO realmente ajuda

- Domínio mais complexo
- Dashboards e relatórios
- Integrações externas
- Respostas que combinam vários models
- Necessidade de reduzir acoplamento com ActiveRecord

---

## Uma regra prática para não se perder

- **Entity**: o que é  
- **Repository**: de onde vem  
- **Service**: o que acontece  
- **DTO**: como os dados viajam  

---

## Conclusão

DTO não é moda e não é obrigatório no Rails.

É apenas uma ferramenta para organizar melhor o código quando a complexidade começa a aparecer.  
Se resolver um problema real, vale usar. Se não, provavelmente é só mais uma camada sem necessidade.

