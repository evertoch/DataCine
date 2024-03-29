-- FUNCTION 01:
-- Function para calcular a bilheteria de um filme, trazendo o total de ingressos e o valor arrecadado.

-- FUNCIONMANETO:
-- O parâmetro a ser passado na chamada da function deverá ser o ID do filme.

-- Criação da Procedure:

create or replace function func_bilheteria(id_film integer) 
returns SETOF record as 
$body$
declare
begin 
	return query
select id_film, count(*), sum(valing) from ingresso i 
	inner join sala_filme sf on i.id_sal_fil = sf.id_sal_fil 
	inner join filme f on sf.idfilm = f.idfilm
	where f.idfilm = id_film;
return;
end;
$body$
language plpgsql;
	
-- Chamada da procedure com o parâmetro (id_fil).

select * from func_bilheteria(2) as (Id_filme integer, ingressos_vendidos int8, valor_total numeric); 


-- FUNCTION 02:
-- Function para calcular a quantidade total de um determinado alimento vendido e o valor total de suas vendas (somando o valor de cada item).

-- FUNCIONMANETO:
-- O parâmetro a ser passado na chamada da function deverá ser o ID do alimento.

-- Criação da Procedure:

create or replace function func_qtd_pro(id_alimento integer) 
returns SETOF record as 
$body$
declare
begin 
	return query
		select desali, count(valali), sum(valali) from ticket t 
		inner join cardapio c ON t.idali = c.idali
		where c.idali = id_alimento
		group by desali;
return;
end;
$body$
language plpgsql;

-- Chamada da Procedure:

select * from func_qtd_pro(1) as (Descricao varchar, Quantidade int8, valor_total int8); 