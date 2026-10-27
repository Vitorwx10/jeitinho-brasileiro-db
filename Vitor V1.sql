-- ============================================================
-- 1) CRIAÇÃO DO BANCO DE DADOS
-- ============================================================
CREATE DATABASE DB_T05072C_Vitor_Fernandes;

-- ============================================================
-- 2) SELEÇÃO DO BANCO PARA USO
-- ============================================================
USE DB_T05072C_Vitor_Fernandes;

-- ============================================================
-- 3) CRIAÇÃO DA TABELA "Cliente"
--    Armazena dados dos clientes (nome, telefone, e-mail)
-- ============================================================
CREATE TABLE Cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) not NULL,
    telefone VARCHAR(30) NOT NULL,
    email VARCHAR(100)
);

-- ============================================================
-- 4) CRIAÇÃO DA TABELA "Produto"
--    Armazena dados dos produtos (nome, tipo, preço, estoque)
-- ============================================================
CREATE TABLE Produto(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) not NULL,
    tipo_produto VARCHAR(30) NOT NULL,
    preco DECIMAL(10,2) not NULL,
    estoque_produto DECIMAL(10,3) not NULL
);

-- ============================================================
-- 5) CRIAÇÃO DA TABELA "Pedido"
--    Relaciona cliente e produto (chaves estrangeiras)
-- ============================================================
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

-- ============================================================
-- 6) LISTAGEM DAS TABELAS DO BANCO
-- ============================================================
SHOW TABLES;

-- ============================================================
-- 7) RENOMEAR A TABELA "produto" PARA "Produto"
--    (ajusta o padrão de nomenclatura)
-- ============================================================
RENAME TABLE produto TO Produto;

-- ============================================================
-- 8) CRIAÇÃO DA TABELA "Contatos"
--    Tabela auxiliar de contatos (nome e telefone)
-- ============================================================
CREATE TABLE Contatos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

-- ============================================================
-- 9) INSERÇÃO DE REGISTROS INICIAIS NA TABELA "Contatos"
-- ============================================================
INSERT INTO Contatos (nome, telefone)
VALUES 
    ('Jose', '(11)98765-4321'),
    ('Joao', '(21)92587-6321'),
    ('Antonio', '(11)93654-7854'),
    ('Maria', '(11)96547-8523');

-- ============================================================
-- 10) CONSULTA TODOS OS REGISTROS DE "Contatos"
-- ============================================================
SELECT * FROM Contatos;

-- ============================================================
-- 11) EXCLUSÃO DE REGISTROS COM id ENTRE 5 E 8
--     (não afeta nada, pois os IDs vão de 1 a 4)
-- ============================================================
DELETE FROM Contatos
WHERE id >=5 and id<=8;

-- ============================================================
-- 12) ATUALIZAÇÃO DE TELEFONE (GENÉRICA / EXEMPLO)
--     Formata telefones de 8 dígitos no padrão "xxxx-xxxx"
--     ⚠️ Usa nomes de tabela/coluna genéricos ("sua_tabela",
--        "seu_campo_telefone") — deve ser adaptado ao seu caso.
-- ============================================================
UPDATE sua_tabela SET seu_campo_telefone = CONCAT(     
    SUBSTRING(seu_campo_telefone, 1, 4),     '-',     
    SUBSTRING(seu_campo_telefone, 5, 4) )
    WHERE LENGTH(seu_campo_telefone) = 8;

-- ============================================================
-- 13) ALTERAÇÃO DE TELEFONE DO CONTATO DE id = 3
--     (Antonio passa a ter o telefone (11)9449-4444)
-- ============================================================
UPDATE Contatos SET telefone ='(11)9449-4444' WHERE id=3;

-- ============================================================
-- 14) EXCLUSÃO DE REGISTROS (EXEMPLO GENÉRICO)
--     ⚠️ Placeholder — "table_name" e "condition" devem ser
--        substituídos por valores reais.
-- ============================================================
DELETE FROM table_name WHERE condition;

-- ============================================================
-- 15) CONSULTA TODOS OS CONTATOS APÓS ALTERAÇÕES
-- ============================================================
SELECT * FROM Contatos;

-- ============================================================
-- 16) CONSULTA APENAS O CONTATO "Maria"
-- ============================================================
SELECT * FROM Contatos
WHERE nome = 'Maria';

-- ============================================================
-- 17) CONSULTA CONTATOS ORDENADOS POR NOME (DECRESCENTE)
-- ============================================================
SELECT * FROM Contatos
ORDER BY nome DESC;

-- ============================================================
-- 18) CONSULTA CONTATOS CUJO TELEFONE CONTÉM "(11)"
-- ============================================================
SELECT * FROM Contatos
WHERE telefone LIKE '%(11)%';

-- ============================================================
-- 19) ATUALIZAÇÃO DO TELEFONE DO CONTATO "João"
--     ⚠️ Não encontra nada: o nome cadastrado é "Joao"
--        (sem acento) — por isso afeta 0 linhas.
-- ============================================================
UPDATE Contatos
SET telefone = '(55) 99999-9999'
WHERE nome = 'Vitor Fernandes';

-- ============================================================
-- 20) CONSULTA TODOS OS CONTATOS (VERIFICAÇÃO)
-- ============================================================
SELECT * from Contatos;

-- ============================================================
-- 21) CRIAÇÃO DA TABELA "Mensagens"
--     Armazena mensagens vinculadas a um contato (FK)
-- ============================================================
CREATE TABLE Mensagens(
    id_mensagens INT PRIMARY KEY AUTO_INCREMENT,
    texto_mensagem TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_contatos INT NOT NULL,
    FOREIGN KEY (id_contatos) REFERENCES Contatos(id_contato)
);

-- ============================================================
-- 22) RENOMEAR A COLUNA "id" DA TABELA "Contatos" PARA "id_contato"
--     (necessário para casar com a FK da tabela Mensagens)
-- ============================================================
ALTER TABLE Contatos RENAME COLUMN id to id_contato;

-- ============================================================
-- 23) INSERÇÃO DE MENSAGENS DE EXEMPLO
-- ============================================================
INSERT INTO Mensagens (texto_mensagem, id_contatos) VALUES
('eai, chegou meu pedido? to esperando ate agr', 1),
('mano, a entrega ta mt lenta, qq ta rolando?', 2),
('vlw ai, chegou tudo certinho!', 1);

-- ============================================================
-- 24) CONSULTA TODAS AS MENSAGENS
-- ============================================================
select * from Mensagens;

-- ============================================================
-- 25) CONSULTA MENSAGENS COM DADOS DO CONTATO (INNER JOIN)
--     Mostra apenas mensagens que têm contato correspondente
-- ============================================================
SELECT 
    Mensagens.id_mensagens, 
    Contatos.nome, 
    Contatos.telefone,
    Mensagens.texto_mensagem, 
    Mensagens.data_envio
FROM Mensagens
JOIN Contatos ON Mensagens.id_contatos = Contatos.id_contato;

-- ============================================================
-- 26) CONSULTA MENSAGENS MESMO SEM CONTATO (LEFT JOIN)
--     Inclui mensagens órfãs (sem contato vinculado)
-- ============================================================
SELECT 
    Mensagens.id_mensagens, 
    Contatos.nome, 
    Contatos.telefone,
    Mensagens.texto_mensagem, 
    Mensagens.data_envio
FROM Mensagens
LEFT JOIN Contatos ON Mensagens.id_contatos = Contatos.id_contato;

-- ==========================================
-- Atividade de Casa - Banco de Dados
-- ==========================================

-- 1. Inserir Contato (Substitua pelo seu nome e número)
INSERT INTO Contatos (nome, telefone) 
VALUES ('Vitor Fernandes', '(55)99999-9999');

-- 2. Enviar Mensagem (Usando a função LAST_INSERT_ID() para pegar o ID do contato que você acabou de criar)
INSERT INTO Mensagens (texto_mensagem, id_contatos) 
VALUES ('Olá! Esta é a minha mensagem de teste para a atividade de casa.', LAST_INSERT_ID());

-- 3. Consultar com JOIN (Exibindo o nome e a mensagem)
SELECT 
    Contatos.nome, 
    Contatos.telefone,
    Mensagens.texto_mensagem, 
    Mensagens.data_envio
FROM Contatos
JOIN Mensagens ON Contatos.id_contato = Mensagens.id_contatos
WHERE Contatos.nome = 'Vitor Fernandes';