# LISTAR A QUANTIDADE DE PACIENTES CADASTRADOS
SELECT COUNT(PKPACIENTE) 'Quantidade de pacientes'
FROM PACIENTE;

# LISTAR O NOME DO PACIENTE E CONTAR A QUANTIDADE DE CARACTERES DE CADA NOME
SELECT NomePaciente 'Nome do paciente',
	   char_length(NomePaciente) 'Quantidade de caracteres'
FROM PACIENTE;

# LISTAR O NOME DO PACIENTE EM LETRAS MAIÚSCULAS E MINÚSCULAS
SELECT UCASE(NomePaciente)  'TUDO MAIÚSCULO',
	   LCASE(NomePaciente)  'tudo minúsculo'
FROM PACIENTE;
       
# LISTAR TODOS OS DADOS DO PACIENTE PEDRO
SELECT *
FROM PACIENTE
WHERE NomePaciente='Pedro';

# LISTAR TODOS OS DADOS DOS PACIENTES EM ORDEM ALFABÉTICA    
SELECT *
FROM PACIENTE
ORDER BY NomePaciente ASC;       
       
# Listar o código, data e paciente das consultas ordenado pela maior data       
SELECT PKCONSULTA 'CÓDIGO DA CONSULTA',
	   DataConsulta 'DATA DA CONSULTA',
	   FKPKPACIENTE 'CÓDIGO DO PACIENTE'
FROM CONSULTA
ORDER BY DataConsulta DESC;

# Listar a quantidade de consultas para cada data 
SELECT DATE(DataConsulta) 'DATA DAS CONSULTAS',
	   COUNT(PKCONSULTA) 'QUANTIDADE DE CONSULTAS'
FROM CONSULTA
GROUP BY DATE(DataConsulta);

# Listar o código do médico e a quantidade consultas para cada médico
SELECT FKFKMEDICO  'CÓDIGO DO MÉDICO',
	   COUNT(PKCONSULTA)  'QUANTIDADE DE CONSULTAS'
FROM CONSULTA
GROUP BY FKFKMEDICO;

# Listar data e hora da consulta mais antiga e da consulta mais recente
select min(DataConsulta) 'Consulta mais antiga',
	   max(DataConsulta) 'Consulta mais recente'
from consulta;

# Listar o código da consulta, a data da consulta, nome do mês e nome do dia da semana
select PKCONSULTA 'Código da consulta',
	   DataConsulta 'Data e hora da consulta',
	   monthname(DataConsulta) 'Nome do mês',
       dayname(DataConsulta) 'Nome do dia'
from CONSULTA;   

# Listar o código da consulta, data da consulta das consultas marcadas para
#quinta-feira;
select PKCONSULTA 'Còdigo da consulta',
		DataConsulta 'Data e hora da consulta',
		dayname(DataConsulta) 'Nome do dia da semana'
from consulta
where dayname(DataConsulta)='Thursday';
  
# Listar o código e data das consultas marcadas entre o dia 1 e dia 15 de cada
# mês
select PKCONSULTA 'Código da consulta',
		DataConsulta 'Data e hora da consulta',
        monthname(DataConsulta) 'Mês da consulta'
from CONSULTA
where day(DataConsulta) between 1 and 15;
        
# Listar a quantidade de consultas, soma do preço total
select count(PKCONSULTA) 'Quantidade de consultas',
	   sum(ValorConsulta)  'Soma do valor total das consultas'
from consulta;

# Listar o nome do mês, a quantidade de consultas e a soma do preço total
# das consultas em cada mÊs
select monthname(DataConsulta) 'Mês da consulta',
		count(PKCONSULTA)  'Quantidade de consultas',
		sum(ValorConsulta) 'Soma do valor total das consultas'
from consulta
group by monthname(DataConsulta);

# Listar a média do preço das consultas
select round(avg(ValorConsulta),2) 'Média do preço de consultas'
from consulta;

# Listar o código do paciente, a quantidade de consultas, a soma do valor
# de suas consultas e a média do valor de suas consultas para cada paciente
select FKPKPACIENTE 'Código do paciente',
		count(PKCONSULTA) 'Quantidade de consultas',
		sum(ValorConsulta) 'Soma do valor das consultas',
		round(avg(ValorConsulta),2) 'Média do valor das consultas'
from consulta
group by FKPKPACIENTE;

# Listar o código do médico e a soma do valor total das consultas do médico 1
select FKFKMEDICO 'Código do médico',
		sum(ValorConsulta) 'Soma do valor total das consultas'
from consulta
where FKFKMEDICO=1;

# Listar o nome e sobrenome dos pacientes concatenados
select concat(NomePaciente, ' ', SobrenomePaciente) 'Nome completo'
from paciente;











