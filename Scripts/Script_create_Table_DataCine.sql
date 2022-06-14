CREATE TABLE Cinema (
  codcin SERIAL NOT NULL, 
  nomcin varchar(40), 
  PRIMARY KEY (codcin));
 
COMMENT ON TABLE Cinema IS 'Coluna para cadastro do cinema        ';
COMMENT ON COLUMN Cinema.codcin IS 'Coluna para código do cinema';
COMMENT ON COLUMN Cinema.nomcin IS 'Coluna para cadastro do nome do cinema';

CREATE TABLE diretor (
  iddir  SERIAL NOT NULL, 
  nomdir varchar(45), 
  PRIMARY KEY (iddir));
 
COMMENT ON COLUMN diretor.iddir IS 'Identificador do cadastro de diretores';
COMMENT ON COLUMN diretor.nomdir IS 'Tabela para cadastro do nome do diretor';

CREATE TABLE filme (
  idfilm    SERIAL NOT NULL, 
  nomBR     varchar(45), 
  nomEN     varchar(45) NOT NULL, 
  anolanfan int4, 
  sinfil    varchar(255), 
  dubleg    int4 DEFAULT 0, 
  iddir     int4 NOT NULL, 
  idgen     int4 NOT NULL, 
  durfil    time not null,
  PRIMARY KEY (idfilm));
 
COMMENT ON TABLE filme IS 'Tabela para cadastro do filme';
COMMENT ON COLUMN filme.idfilm IS 'Identificador do filme';
COMMENT ON COLUMN filme.nomBR IS 'Nome do filme no Brasil';
COMMENT ON COLUMN filme.nomEN IS 'Nome do filme fora do Brasil';
COMMENT ON COLUMN filme.anolanfan IS 'Ano de lançamento do filme';
COMMENT ON COLUMN filme.sinfil IS 'Coluna para breve descrição da sinopse do filme';
COMMENT ON COLUMN filme.dubleg IS 'Flag de definição para filme dublado ou não (não encontrei o tipo booleano).';

CREATE TABLE funcao (
  idfun  SERIAL NOT NULL, 
  nomfun varchar(45), 
  PRIMARY KEY (idfun));
 
COMMENT ON TABLE funcao IS 'Tabela de cadastro das funções do funcionário';
COMMENT ON COLUMN funcao.idfun IS 'Identificador da função';
COMMENT ON COLUMN funcao.nomfun IS 'Nome da função';

CREATE TABLE funcionario (
  cartrab SERIAL NOT NULL, 
  nomfun  varchar(45), 
  datadm  date, 
  salfun  float4, 
  codcin  int4 NOT NULL, 
  PRIMARY KEY (cartrab));
 
COMMENT ON TABLE funcionario IS 'Tabela de cadastro de funcionários';
COMMENT ON COLUMN funcionario.cartrab IS 'Identificador do funcionário (Nº da carteira de trabalho)';
COMMENT ON COLUMN funcionario.nomfun IS 'Nome do funcionário';
COMMENT ON COLUMN funcionario.datadm IS 'Data de admissão do funcionário';
COMMENT ON COLUMN funcionario.salfun IS 'Salário do funcionário';

CREATE TABLE genero (
  idgen  SERIAL NOT NULL, 
  nomgen varchar(45), 
  PRIMARY KEY (idgen));
 
COMMENT ON TABLE genero IS 'Coluna para cadastro dos gêneros de filmes';
COMMENT ON COLUMN genero.idgen IS 'Identificador do genero';
COMMENT ON COLUMN genero.nomgen IS 'Coluna especificadora do nome do gênero';

CREATE TABLE horario (
  idhor SERIAL NOT NULL, 
  hor   time(7), 
  PRIMARY KEY (idhor));
 
COMMENT ON TABLE horario IS 'Tabela para cadastro dos horários já pré-definidos';
COMMENT ON COLUMN horario.idhor IS 'Identificador do horário';
COMMENT ON COLUMN horario.hor IS 'Hora de exibição';

CREATE TABLE horario_funcionario (
  idhor         int4 NOT NULL, 
  idfuncionario int4 NOT NULL, 
  idfuncao      int4 NOT NULL, 
  id_hor_fun    SERIAL NOT NULL, 
  PRIMARY KEY (id_hor_fun));
 
COMMENT ON COLUMN horario_funcionario.id_hor_fun IS 'Chave primária';

CREATE TABLE premiacao (
  idpre  SERIAL NOT NULL, 
  nompre varchar(45), 
  anopre int4, 
  PRIMARY KEY (idpre));
 
COMMENT ON TABLE premiacao IS 'Tabela responsável pelo cadastro das premiações';
COMMENT ON COLUMN premiacao.idpre IS 'Coluna do ID da premiação';
COMMENT ON COLUMN premiacao.nompre IS 'Nome da premiação';
COMMENT ON COLUMN premiacao.anopre IS 'Ano da premiação';

CREATE TABLE sala (
  idsal  SERIAL NOT NULL 		, 
  nomsal varchar(45), 
  capsal int4, 
  PRIMARY KEY (idsal));
 
COMMENT ON TABLE sala IS 'Tabela para cadastro das salas de cinema';
COMMENT ON COLUMN sala.idsal IS 'Identificador da sala de cinema';
COMMENT ON COLUMN sala.nomsal IS 'Nome da sala de cinema';
COMMENT ON COLUMN sala.capsal IS 'Capacidade da sala de cinema';

CREATE TABLE sala_filme (
  idsala     int4 NOT NULL, 
  idfilm     int4 NOT NULL, 
  idhor      int4 NOT NULL, 
  id_sal_fil SERIAL NOT NULL, 
  PRIMARY KEY (id_sal_fil));
 
COMMENT ON COLUMN sala_filme.id_sal_fil IS 'Chave primária';

CREATE TABLE filme_premiacao (
  idpre      int4 NOT NULL, 
  idfilm     int4 NOT NULL, 
  gan        int4 DEFAULT 0, 
  id_fil_pre SERIAL NOT NULL, 
  PRIMARY KEY (id_fil_pre));
 
COMMENT ON COLUMN filme_premiacao.gan IS 'Flag para definir se ganhou ou não a inidicação';
COMMENT ON COLUMN filme_premiacao.id_fil_pre IS 'Chave primária';

ALTER TABLE funcionario ADD CONSTRAINT FUNCIONARIO_FK FOREIGN KEY (codcin) REFERENCES Cinema (codcin);
ALTER TABLE filme ADD CONSTRAINT FILME_FK FOREIGN KEY (idgen) REFERENCES genero (idgen);
ALTER TABLE filme ADD CONSTRAINT FILME_FK2 FOREIGN KEY (iddir) REFERENCES diretor (iddir);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK FOREIGN KEY (idfuncao) REFERENCES funcao (idfun);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK2 FOREIGN KEY (idfuncionario) REFERENCES funcionario (cartrab);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK3 FOREIGN KEY (idhor) REFERENCES horario (idhor);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK FOREIGN KEY (idfilm) REFERENCES filme (idfilm);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK2 FOREIGN KEY (idsala) REFERENCES sala (idsal);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK3 FOREIGN KEY (idhor) REFERENCES horario (idhor);
ALTER TABLE filme_premiacao ADD CONSTRAINT FILME_PREMIACAO_FK FOREIGN KEY (idfilm) REFERENCES filme (idfilm);
ALTER TABLE filme_premiacao ADD CONSTRAINT FILME_PREMIACAO_FK2 FOREIGN KEY (idpre) REFERENCES premiacao (idpre);
