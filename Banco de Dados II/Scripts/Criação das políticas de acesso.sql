-- Configuração de políticas de acesso: criação de usuários, grupos e concessão de privilégios.

-- Criação dos grupos.

create group Funcionario;

create group Desenvolvedor;

create group Scrum;

-- Criação dos usuários.

create user everto
with 
superuser
password 'everto123';

create user guilherme
with password 'guilherme123';

create user lucas
with password 'lucas123';

create user usuario
with password 'usuario123';


-- Adicionando os usuários aos grupos;

grant scrum to everto;

grant desenvolvedor to guilherme;

grant desenvolvedor to lucas;

grant funcionario to usuario;

-- Conceções de permissões ao grupo "Scrum".

grant all privileges
on all tables in schema public
to scrum;

-- Conceções de permissões ao grupo "Desenvolvedor".

grant insert, delete, update, references, trigger
on all tables in schema public
to desenvolvedor
with grant option;

-- Conceções de permissões ao grupo "Funcionario".

grant insert, delete, update
on all tables in schema public
to funcionario;
