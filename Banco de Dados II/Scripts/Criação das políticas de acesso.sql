-- Criação dos grupos.

create group TI;

create group Gerente;

create group Administrativo;

create group Atendente;


-- Criação dos usuários.

create user everto
with 
superuser
password 'everto123';

create user gerente1
with password 'gerente123';

create user administrativo1
with password 'administrativo123';

create user atendente1
with password 'atendente123';



-- Adicionando os usuários aos grupos;

grant ti to everto;

grant gerente to gerente1;

grant administrativo to administrativo1;

grant atendente to atendente1;

-- Conceções de permissões ao grupo "TI".

-- ao grupo de "TI" é concedido total privilégio em todas as tabelas.

grant all privileges
on all tables in schema public
to desenvolvedor;

-- Conceções de permissões ao grupo "Gerente".

-- Ao grupo de "gerente" são concedidos apenas as permissões permitindo-o "mexer" de forma básica no banco, mas em todas as tabelas.

grant select, insert, delete, update
on all tables in schema public
to gerente;


-- Conceções de permissões ao grupo "Administrativo".

-- Ao grupo de "Administrativo" são concedidos algumas permissões básicas, mas tabelas pertinentes apenas a sua devida função.

grant select, insert, delete, update
on filme, diretor, genero, sala, sala_filme, premiacao, filme_premiacao 
to administrativo;


-- Conceções de permissões ao grupo "atendente".

-- Ao grupo de "atendente" são concedidos as mesmas permissões que o grupo "administrativo", mas apenas nas tabelas pertinentes apenas a sua devida função.

grant select, insert, delete, update
on filme, ticket, ingresso
to atendente;