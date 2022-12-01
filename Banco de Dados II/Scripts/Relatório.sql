-- 1 
-- Relacionar o nome do filme, tempo de duração e o gênero de todos os filmes. 
-- Ordene o relatório do filme mais longo(tempo) para o filme mais curto;

create view vw_filme_tempo as
	select f.nomBR "Nome em português (PT-BR)", f.nomEN "Nome em Ingês (EN-US)", f.durfil "Tempo de duração",  g.nomgen "Gênero do filme"
	from filme f
	inner join genero g on f.idgen = g.idgen
	order by durfil desc;
	
select * from vw_filme_tempo;

-- 2 
-- Relacionar o nome do filme e o nome da sala para todos os filmes. 
-- Filtre somente filmes com duração mínima de 90 minutos.
-- Ordene o relatório de forma descendente pelo nome da sala;

create view vw_filme_sala as
select f.nomBR "Nome do filme (PT-BR)", f.nomEN "Nome do filme (EN-US)", s.nomsal "Sala de exibição"
from sala_filme sf
inner join filme f on sf.idfilm = f.idfilm 
inner join sala s on sf.idsala = s.idsal
where f.durfil > '1:30'
order by s.nomsal desc;

select * from vw_filme_sala;

-- 3 
-- Relacionar o código do filme, nome do filme, mês da bilheteria, quantidade total de ingressos vendidos no mês para meses entre anos de 2020 e 2021. 
-- Ordene o relatório do filme com mais vendas(em termos de quantidade de ingressos) para o produto com menos vendas;

create view vw_filme_ingressos as
select sf.idfilm "Código do filme", f.nomBR "Nome do filme (PT-BR)", f.nomen "Nome do filme (EN-US)", f.mesexi "Mês da bilheteria", extract(month from i.datven) "Mês da venda", extract(year from i.datven) "Ano da venda", count(i.id_sal_fil) "Quantidade de ingressos vendidos"
from sala_filme sf 
inner join filme f on f.idfilm = sf.idfilm 
inner join ingresso i on sf.id_sal_fil = i.id_sal_fil
where extract(year from i.datven) between '2020' and '2021'
group by sf.idfilm, i.datven, f.nombr, f.mesexi, f.nomen 
order by "Quantidade de ingressos vendidos" desc;

select * from vw_filme_ingressos;

-- 4
-- Relacionar o código do filme, nome do filme e o total de bilheteria(valores).
-- Filtrar somente filmes, excetuandose dramas, lançados a partir de 2018 e com restrição de idade para maiores de 12 anos. 
-- Ordene o relatório do filme com mais bilheteria para o filme com menos bilheteria.
create view vw_filme_valor as
select f.idfilm "Código do filme", f.nomBR "Nome do filme (PT-BR)", f.nomen "Nome do filme (EN-US)", count(i.id_sal_fil) "Quantidade de ingressos vendidos", sum(i.valing) "Valor total R$"
from filme f
inner join sala_filme sf on f.idfilm = sf.idfilm
inner join ingresso i on sf.id_sal_fil = i.id_sal_fil
inner join genero g on f.idgen = g.idgen
where f.anolanfan >= 2018
and f.claind >= 12
and g.nomgen not in ('Drama')
group by f.idfilm, f.nomBR, f.nomen
order by "Valor total R$" desc;

select * from vw_filme_valor;

