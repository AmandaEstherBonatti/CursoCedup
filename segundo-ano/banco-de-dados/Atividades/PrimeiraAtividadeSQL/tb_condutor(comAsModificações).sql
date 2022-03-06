SELECT * FROM bd_multas.tb_condutor;

#Cadastrando dados;
INSERT INTO tb_condutor(IDCondutor, NomeCondutor, SobrenomeCondutor, Sexo, DataNascimento)
VALUES(3,'Celso', 'Elias', 'M', '1975-10-11');

#Atualizando dados que estão faltando na tabela;
UPDATE tb_condutor SET NomeCondutor = 'Carla', SobrenomeCondutor = 'Dias', DataNascimento = '1979-10-05' WHERE IDCondutor = 1;

UPDATE tb_condutor SET NomeCondutor = 'Antonio', SobrenomeCondutor = 'Santos', DataNascimento = '1980-10-05' WHERE IDCondutor = 2;

