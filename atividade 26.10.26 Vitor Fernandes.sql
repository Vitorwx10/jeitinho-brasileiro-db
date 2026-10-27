-- Atividade 26-10-26

CREATE TABLE padaria_fornecedor(
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome          VARCHAR(150) NOT NULL,
    telefone      VARCHAR(20) NOT NULL
);

CREATE TABLE padaria_produtos (
    id_produto    INT PRIMARY KEY AUTO_INCREMENT,
    nome          VARCHAR(150) NOT NULL,
    preco         DECIMAL(10,2) NOT NULL,
    id_fornecedor INT,
    quantidade_estoque DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES padaria_fornecedor(id_fornecedor)
);

CREATE TABLE padaria_venda(
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE padaria_itens_venda(
    id_item        INT PRIMARY KEY AUTO_INCREMENT,
    id_venda       INT NOT NULL,
    id_produto     INT NOT NULL,
    quantidade     INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda)   REFERENCES padaria_venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES padaria_produtos(id_produto)
);

SELECT * FROM padaria_fornecedor;
INSERT INTO padaria_fornecedor (nome, telefone)
VALUES 
    ('Tom', '(11)77777-7777'),
    ('Jerry', '(21)55555-5555'),
    ('Scooby', '(11)4002-8922'),
    ('Pica-Pau', '(11)17171-7171'),
    ('Chico Bento', '(11)98989-8989');

SELECT * FROM padaria_produtos;
INSERT INTO padaria_produtos (nome, preco, id_fornecedor, quantidade_estoque)
VALUES 
    ('pao frances', 11.90, 1, 10.000),
    ('sovado', 8.90, 2, 30.000),
    ('brigadeiro', 2.99, 3, 100.000),
    ('sonho', 6.90, 4, 20.000),
    ('baguete', 7.99, 5, 15.000);

SELECT * FROM padaria_venda;
INSERT INTO padaria_venda (data_venda)
VALUES 
    ('2010-12-31 14:35:22'),
    ('2017-10-20 09:15:45'),
    ('2020-09-15 19:42:10'),
    ('2019-07-27 11:05:33'),
    ('2025-03-12 16:20:00');

SELECT * FROM padaria_itens_venda;
INSERT INTO padaria_itens_venda (id_venda, id_produto, quantidade, preco_unitario)
VALUES 
    (1, 1, 5, 40.00),
    (2, 2, 3, 20.00),
    (3, 3, 7, 45.00),
    (4, 4, 2, 10.00),
    (5, 5, 5, 30.00);