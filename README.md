```markdown
# 📊 Ecommerce Database Schema

Este repositório contém o esquema conceitual de banco de dados para um sistema de e-commerce, desenvolvido para ser usado com PostgreSQL.

## 🚀 Descrição
O esquema gerencia dados relacionados a clientes (PJ e PF), pedidos, pagamentos e produtos, fornecendo uma estrutura eficiente para transações e rastreamento.

### 🛠 Estrutura do Banco
O esquema inclui:
- **Cliente**: Dados de clientes (nome, tipo, CPF/CNPJ, email).
- **Pagamento**: Informações sobre métodos de pagamento e detalhes.
- **Pedido**: Histórico de pedidos com status e rastreamento.
- **Produto**: Estoque de produtos com preços e descrição.
- **Itens do Pedido**: Relaciona produtos a pedidos com quantidade e preço total.

## 📥 Como Usar
1. Certifique-se de ter o PostgreSQL instalado em seu sistema.
2. Clone o repositório:
   ```bash
   git clone https://github.com/jessicalorentino/Ecommerce-Database-Schema.git
   cd Ecommerce-Database-Schema
   ```
3. Execute o arquivo SQL no PostgreSQL:
   ```bash
   psql -U seu_usuario -d ecommerce -f ecommerce.sql
   ```

## 🧐 Observações
- O arquivo **ecommerce.sql** foi desenvolvido para PostgreSQL. Ajustes podem ser necessários para outros SGBDs.
- Certifique-se de configurar o esquema para o banco de dados **public**.

