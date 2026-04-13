CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cidade VARCHAR(50)
);
CREATE TABLE produtos (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
preco DECIMAL(10,2)
);
CREATE TABLE pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
produto_id INT,
quantidade INT,
data DATE,
FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, cidade) VALUES
('Ana', 'São Paulo'),
('Pedro', 'Rio de Janeiro'),
('Bruna', 'Belo Horizonte'),
('Vitor', 'São Paulo');

INSERT INTO produtos (nome, preco) VALUES
('Notebook', 3500),
('Mouse', 120),
('Teclado', 250),
('Headset', 300);

INSERT INTO pedidos (cliente_id, produto_id, quantidade, data) VALUES
(1, 1, 1, '2024-01-10'),
(2, 2, 3, '2024-01-15'),
(3, 3, 2, '2024-01-20'),
(1, 2, 5, '2024-02-01'),
(4, 4, 1, '2024-02-10');
SELECT * FROM clientes;
SELECT SUM(p.quantidade * pr.preco) AS faturamento_total
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id;

SELECT pr.nome, SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.nome
ORDER BY total_vendido DESC;

SELECT c.cidade, SUM(p.quantidade * pr.preco) AS faturamento
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY c.cidade;

SELECT c.nome, SUM(p.quantidade) AS total_comprado
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.nome
ORDER BY total_comprado DESC;