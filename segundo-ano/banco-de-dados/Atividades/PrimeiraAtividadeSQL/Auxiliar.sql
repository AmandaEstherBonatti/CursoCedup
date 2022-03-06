USE BD_MULTAS;

#///Modificações feitas na tabela do condutor que estava incompleta;
ALTER TABLE tb_condutor ADD COLUMN SobrenomeCondutor VARCHAR(45) AFTER NomeCondutor;

ALTER TABLE tb_condutor DROP COLUMN idade;D

ALTER TABLE tb_condutor ADD COLUMN DataNascimento DATE;

#///Modificações na tabela infração;
ALTER TABLE tb_infracao ADD COLUMN ValorInfracao DOUBLE(5,2) AFTER DataInfracao;

#///Modifiações feitas na tabela veiculo;
ALTER TABLE tb_veiculo ADD COLUMN PlacaVeiculo VARCHAR(9) AFTER Renavam;

ALTER TABLE tb_veiculo DROP COLUMN QuantidadeInfracoes;

ALTER TABLE tb_veiculo DROP COLUMN Modelo;

CREATE TABLE tb_modelo(
IDModelo INT(4) NOT NULL UNIQUE,
NomeModelo VARCHAR(45) NOT NULL UNIQUE,
PRIMARY KEY(IDModelo)
);

ALTER TABLE tb_veiculo ADD COLUMN FKIDModelo INT(5);

ALTER TABLE tb_veiculo ADD CONSTRAINT FKYB_VEICULO FOREIGN KEY(FKIDModelo) REFERENCES tb_modelo(IDModelo);

#CALCULAR A IDADE DE CADA CONDUTOR
SELECT
	NOMECONDUTOR, SOBRENOMECONDUTOR,
	YEAR(NOW())-YEAR(DATANASCIMENTO) `IDADE`
FROM
	TB_CONDUTOR;

#CALCULAR A QUANTIDADE DE INFRAÇÕES DE CADA VEÍCULO
SELECT
	RENAVAM, PlacaVeiculo,
	COUNT(IDINFRACAO) `INFRAÇÕES`
FROM
	TB_VEICULO
INNER JOIN
	TB_INFRACAO
ON
	IDVeiculo=FKIDVEICULO
GROUP BY
	RENAVAM;


