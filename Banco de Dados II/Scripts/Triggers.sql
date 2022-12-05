-- Trigger 01:
-- Controle de auditoria na tabela "filme", a qual utilizará a tabela "filme_auditoria" para geração dos logs.

-- Funcionamento: 
-- Caso um novo filme seja adicionado (INSERT), a coluna "id_filme_old" deverá permanecer vazia (null).
-- Caso um filme seja excluído (DELETE), a coluna "id_filme_new" deverá permanecer vazia (null).
-- Caso um filme seja alterado (UPDATE), nenhuma coluna ficará vazia.

-- id_filme_new (coluna para novos filmes adicionados).
-- id_filme_old (coluna para filmes alterados ou deletados).
-- dat_alt (data e hora corrente no momento da alteração).
-- usu_alt (usuário que fez a alteração).
-- dml (comando DML que foi executado).


-- Criação da Procedure:

create or replace function filme_log_func()
returns trigger 
as 
$$
Begin
	insert into filme_auditoria (id_filme_new, id_filme_old, dat_alt, usu_alt, dml) 
	values (new.idfilm, old.idfilm, current_timestamp, current_user, TG_OP);
return new;
END
$$
Language plpgsql;

-- Criação da Trigger:

create trigger filme_after_tg
after insert or update or delete
on filme
for each row
execute procedure filme_log_func();


-- Trigger 02:
-- Controle de assentos vendidos de acordo com a capacidade da sala que está exibindo o filme.
-- Funcionamento: O sistema irá somar a quantidade de ingressos vendidos e irá comparar com a capacidade da sala que o filme está sendo exibido.
-- Caso o total de ingresos fique igual a capacidade da sala, o sistema trará a mensagem de erro.

-- Criação da Procedure:

create or replace function verifica_disponibilidade()
returns trigger
as
$body$
declare
	conta numeric;
	capacidade numeric;
begin
	select count(*) into conta from ingresso i 
	inner join sala_filme sf on i.id_sal_fil = sf.id_sal_fil
	inner join sala s on sf.idsala = s.idsal
	where i.id_sal_fil = new.id_sal_fil;
	select capsal into capacidade from sala s
	inner join sala_filme sf on s.idsal = sf.idsala
	inner join ingresso i on sf.id_sal_fil = i.id_sal_fil
	where i.id_sal_fil = new.id_sal_fil
	group by capsal;
		if (conta >= capacidade) then
		raise exception 'Não há mais assentos disponíveis para a sessão atual'; 
	end if;
	return new;
end
$body$
language plpgsql;

-- Criação da Trigger:

create trigger disponibilidade_before_tg
before insert on ingresso
for each row
execute procedure verifica_disponibilidade();