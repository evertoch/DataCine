select f.nomBR "Nome do filme em português (PT-BR)", f.nomEN "Nome em Ingês (EN-US)", f.durfil "Tempo de duração",  g.nomgen "Genêro do filme"
from filme f
inner join genero g on f.idgen = g.idgen
order by durfil desc


select f.nomBR "Nome do filme BR", f.nomEN "Nome em Ingês", s.nomsal "Sala de exibição"
from sala_filme sf
inner join filme f on sf.idfilm = f.idfilm 
inner join sala s on sf.idsala = s.idsal
where f.durfil > '1:30'
order by s.nomsal desc;


select f.idfilm "Código do filme", f.nomBR "Nome em português", f.mesexi "Mês da bilheteria", extract(month from i.datven) "Mês da venda", extract(year from i.datven) "Ano da venda", count(i.idfilm) "Quantidade de ingressos vendidos"
from filme f 
inner join ingresso i on f.idfilm = i.idfilm 
where extract(year from i.datven) between '2020' and '2022'
group by f.idfilm, i.datven, f.nombr, f.mesexi, i.datven;