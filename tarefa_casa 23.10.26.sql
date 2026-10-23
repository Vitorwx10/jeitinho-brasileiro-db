-- Atividade de Casa - Banco de Dados

INSERT INTO Contatos (nome, telefone) 
VALUES ('Vitor Fernandes', '(55) 99999-9999');

INSERT INTO Mensagens (texto_mensagem, id_contatos) 
VALUES ('Olá! Esta é a minha mensagem de teste para a atividade de casa.', LAST_INSERT_ID());

SELECT 
    Contatos.nome, 
    Contatos.telefone,
    Mensagens.texto_mensagem, 
    Mensagens.data_envio
FROM Contatos
JOIN Mensagens ON Contatos.id_contato = Mensagens.id_contatos
WHERE Contatos.nome = 'Vitor Fernandes';