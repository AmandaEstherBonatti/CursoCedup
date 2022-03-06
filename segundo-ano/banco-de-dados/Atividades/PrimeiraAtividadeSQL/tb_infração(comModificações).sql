#Desabilitar modop de segurança;
SET sql_safe_updates = 0;

SELECT * FROM bd_multas.tb_infracao;

INSERT INTO tb_infracao(IDInfracao, DataInfracao, ValorInfracao, Descricao, FKIDVeiculo, FKIDCondutor)
VALUES(3, '2021-03-06 10:00:00', 125.50, 'TRANSITAR EM VELOCIDADE SUPERIOR A PERMITIDA NA RODOVIA', 2, 2); 

INSERT INTO tb_infracao(IDInfracao, DataInfracao, ValorInfracao, Descricao, FKIDVeiculo, FKIDCondutor)
VALUES(4, '2021-03-06 12:00:00', 155.00, 'TRANSITAR NA FAIXA DE ACOSTAMENTO', 3, 3); 

#Atualizar valor da infração;
UPDATE tb_infracao SET ValorInfracao = 110.99 WHERE IDInfracao = 1;

UPDATE tb_infracao SET ValorInfracao = 200.00 WHERE IDInfracao = 2;

#Deletar informações sem horário cadastrado;
DELETE FROM tb_infracao WHERE TIME(DataInfracao) = '00:00:00';


