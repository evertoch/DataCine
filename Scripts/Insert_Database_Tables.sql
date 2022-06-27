-- insert da tabela premiação
insert into premiacao (nompre, anopre) values ('Grande Prêmio do Cinema Brasileiro', 2021);
insert into premiacao (nompre, anopre) values ('Troféu Barroco', 2021);
insert into premiacao (nompre, anopre) values('Grande Prêmio do Cinema Brasileiro', 2022);
insert into premiacao (nompre, anopre) values('Troféu Barroco', 2022);

-- insert na tabela sala
insert into sala (nomsal, capsal) values('Sala 1', 200);
insert into sala (nomsal, capsal) values('Sala 2', 150);
insert into sala (nomsal, capsal) values('Sala 3', 100);
insert into sala (nomsal, capsal) values('Sala 4', 127);
insert into sala (nomsal, capsal) values('Sala 5', 82);

-- insert na tabela genero
insert into genero (nomgen) values('Terror');
insert into genero (nomgen) values('Românce');
insert into genero (nomgen) values('Drama');
insert into genero (nomgen) values('Ficção Cientifica');
insert into genero (nomgen) values('Ação');
insert into genero (nomgen) values('Animação');
insert into genero (nomgen) values('Comédia');

-- insert na tabela cinema
insert into cinema (nomcin) values('Cine Peperi - SMO');
insert into cinema (nomcin) values('Cine Peperi - Itapiranga');

-- insert na tabela diretor
insert into diretor (nomdir) values('Steven Spielberg');
insert into diretor (nomdir) values('Stanley Kubrick');
insert into diretor (nomdir) values('Bernardo Bertolucci');
insert into diretor (nomdir) values('Sam Raimi');

-- insert na tabela função
insert into funcao (nomfun) values('pipoqueiro');
insert into funcao (nomfun) values('atendente');
insert into funcao (nomfun) values('lanterna');
insert into funcao (nomfun) values('segurança');
insert into funcao (nomfun) values('operador');
insert into funcao (nomfun) values('faxineiro(a)');

-- insert na tabela horario
insert into horario (hor) values('19:00');
insert into horario (hor) values('16:00');
insert into horario (hor) values('21:30');

-- insert na tabela funcionario
insert into funcionario values(1, 'Everto Carlos Holleweiger', '01.01.2020', 2000, 1);
insert into funcionario values(2, 'Lucas da Rosa', '06.01.2021', 1000, 1);
insert into funcionario values(3, 'Guilherme Zeni', '01.01.2022', 1800, 1);
insert into funcionario values(4, 'Alfredo Marques', '11.01.2020', 1900, 2);
insert into funcionario values(5, 'Joselino Lima', '11.01.2020', 1900, 2);
insert into funcionario values(6, 'Katiuscia Souza', '18.01.2020', 1400, 2);

-- insert na tabela horario_funcionario
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 1, 1);
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 2, 3);
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 3, 6);
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 4, 4);
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 5, 2);
insert into horario_funcionario (idhor, idfuncionario, idfuncao) values (1, 6, 6);

-- insert na tabela filme
insert into filme (idfilm, nomBR, nomEN, anolanfan, sinfil, dubleg, durfil, claind, mesexi, iddir, idgen) values (1, 'Doutor Estranho 2', 'Stranger Doctor 2', 2022, 'Sinopse teste', 1, '02:00', 16, 3, 4, 5);
insert into filme (idfilm, nomBR, nomEN, anolanfan, sinfil, dubleg, durfil, claind, mesexi, iddir, idgen) values (2, 'Sonic 2', 'Sonic 2', 2022, 'Teste', 1,'1:45', 16, 3, 2, 6);

-- insert na tabela ingresso
insert into ingresso (datven, idfilm, valing) values ('14/01/2021', 1, 12.00);
insert into ingresso (datven, idfilm, valing) values ('14/03/2021', 1, 24.00);
insert into ingresso (datven, idfilm, valing) values ('14/03/2022', 1, 24.00);
insert into ingresso (datven, idfilm, valing) values ('14/01/2021', 1, 12.00);
insert into ingresso (datven, idfilm, valing) values ('14/03/2022', 1, 12.00);
insert into ingresso (datven, idfilm, valing) values ('14/03/2022', 1, 12.00);
insert into ingresso (datven, idfilm, valing) values ('16/01/2021', 2, 12.00);
insert into ingresso (datven, idfilm, valing) values ('16/02/2022', 2, 12.00);
insert into ingresso (datven, idfilm, valing) values ('16/04/2022', 2, 24.00);

-- insert na tabela sala_filme
insert into sala_filme (idsala, idfilm, idhor) values (1, 2, 1);
insert into sala_filme (idsala, idfilm, idhor) values (2, 1, 2);
insert into sala_filme (idsala, idfilm, idhor) values (4, 2, 1);
insert into sala_filme (idsala, idfilm, idhor) values (3, 1, 3);
insert into sala_filme (idsala, idfilm, idhor) values (5, 2, 3);

-- insert na tabela filme_premiacao
insert into filme_premiacao (idpre, idfilm, gan) values (4, 2, 0);
