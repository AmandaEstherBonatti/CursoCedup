SELECT * FROM bd_multas.tb_veiculo;

#Cadastrar dados;
INSERT INTO tb_veiculo(IDVeiculo, Renavam, PlacaVeiculo, cor, FKIDModelo)
VALUES(3, 252565895, 'ABC-456', 'CINZA', 1);

#Atualizar informações;
UPDATE tb_veiculo SET placaVeiculo = 'aaa-1234', FKIDModelo = 2 WHERE IDVeiculo = 1;

UPDATE tb_veiculo SET placaVeiculo = 'bbb-2233', FKIDModelo = 3 WHERE IDVeiculo = 2;

