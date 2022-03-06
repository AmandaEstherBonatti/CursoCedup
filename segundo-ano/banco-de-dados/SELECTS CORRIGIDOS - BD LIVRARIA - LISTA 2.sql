#02 - Liste o nome, sobrenome e sexo de todos os autores do sexo masculino
select NomeAutor 'Nome do autor',
		SobrenomeAutor 'Sobrenome do autor',
		Sexo 'Sexo'
from TB_AUTOR
where Sexo='M';

#03 - Liste o nome, sobrenome de todos os autores que possuem o sobrenome iniciado em Med.
select NomeAutor 'Nome do autor',
		SobrenomeAutor 'Sobrenome do autor'
from TB_AUTOR
where SobrenomeAutor like 'MED%';

# 04.1 - Liste o nome, sobrenome e idade de cada autor
select NomeAutor 'Nome do autor',
		SobrenomeAutor 'Sobrenome do autor',
		DataNascimento 'Data de nascimento',
		year(now()) - year(DataNascimento) 'Idade do autor'
from TB_AUTOR;

# 04.2 - Liste a média de idade dos autores.
select avg(year(now()) - year(DataNascimento))  'Média de idade'
from TB_AUTOR;

# 05 - Mostre a maior idade dos autores.
select year(now()) - year(DataNascimento) 'Idade do autor'
from TB_AUTOR
order by year(now()) - year(DataNascimento) desc
limit 1;

# 06 - Liste a quantidade de autores com idade menor que 30 anos.
select count(Matricula) 'Quantidade de autores'
from TB_AUTOR
where year(now()) - year(DataNascimento)<=30;

# 07 - Liste a Matricula, nome, sobrenome e a idade do autor chamado ‘Lucas Silva’
select Matricula 'Número da matricula',
		concat(NomeAutor,' ',SobrenomeAutor) 'Nome Completo',
        year(now()) - year(DataNascimento) 'Idade do autor'
from TB_AUTOR
where NomeAutor='Lucas' and SobrenomeAutor='Silva';

# 08 - Informe a idade do autor mais jovem
select year(now()) - year(DataNascimento) 'Idade do autor'
from TB_AUTOR
order by year(now()) - year(DataNascimento) asc
limit 1;

# 09 - Liste a quantidade de autor com idade entre 20 e 30 anos que sejam do
#sexo masculino.
select count(Matricula) 'Quantidade de autores'
from TB_AUTOR
where year(now()) - year(DataNascimento) between 20 and 30
and Sexo='M';

# 10 - Liste o sexo e a quantidade de mulheres cadastradas na tabela autor.
select Sexo 'Sexo',
		count(Matricula) 'Quantidade de autores'
from TB_AUTOR
where Sexo='F';

# 11 - Listar o sexo e a quantidade de autores para cada sexo.
select Sexo 'Sexo',
		count(Matricula) 'Quantidade de autores'
from TB_AUTOR
group by Sexo;

# 12 - Listar o preço médio dos livros?
select round(avg(Preco),2) 'Média de preço'
from tb_livro;

#13 - Listar a sigla do assunto e o preço médio dos livros por assunto?
select FKSiglaAssunto 'Sigla do assunto',
	   round(avg(preco),2) 'Média de preço'
from TB_LIVRO
group by FKSiglaAssunto;

# 14 - Listar a sigla do assunto e o preço médio dos livros  por assunto
#que contenham o preço médio superior a 50,00?
select FKSiglaAssunto 'Sigla do assunto',
		round(avg(preco),2) 'Média de preço'
from TB_LIVRO
group by FKSiglaAssunto
having round(avg(preco),2)>=50.00;

# 15 - Listar a soma do preço de todos os livros?
select sum(Preco) 'Soma de preço dos livros'
from TB_LIVRO;

#16 - Qual o maior preço da tabela livros, para livros cujo assunto seja ‘P’?
Select FKSiglaAssunto 'Sigla do assunto',
	   max(Preco) 'Maior preço de livros'
from TB_LIVRO
where FKSiglaAssunto='P'
group by FKSiglaAssunto;

#17 - Qual o menor preço da tabela livros, para livros cujo assunto seja ‘B’?
select FKSiglaAssunto 'Sigla do assunto',
	   min(Preco) 'Menor preço de livros'
from TB_LIVRO
where FKSiglaAssunto='B'
group by FKSiglaAssunto;

#18 - Listar o assunto e quantos títulos de livro existem para cada assunto?
select FKSiglaAssunto 'Sigla do assunto',
		count(CodigoLivro) 'Quantidade de livros'
from TB_LIVRO
group by FKSiglaAssunto;

# 19 - Listar o assunto e o preço do livro mais caro para cada assunto
select FKSiglaAssunto 'Sigla do assunto',
	   max(Preco) 'Maior preço de livro'
from TB_LIVRO
group by FKSiglaAssunto;

#20 - Listar o código da editora e Quantos livros já foram lançados por cada editora?
select FKCodigoEditora 'Código da editora',
	   count(CodigoLivro) 'Quantidade de livros'
from TB_LIVRO
group by FKCodigoEditora;

#21 - Listar o código da editora, código do assunto e a média de preço para cada 
# editora e assunto do livro?
select FKCodigoEditora 'Código da editora',
	   FKSiglaAssunto 'Código do assunto',
	   round(avg(preco),2) 'Média de preço'
from TB_LIVRO
group by FKCodigoEditora, FKSiglaAssunto;

# 22 - Listar o código do assunto e a soma de preço dos livros com a soma total
# superior a 50,00?
select FKSiglaAssunto 'Sigla do assunto',
		sum(Preco) 'Soma do preço'
from TB_LIVRO
group by FKSiglaAssunto
having sum(Preco)>=50;

#23 - Listar o código do assunto e a quantidade de livros por assunto, dos assuntos que
# possuem mais  2 ou mais livros cadastrados
select FKSiglaAssunto 'Sigla do assunto',
		count(CodigoLivro) 'Quantidade de livros'
from TB_LIVRO
group by FKSiglaAssunto
having count(CodigoLivro)>=2;

# 24 - Listar o ano de lançamento e a quantidade de livros lançados para cada ano?
select year(Lancamento) 'Ano de lançcamento',
	   count(CodigoLivro) 'Quantidade de livros'
from TB_LIVRO
group by year(Lancamento);

#25 - Listar o código do assunto, quantidade, soma e média de preço dos livros para
# cada assunto?
select FKSiglaAssunto 'Sigla do assunto',
		count(CodigoLivro) 'Quantidade de livros',
		sum(Preco) 'Soma do preço',
		round(avg(preco),2) 'Média de preço'
from TB_LIVRO
group by FKSiglaAssunto;

#26 - Listar somente os assuntos dos livros, sem aparecer dados repetidos.
select distinct(FKSiglaAssunto)
from TB_LIVRO;

# 27 - Gerar listagem dos livros contendo o código do livro, título, preço e assunto.
# A listagem deverá estar ordenada em ordem crescente de assunto e decrescente de preço.
select CodigoLivro 'Código do livro',
		Titulo 'Título do livro',
		Preco 'Preço do livro',
        FKSiglaAssunto 'Sigla do assunto'
from TB_LIVRO
order by FKSiglaAssunto asc,
		 Preco desc;





