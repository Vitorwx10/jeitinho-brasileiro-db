    CREATE DATABASE DB_T05072C_Vitor_Fernandes;

    USE DB_T05072C_Vitor_Fernandes;

    CREATE TABLE Cliente(
        id_cliente INT PRIMARY KEY AUTO_INCREMENT,
        nome_cliente VARCHAR(100) not NULL,
        telefone VARCHAR(30) NOT NULL,
        email VARCHAR(100)
    );

    CREATE TABLE Produto(
        id_produto INT PRIMARY KEY AUTO_INCREMENT,
        nome_produto VARCHAR(100) not NULL,
        tipo_produto VARCHAR(30) NOT NULL,
        preco DECIMAL(10,2) not NULL,
        estoque_produto DECIMAL(10,3) not NULL
        );

    CREATE TABLE Pedido(
        id_pedido INT PRIMARY KEY AUTO_INCREMENT,
        valor_total DECIMAL(10,2) not NULL,
        quantidade DECIMAL(10,3) NOT NULL,
        forma_de_pagamento VARCHAR(15) NOT NULL,
        id_cliente INT,
        id_produto INT,
        FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
        FOREIGN KEY(id_produto) REFERENCES produto(id_produto)
        );

SHOW TABLES;

RENAME TABLE produto TO Produto;

CREATE TABLE Contatos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

INSERT INTO Contatos (nome, telefone)
VALUES 
    ('Jose', '(11)98765-4321'),
    ('Joao', '(21)92587-6321'),
    ('Antonio', '(11)93654-7854'),
    ('Maria', '(11)96547-8523');

SELECT * FROM Contatos;

DELETE FROM Contatos
WHERE id >=5 and id<=8;

UPDATE sua_tabela SET seu_campo_telefone = CONCAT(     
    SUBSTRING(seu_campo_telefone, 1, 4),     '-',     
    SUBSTRING(seu_campo_telefone, 5, 4) )
    WHERE LENGTH(seu_campo_telefone) = 8;


-- Alterar colunas
update Contatos set telefone ='(11)9449-4444' where id=3;

-- Deletar colunas
DELETE FROM table_name WHERE condition;

SELECT * FROM Contatos;

SELECT * FROM Contatos
WHERE nome = 'Maria';

SELECT * FROM Contatos
ORDER BY nome DESC;

SELECT * FROM Contatos
WHERE telefone LIKE '%(11)%';

UPDATE Contatos
SET telefone = '(21) 90000-0000'
WHERE nome = 'João';

SELECT * from Contatos;











