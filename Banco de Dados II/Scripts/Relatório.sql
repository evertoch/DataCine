-- 1
create view vw_filme_tempo as
	select f.nomBR "Nome em português (PT-BR)", f.nomEN "Nome em Ingês (EN-US)", f.durfil "Tempo de duração",  g.nomgen "Gênero do filme"
	from filme f
	inner join genero g on f.idgen = g.idgen
	order by durfil desc;
	
select * from vw_filme_tempo;

-- 2 
create view vw_filme_sala as
select f.nomBR "Nome do filme (PT-BR)", f.nomEN "Nome do filme (EN-US)", s.nomsal "Sala de exibição"
from sala_filme sf
inner join filme f on sf.idfilm = f.idfilm 
inner join sala s on sf.idsala = s.idsal
where f.durfil > '1:30'
order by s.nomsal desc;

select * from vw_filme_sala;

-- 3 
create view vw_filme_ingressos as
select f.idfilm "Código do filme", f.nomBR "Nome do filme (PT-BR)", f.nomen "Nome do filme (EN-US)", f.mesexi "Mês da bilheteria", extract(month from i.datven) "Mês da venda", extract(year from i.datven) "Ano da venda", count(i.idfilm) "Quantidade de ingressos vendidos"
from filme f 
inner join ingresso i on f.idfilm = i.idfilm 
where extract(year from i.datven) between '2020' and '2021'
group by f.idfilm, i.datven, f.nombr, f.mesexi, i.datven, f.nomen 
order by "Quantidade de ingressos vendidos" desc;

select * from vw_filme_ingressos;

-- 4
create view vw_filme_valor as
select f.idfilm "Código do filme", f.nomBR "Nome do filme (PT-BR)", f.nomen "Nome do filme (EN-US)", count(i.idfilm) "Quantidade de ingressos vendidos", sum(i.valing) "Valor total R$"
from filme f
inner join ingresso i on f.idfilm = i.idfilm
inner join genero g on f.idgen = g.idgen
where f.anolanfan >= 2018
and f.claind >= 12
and g.nomgen not in ('Drama')
group by f.idfilm, f.nomBR, f.nomen
order by "Valor total R$" desc;

select * from vw_filme_valor;

