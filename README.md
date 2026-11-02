# 🎬 CINE PRISMA — BANCO DE DADOS

**Sistema de Gerenciamento de Cinema**

- **Instituição:** Senai Suíço-Brasileira
- **Professor:** Atila
- **Disciplina:** Banco de Dados
- **Autor(a):** Maria Gabriela
- **Turma:** SEDUC DEST 2
- **Data:** 02/11/2026

---

## Apresentação do Projeto

Este projeto consiste na criação e estruturação de um Banco de Dados Relacional para o Cine Prisma, uma empresa fictícia do ramo cinematográfico. O sistema foi desenvolvido para organizar e facilitar o gerenciamento de clientes, filmes, salas, sessões e vendas de ingressos.

A proposta busca substituir controles manuais e planilhas separadas por um banco de dados centralizado, garantindo maior organização, segurança e facilidade na consulta das informações.

## Escopo Operacional

### Cadastro e Gestão de Clientes
Armazenamento dos dados pessoais dos clientes, incluindo CPF, data de nascimento, telefones e e-mails.

### Gerenciamento de Filmes
Cadastro de títulos, gêneros, classificações indicativas, duração e datas de lançamento.

### Controle de Salas
Organização das salas de cinema, suas capacidades e tecnologias de exibição, como 2D, 3D, IMAX e VIP.

### Agendamento de Sessões
Controle de horários, idiomas, preços, filmes exibidos e salas utilizadas.

### Venda e Controle de Ingressos
Registro de ingressos, assentos, valores, clientes, sessões e situação da venda, evitando a duplicidade de assentos na mesma sessão.

---

## Domínio do Banco de Dados
O domínio escolhido para o projeto é o gerenciamento de um cinema, envolvendo o cadastro de filmes, salas, sessões, clientes, ingressos e vendas.

## Situação-problema
A empresa de cinema Cine Prisma enfrenta dificuldades para organizar suas informações devido ao uso de planilhas e registros manuais. Os dados dos filmes, das salas de exibição, dos horários das sessões e das vendas de ingressos ficam armazenados separadamente, dificultando o acesso e a atualização das informações.
Essa falta de organização pode causar problemas, como reservas duplicadas de assentos, erros na quantidade de ingressos vendidos, conflitos nos horários das sessões e dificuldades para consultar os filmes em cartaz. Além disso, o controle das vendas e do faturamento torna-se mais demorado, aumentando o risco de erros e perda de informações.
Diante dessa situação, surge a necessidade de desenvolver um banco de dados relacional que centralize as informações do cinema, facilite o gerenciamento das sessões e dos ingressos e torne o acesso aos dados mais rápido, seguro e organizado.

Desafios do Projeto <br>
1- Modelagem do banco de dados: identificar as tabelas, os campos, os tipos de dados, os relacionamentos e as cardinalidades necessárias para o sistema do cinema. <br>
2- Aplicação das formas normais: aplicar a 1FN, 2FN, 3FN e 4FN para reduzir redundâncias e manter os dados organizados. <br>
3- Criação do banco de dados: desenvolver os comandos SQL para criar o banco e todas as tabelas planejadas. <br>
4- Inserção de dados: cadastrar pelo menos cinco registros em cada tabela para testar o funcionamento do banco. <br>
5- Desenvolvimento de consultas SQL: elaborar 15 consultas contextualizadas utilizando comandos como INNER JOIN, WHERE, LIKE, GROUP BY, ORDER BY, BETWEEN e SUM. <br>
6- Validação dos relacionamentos: verificar se as relações entre filmes, salas, sessões, clientes e ingressos funcionam corretamente e mantêm a integridade dos dados. <br>
7- Geração do backup (dump): aprender a exportar a estrutura e os dados do banco para um arquivo .sql. <br>
8- Versionamento do projeto: organizar os scripts SQL em um repositório Git e disponibilizar o link para entrega no Classroom. <br>
9- Documentação da modelagem: gerar uma imagem da modelagem do banco de dados para apresentar os relacionamentos e as cardinalidades.


## Proposta de Melhoria
A proposta de melhoria consiste no desenvolvimento de um banco de dados relacional para um cinema, utilizando um SGBD, como o MySQL, para centralizar e organizar as informações sobre filmes, salas, sessões, clientes, ingressos e vendas.
Com a implementação desse sistema, será possível reduzir a duplicação de dados, evitar erros nos registros, facilitar o controle de assentos e horários das sessões e tornar as consultas sobre vendas e faturamento mais rápidas e eficientes.
Além disso, a aplicação das formas normais contribuirá para manter os dados organizados e consistentes, enquanto a criação de backups permitirá recuperar as informações em caso de perda de dados. O projeto também contará com consultas SQL para auxiliar na análise das vendas e na identificação dos filmes mais assistidos.
Dessa forma, o cinema terá um gerenciamento mais seguro, organizado e eficiente, facilitando o acesso às informações e melhorando o controle de suas operações.


## Estrutura do Banco de Dados

O banco de dados `cinema` possui **7 tabelas principais**:

| Tabela | Finalidade |
|---|---|
| clientes | Cadastro dos clientes |
| fone | Telefones dos clientes |
| email | E-mails dos clientes |
| filmes | Cadastro dos filmes |
| salas | Cadastro das salas |
| sessoes | Controle das sessões |
| ingressos | Registro das vendas de ingressos |

### Relacionamentos

- Clientes → Fone: 1:N
- Clientes → Email: 1:N
- Filmes → Sessões: 1:N
- Salas → Sessões: 1:N
- Clientes → Ingressos: 1:N
- Sessões → Ingressos: 1:N

O relacionamento entre clientes e sessões é N:N, representado indiretamente pela tabela `ingressos`.

---

# Resultados das Queries

### Resultado #1 — Listagem de Todos os Filmes

| id_filme | título | gênero | classificação | duração |
|---:|---|---|---|---:|
| 1 | Interestelar | Ficção | 10 anos | 169 |
| 2 | Shrek | Animacao | Livre | 90 |
| 3 | Vingadores Ultimato | Ação | 12 anos | 181 |
| 4 | Procurando Nemo | Animação | Livre | 100 |
| 5 | Como eu era antes de você | Romance | 12 anos | 110 |

### Resultado #2 — Filmes do Gênero Ação

| título | gênero |
|---|---|
| Vingadores Ultimato | Ação |

### Resultado #3 — Filmes que Possuem "eu" no Título

| título |
|---|
| Como eu era antes de você |

### Resultado #4 — Filmes com Duração entre 90 e 150 Minutos

| título | duração |
|---|---:|
| Shrek | 90 |
| Procurando Nemo | 100 |
| Como eu era antes de você | 110 |

### Resultado #5 — Sessões com os Respectivos Filmes

| id_sessao | filme | data e horário | preço |
|---:|---|---|---:|
| 1 | Interestelar | 29/10/2026 14:00 | R$ 20,00 |
| 2 | Shrek | 29/10/2026 16:00 | R$ 25,00 |
| 3 | Vingadores Ultimato | 29/10/2026 18:00 | R$ 30,00 |
| 4 | Procurando Nemo | 30/10/2026 15:00 | R$ 22,00 |
| 5 | Como eu era antes de você | 30/10/2026 20:00 | R$ 28,00 |

### Resultado #6 — Sessões com Número e Tipo da Sala

| id_sessao | filme | número da sala | tipo |
|---:|---|---:|---|
| 1 | Interestelar | 10 | 2D |
| 2 | Shrek | 9 | 3D |
| 3 | Vingadores Ultimato | 5 | IMAX |
| 4 | Procurando Nemo | 8 | VIP |
| 5 | Como eu era antes de você | 3 | 2D |

### Resultado #7 — Sessões dos Dias 29 e 30 de Outubro de 2026

| id_sessao | data e horário | idioma | preço |
|---:|---|---|---:|
| 1 | 29/10/2026 14:00 | Dublado | R$ 20,00 |
| 2 | 29/10/2026 16:00 | Legendado | R$ 25,00 |
| 3 | 29/10/2026 18:00 | Dublado | R$ 30,00 |
| 4 | 30/10/2026 15:00 | Original | R$ 22,00 |
| 5 | 30/10/2026 20:00 | Legendado | R$ 28,00 |

### Resultado #8 — Sessões Dubladas

| filme | data e horário | idioma |
|---|---|---|
| Interestelar | 29/10/2026 14:00 | Dublado |
| Vingadores Ultimato | 29/10/2026 18:00 | Dublado |

### Resultado #9 — Ingressos Vendidos

| id_ingresso | assento | valor | status |
|---:|---|---:|---|
| 1 | H01 | R$ 20,00 | vendido |
| 2 | J12 | R$ 20,00 | vendido |
| 3 | B01 | R$ 25,00 | vendido |
| 4 | C12 | R$ 30,00 | vendido |
| 6 | E01 | R$ 28,00 | vendido |
| 7 | A06 | R$ 20,00 | vendido |

### Resultado #10 — Ingressos e Respectivos Clientes

| cliente | assento | valor | status |
|---|---|---:|---|
| Ana Silva | H01 | R$ 20,00 | vendido |
| Bruno Santos | J12 | R$ 20,00 | vendido |
| Carla Oliveira | B01 | R$ 25,00 | vendido |
| Diego Costa | C12 | R$ 30,00 | vendido |
| Eduarda Lima | D10 | R$ 22,00 | cancelado |
| Ana Silva | E01 | R$ 28,00 | vendido |
| Carla Oliveira | A06 | R$ 20,00 | vendido |
| Bruno Santos | K02 | R$ 25,00 | cancelado |

### Resultado #11 — Faturamento Total dos Ingressos Vendidos

| total_vendas |
|---:|
| R$ 143,00 |

### Resultado #12 — Quantidade de Ingressos Vendidos por Sessão

| id_sessao | filme | total_ingressos |
|---:|---|---:|
| 1 | Interestelar | 3 |
| 2 | Shrek | 1 |
| 3 | Vingadores Ultimato | 1 |
| 4 | Procurando Nemo | 0 |
| 5 | Como eu era antes de você | 1 |

### Resultado #13 — Filme com Maior Quantidade de Ingressos Vendidos

| filme | total_vendidos |
|---|---:|
| Interestelar | 3 |

### Resultado #14 — Capacidade das Salas e Ingressos Vendidos

| número da sala | capacidade | ingressos vendidos |
|---:|---:|---:|
| 3 | 120 | 1 |
| 5 | 150 | 1 |
| 8 | 60 | 0 |
| 9 | 80 | 1 |
| 10 | 100 | 3 |

### Resultado #15 — Clientes que Nunca Compraram Ingressos

Considerando apenas ingressos com status `vendido`, a consulta retorna:

| id_cliente | nome |
|---:|---|
| 5 | Eduarda Lima |

Eduarda possui um ingresso cadastrado, mas ele está cancelado. Por isso, não aparece entre os clientes que realizaram uma compra efetiva.

---

## Recursos SQL Utilizados

Durante o desenvolvimento das consultas, foram utilizados os seguintes comandos e funções:

- `SELECT` — seleção de informações.
- `WHERE` — filtragem de registros.
- `LIKE` — busca por partes de textos.
- `INNER JOIN` — combinação de tabelas relacionadas.
- `LEFT JOIN` — apresentação de registros mesmo sem correspondência.
- `BETWEEN` — busca dentro de um intervalo.
- `GROUP BY` — agrupamento de informações.
- `ORDER BY` — ordenação dos resultados.
- `SUM()` — soma de valores.
- `COUNT()` — contagem de registros.
- `LIMIT` — limitação da quantidade de resultados.

## Considerações Finais

O desenvolvimento do banco de dados do Cine Prisma permitiu aplicar conceitos de modelagem relacional, relacionamentos entre tabelas, chaves primárias e estrangeiras e consultas SQL.

A solução proporciona maior organização das informações, facilita o controle de sessões e ingressos, reduz a duplicação de dados e permite acompanhar as vendas e o faturamento do cinema.

---

**SENAI | Banco de Dados Relacional | Projeto Cine Prisma**
