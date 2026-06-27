-- =====================================================
-- PROJETO: SAMPLE SUPERSTORE
-- Análise Comercial e Operacional
--
-- Autor: Karen Cristina
-- Banco de Dados: SQLite
-- Ferramentas: SQLite | Power BI
--
-- Objetivo:
-- Realizar análises comerciais e operacionais utilizando
-- SQL para gerar insights estratégicos sobre vendas,
-- lucro, clientes, produtos e logística.
-- =====================================================

-- =====================================================
-- EXPLORAÇÃO DA BASE DE DADOS
-- =====================================================

-- Consulta 1: Visualizar os primeiros registros

SELECT *
FROM Sample_Superstore
LIMIT 5;

-- Consulta 2: Total de registros

SELECT
COUNT(*) AS Total_Registros
FROM Sample_Superstore;

-- =====================================================
-- ANÁLISE COMERCIAL
-- =====================================================

-- Consulta 3: Total de Vendas

SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore;

-- Consulta 4: Total de Lucro

SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore;

-- Consulta 5: Total de Pedidos

SELECT
COUNT(DISTINCT "Order ID") AS Total_Orders
FROM Sample_Superstore;

-- Consulta 6: Quantidade Vendida

SELECT
SUM(Quantity) AS Total_Quantity
FROM Sample_Superstore;

-- Consulta 7: Vendas por Categoria

SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Consulta 8: Lucro por Categoria

SELECT
Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Consulta 9: Vendas por Região

SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Consulta 10: Lucro por Região

SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Consulta 11: Top 10 Produtos por Vendas

SELECT
"Product Name",
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- Consulta 12: Top 10 Produtos por Lucro

SELECT
"Product Name",
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- Consulta 13: Top 10 Clientes por Vendas

SELECT
"Customer Name",
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- Consulta 14: Top 10 Clientes por Lucro

SELECT
"Customer Name",
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore
GROUP BY "Customer Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- =====================================================
-- ANÁLISE OPERACIONAL
-- =====================================================

-- Consulta 15: Pedidos por Modo de Envio

SELECT
"Ship Mode",
COUNT(DISTINCT "Order ID") AS Total_Orders
FROM Sample_Superstore
GROUP BY "Ship Mode"
ORDER BY Total_Orders DESC;

-- Consulta 16: Quantidade Vendida por Categoria

SELECT
Category,
SUM(Quantity) AS Total_Quantity
FROM Sample_Superstore
GROUP BY Category
ORDER BY Total_Quantity DESC;

-- Consulta 17: Top 10 Produtos por Quantidade

SELECT
"Product Name",
SUM(Quantity) AS Total_Quantity
FROM Sample_Superstore
GROUP BY "Product Name"
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Consulta 18: Desconto Médio por Categoria

SELECT
Category,
ROUND(AVG(Discount)*100,2) AS Average_Discount_Percentage
FROM Sample_Superstore
GROUP BY Category
ORDER BY Average_Discount_Percentage DESC;

-- =====================================================
-- ANÁLISE TEMPORAL
-- =====================================================

-- Consulta 19: Vendas por Ano

SELECT
strftime('%Y',"Order Date") AS Ano,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Sample_Superstore
GROUP BY Ano
ORDER BY Ano;

-- Consulta 20: Lucro por Ano

SELECT
strftime('%Y',"Order Date") AS Ano,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Sample_Superstore
GROUP BY Ano
ORDER BY Ano;

-- =====================================================
-- ANÁLISE DE RENTABILIDADE
-- =====================================================

-- Consulta 21: Margem de Lucro por Categoria

SELECT
Category,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM Sample_Superstore
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- Consulta 22: Margem de Lucro por Região

SELECT
Region,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM Sample_Superstore
GROUP BY Region
ORDER BY Profit_Margin DESC;