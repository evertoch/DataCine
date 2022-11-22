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

create trigger filme_afeter_tg
after insert or update or delete
on filme
for each row
execute procedure filme_log_func();

