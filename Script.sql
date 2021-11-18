-- Criando as tabelas -- 

CREATE TABLE Produtos(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
marca VARCHAR(50) NOT NULL,
preço DECIMAL(10,2) DEFAULT 0.0,
categoria INT,
FOREIGN KEY (categoria) REFERENCES Categorias (id)
);

CREATE TABLE Clientes(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
telefone INT
);

CREATE TABLE Vendas(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
id_cliente INT,
id_vendedor INT,
FOREIGN KEY (id_cliente) REFERENCES Clientes (id),
FOREIGN KEY (id_vendedor) REFERENCES Vendedores (id)
);

CREATE TABLE Vendedores(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE Categorias(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE Controle(
id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
id_venda INT,
id_produto INT,
quantidade INT,
FOREIGN KEY (id_venda) REFERENCES Vendas (id),
FOREIGN KEY (id_produto) REFERENCES Produtos (id)
);

-- População da tabela Produtos --

INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Shampoo hidratante', 'Dove', 22.90, 1);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Condicionador hidratante', 'Dove', 25.90, 1);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Máscara hidratante', 'Dove', 32.90, 1);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Esmalte vermelho', 'Risqué', 4.90, 2);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Esmalte azul', 'Risqué', 4.90, 2);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Acetona', 'Impala', 2.90, 2);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Sabonete facial', 'Vult', 27.80, 3);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Tônico facial', 'Neutrogena', 17.70, 3);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Hidratante facial', 'Lóreal', 32.50, 3);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Hidratante corporal', 'Natura', 45.60, 4);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Esfoliante corporal', 'Avon', 14.99, 4);
INSERT INTO Produtos (nome, marca, preço, categoria) VALUES ('Sabonete corporal', 'Dove', 16.50, 4);

SELECT * FROM Produtos; -- Verificando --

-- População da tabela Clientes --

INSERT INTO Clientes (nome, telefone) VALUES ('Carol', 22567897);
INSERT INTO Clientes (nome, telefone) VALUES ('Daniela', 99875438);
INSERT INTO Clientes (nome, telefone) VALUES ('Jenn', 76534598);
INSERT INTO Clientes (nome, telefone) VALUES ('Luiz', 55376528);

SELECT * FROM Clientes; -- Verificando --

-- População da tabela Vendas --

INSERT INTO Vendas (id_cliente, id_vendedor) VALUES (1,1);
INSERT INTO Vendas (id_cliente, id_vendedor) VALUES (2,2);
INSERT INTO Vendas (id_cliente, id_vendedor) VALUES (3,3);
INSERT INTO Vendas (id_cliente, id_vendedor) VALUES (4,4);

SELECT * FROM Vendas; -- Verificando --

-- População da tabela Vendedores --

INSERT INTO Vendedores (nome) VALUES ('Ana');
INSERT INTO Vendedores (nome) VALUES ('Matheus');
INSERT INTO Vendedores (nome) VALUES ('Tay');
INSERT INTO Vendedores (nome) VALUES ('Bárbara');

SELECT * FROM Vendedores; -- Verificando --

-- População da tabela Categorias --

INSERT INTO Categorias (nome) VALUES ('Cabelo');
INSERT INTO Categorias (nome) VALUES ('Unhas');
INSERT INTO Categorias (nome) VALUES ('Face');
INSERT INTO Categorias (nome) VALUES ('Corpo');

SELECT * FROM Categorias; -- Verificando --

-- População da tabela Controle

INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (1, 1, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (1, 2, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (1, 7, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (1, 4, 2);
--
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (2, 12, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (2, 3, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (2, 6, 2);
--
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (3, 8, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (3, 11, 4);
--
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (4, 5, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (4, 9, 1);
INSERT INTO Controle (id_venda, id_produto, quantidade) VALUES (4, 10, 2);

SELECT * FROM Controle; -- Verificando --


-- Buscas pedidas -- 
 
 -- lista de produtos para duas categorias --
SELECT p.nome, c.nome categoria
FROM Produtos p JOIN Categorias c
ON p.categoria = c.id
WHERE p.categoria IN (1,2);

-- lista de produtos em ordem alfabética, selecionando as posições entre 5-11 --
SELECT * FROM Produtos
ORDER BY nome
LIMIT 7
OFFSET 4; -- Opção 01 - Organiza os nomes em ordem em alfabética, independentemente do id, e depois seleciona as posições entre 5 e 11 -- 

SELECT *
FROM Produtos
WHERE id >=5 AND id <=11
ORDER BY nome; -- Opção 02 - Seleciona os id's entre 5 e 11 e os coloca em ordem alfabética --

-- lista de preços distintos --
SELECT DISTINCT preço preços_distintos
FROM Produtos 
ORDER BY preço;

-- utilizar um "case/when/then/else/end" com pelo menos 3 condições --
SELECT nome, marca, preço,
CASE
    WHEN preço < 10.00 THEN 'Esse produto entra na promoção da etiqueta verde!'
    WHEN preço < 30.00  THEN 'Esse produto entra na promoção da etiqueta laranja!'
    WHEN preço < 40.00  THEN 'Esse produto entra na promoção da etiqueta vermelha!'
    ELSE 'Este produto não entra na promoção!'
END AS info_preço
FROM Produtos;

-- utilizar between --
SELECT nome, preço
FROM Produtos
WHERE preço BETWEEN 10.00 AND 20.00;

-- realizar uma consulta com pelo menos dois filtros, um deles utilizando not (and, or, not) --
SELECT * 
FROM Produtos
WHERE marca ='Dove' 
AND NOT nome ='Shampoo Hidratante';

-- realizar uma pesquisa de texto (like/ilike) --
SELECT * 
FROM Clientes
WHERE nome LIKE '%a%';


-- Extra - Tabela completa de vendas --
 
SELECT v.id id_venda, vv.nome vendedor, p.nome produtos, c_c.nome categoria, c.quantidade, cc.nome cliente
FROM Controle c JOIN Vendas v ON v.id = c.id_venda
JOIN Produtos p ON c.id_produto = p.id
JOIN Vendedores vv ON v.id_vendedor = vv.id
JOIN Clientes cc ON v.id_cliente = cc.id
JOIN Categorias c_c ON p.categoria = c_c.id;





