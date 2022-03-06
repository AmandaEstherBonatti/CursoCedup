# CADASTRO DE VEÍCULOS
#Inserindo dados nas tabelas criadas;
USE BD_MULTAS;
INSERT INTO `TB_VEICULO` 
	(`IDVeiculo`, `Renavam`, `COR`, `Modelo`, `QuantidadeInfracoes`) 
VALUES 
	('1', '1010353765', 'PRETO', 'PALIO', '1');
    
INSERT INTO `TB_VEICULO` 
	(`IDVeiculo`, `Renavam`, `COR`, `Modelo`, `QuantidadeInfracoes`) 
VALUES 
	('2', '2010351210', 'AZUL', 'CELTA', '1');
    
# CADASTRO DE CONDUTORES
INSERT INTO `TB_CONDUTOR` 
	(`IDCONDUTOR`, `NomeCondutor`, `IDADE`, `Sexo`) 
VALUES 
	('1', 'Antonio Santos', '35', 'M');
    
INSERT INTO `TB_CONDUTOR` 
	(`IDCONDUTOR`, `NomeCondutor`, `IDADE`, `Sexo`) 
VALUES 
	('2', 'Carla Dias', '39', 'F');

# CADASTRO DE INFRAÇÕES
INSERT INTO `TB_INFRACAO` 
	(`IDINFRACAO`, `DataInfracao`, `Descricao`, `FKIDVEICULO`, `FKIDCondutor`) 
VALUES 
	('1', '20210228', 'ESTACIONAR EM LOCAL PROÍBIDO', '1', '1');
    
INSERT INTO `TB_INFRACAO` 
	(`IDINFRACAO`, `DataInfracao`, `Descricao`, `FKIDVEICULO`, `FKIDCondutor`) 
VALUES 
	('2', '20210305', 'AVANÇAR SINAL VERMELHO', '1', '1');
    
    
