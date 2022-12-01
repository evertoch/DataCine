CREATE TABLE Cinema (
  codcin SERIAL NOT NULL, 
  nomcin varchar(40) NOT NULL, 
  PRIMARY KEY (codcin));
  
COMMENT ON TABLE Cinema IS 'Coluna para cadastro do cinema        ';
COMMENT ON COLUMN Cinema.codcin IS 'Coluna para código do cinema';
COMMENT ON COLUMN Cinema.nomcin IS 'Coluna para cadastro do nome do cinema';

CREATE TABLE diretor (
  iddir  SERIAL NOT NULL, 
  nomdir varchar(45) NOT NULL, 
  PRIMARY KEY (iddir));
  
COMMENT ON COLUMN diretor.iddir IS 'Identificador do cadastro de diretores';
COMMENT ON COLUMN diretor.nomdir IS 'Tabela para cadastro do nome do diretor';

CREATE TABLE filme (
  idfilm    SERIAL NOT NULL, 
  nomBR     varchar(45) NOT NULL, 
  nomEN     varchar(45), 
  anolanfan int4 NOT NULL, 
  sinfil    varchar(255) NOT NULL, 
  dubleg    int4 DEFAULT 0 NOT NULL, 
  durfil    time NOT NULL, 
  claind    int4 NOT NULL, 
  mesexi    int4 NOT NULL, 
  iddir     int4 NOT NULL, 
  idgen     int4 NOT NULL, 
  PRIMARY KEY (idfilm));
  
COMMENT ON TABLE filme IS 'Tabela para cadastro do filme';
COMMENT ON COLUMN filme.idfilm IS 'Identificador do filme';
COMMENT ON COLUMN filme.nomBR IS 'Nome do filme no Brasil';
COMMENT ON COLUMN filme.nomEN IS 'Nome do filme fora do Brasil';
COMMENT ON COLUMN filme.anolanfan IS 'Ano de lançamento do filme';
COMMENT ON COLUMN filme.sinfil IS 'Coluna para breve descrição da sinopse do filme';
COMMENT ON COLUMN filme.dubleg IS 'Flag de definição para filme dublado ou não (não encontrei o tipo booleano).';
COMMENT ON COLUMN filme.durfil IS 'Controle da duração do filme, em horas.';
COMMENT ON COLUMN filme.claind IS 'Classificação indicativa de idade para o filme';
COMMENT ON COLUMN filme.mesexi IS 'Mês de exibição do filme. Iniciando em 1 - Janeiro e 12 - Dezembro.';

CREATE TABLE filme_premiacao (
  idpre      int4 NOT NULL, 
  idfilm     int4 NOT NULL, 
  gan        int4 DEFAULT 0 NOT NULL, 
  id_fil_pre SERIAL NOT NULL, 
  PRIMARY KEY (id_fil_pre));
  
COMMENT ON COLUMN filme_premiacao.gan IS 'Flag para definir se ganhou ou não a inidicação';
COMMENT ON COLUMN filme_premiacao.id_fil_pre IS 'Chave primária';

CREATE TABLE funcao (
  idfun  SERIAL NOT NULL, 
  nomfun varchar(45) NOT NULL, 
  PRIMARY KEY (idfun));
  
COMMENT ON TABLE funcao IS 'Tabela de cadastro das funções do funcionário';
COMMENT ON COLUMN funcao.idfun IS 'Identificador da função';
COMMENT ON COLUMN funcao.nomfun IS 'Nome da função';

CREATE TABLE funcionario (
  cartrab SERIAL NOT NULL, 
  nomfun  varchar(45) NOT NULL, 
  datadm  date NOT NULL, 
  salfun  float4 NOT NULL, 
  codcin  int4 NOT NULL, 
  PRIMARY KEY (cartrab));
  
COMMENT ON TABLE funcionario IS 'Tabela de cadastro de funcionários';
COMMENT ON COLUMN funcionario.cartrab IS 'Identificador do funcionário (Nº da carteira de trabalho)';
COMMENT ON COLUMN funcionario.nomfun IS 'Nome do funcionário';
COMMENT ON COLUMN funcionario.datadm IS 'Data de admissão do funcionário';
COMMENT ON COLUMN funcionario.salfun IS 'Salário do funcionário';

CREATE TABLE genero (
  idgen  SERIAL NOT NULL, 
  nomgen varchar(45) NOT NULL, 
  PRIMARY KEY (idgen));
  
COMMENT ON TABLE genero IS 'Coluna para cadastro dos gêneros de filmes';
COMMENT ON COLUMN genero.idgen IS 'Identificador do genero';
COMMENT ON COLUMN genero.nomgen IS 'Coluna especificadora do nome do gênero';

CREATE TABLE horario (
  idhor SERIAL NOT NULL, 
  hor   time(7) NOT NULL, 
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

CREATE TABLE ingresso (
  iding      SERIAL NOT NULL, 
  datven     date NOT NULL, 
  valing     numeric(5, 2) NOT NULL, 
  id_sal_fil int4 NOT NULL, 
  PRIMARY KEY (iding));
  
COMMENT ON TABLE ingresso IS 'Tabela para registrar os ingressos vendidos';
COMMENT ON COLUMN ingresso.iding IS 'Id do ingresso';
COMMENT ON COLUMN ingresso.datven IS 'Data da venda do ingresso';
COMMENT ON COLUMN ingresso.valing IS 'Valor cobrado pelo ingresso.';
  

CREATE TABLE premiacao (
  idpre  SERIAL NOT NULL, 
  nompre varchar(45) NOT NULL, 
  anopre int4 NOT NULL, 
  PRIMARY KEY (idpre));
  
COMMENT ON TABLE premiacao IS 'Tabela responsável pelo cadastro das premiações';
COMMENT ON COLUMN premiacao.idpre IS 'Coluna do ID da premiação';
COMMENT ON COLUMN premiacao.nompre IS 'Nome da premiação';
COMMENT ON COLUMN premiacao.anopre IS 'Ano da premiação';

CREATE TABLE sala (
  idsal  SERIAL NOT NULL 		, 
  nomsal varchar(45) NOT NULL, 
  capsal int4 NOT NULL, 
  PRIMARY KEY (idsal)) ;
  
COMMENT ON TABLE sala IS 'Tabela para cadastro das salas de cinema';
COMMENT ON COLUMN sala.idsal IS 'Identificador da sala de cinema';
COMMENT ON COLUMN sala.nomsal IS 'Nome da sala de cinema';
COMMENT ON COLUMN sala.capsal IS 'Capacidade da sala de cinema';

CREATE TABLE sala_filme (
  id_sal_fil SERIAL NOT NULL, 
  idsala     int4 NOT NULL, 
  idfilm     int4 NOT NULL, 
  idhor      int4 NOT NULL, 
  PRIMARY KEY (id_sal_fil));

COMMENT ON COLUMN sala_filme.id_sal_fil IS 'Chave primária';


CREATE TABLE cardapio (
  idali  SERIAL NOT NULL, 
  desali varchar(40) NOT NULL, 
  valali int4 NOT NULL, 
  PRIMARY KEY (idali));
  
COMMENT ON TABLE cardapio IS 'Tabela criada para registrar os alimentos e bebidas disponíveis';
COMMENT ON COLUMN cardapio.idali IS 'ID do alimento';
COMMENT ON COLUMN cardapio.desali IS 'Descrição do alimento';
COMMENT ON COLUMN cardapio.valali IS 'Valor do alimento';


CREATE TABLE ticket (
  intic  SERIAL NOT NULL, 
  datven date NOT NULL, 
  idfilm int4 NOT NULL, 
  idali  int4 NOT NULL, 
  PRIMARY KEY (intic));
  
COMMENT ON TABLE ticket IS 'Tabela para registrar os tickets de alimetos vendidos';
COMMENT ON COLUMN ticket.intic IS 'ID (identificador) do ticket vendido';
COMMENT ON COLUMN ticket.datven IS 'Data da venda do ticket';

CREATE TABLE filme_auditoria (
  id_log       SERIAL NOT NULL, 
  id_filme_new int4, 
  id_filme_old int4, 
  dat_alt      timestamp NOT NULL, 
  usu_alt      varchar(25) NOT NULL, 
  dml          text NOT NULL, 
  PRIMARY KEY (id_log));
  
COMMENT ON TABLE filme_auditoria IS 'Tabela para gravar os logs de alteração na tabela filme';
COMMENT ON COLUMN filme_auditoria.id_log IS 'ID do log';
COMMENT ON COLUMN filme_auditoria.id_filme_new IS 'Id do filme adicionado.';
COMMENT ON COLUMN filme_auditoria.id_filme_old IS 'Id do filme alterado.';
COMMENT ON COLUMN filme_auditoria.dat_alt IS 'Data e hora da alteração da alteração';
COMMENT ON COLUMN filme_auditoria.usu_alt IS 'Usuario que fez a alteração do filme';
COMMENT ON COLUMN filme_auditoria.dml IS 'Comando executado.';



ALTER TABLE funcionario ADD CONSTRAINT FUNCIONARIO_FK FOREIGN KEY (codcin) REFERENCES Cinema (codcin);
ALTER TABLE filme ADD CONSTRAINT FILME_FK FOREIGN KEY (idgen) REFERENCES genero (idgen);
ALTER TABLE filme ADD CONSTRAINT FILME_FK2 FOREIGN KEY (iddir) REFERENCES diretor (iddir);
ALTER TABLE ingresso ADD CONSTRAINT INGRESSO_FK FOREIGN KEY (id_sal_fil) REFERENCES sala_filme (id_sal_fil);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK FOREIGN KEY (idfuncao) REFERENCES funcao (idfun);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK2 FOREIGN KEY (idfuncionario) REFERENCES funcionario (cartrab);
ALTER TABLE horario_funcionario ADD CONSTRAINT HORARIO_FUNCIONARIO_FK3 FOREIGN KEY (idhor) REFERENCES horario (idhor);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK FOREIGN KEY (idfilm) REFERENCES filme (idfilm);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK2 FOREIGN KEY (idsala) REFERENCES sala (idsal);
ALTER TABLE sala_filme ADD CONSTRAINT SALA_FILME_FK3 FOREIGN KEY (idhor) REFERENCES horario (idhor);
ALTER TABLE filme_premiacao ADD CONSTRAINT FILME_PREMIACAO_FK FOREIGN KEY (idfilm) REFERENCES filme (idfilm);
ALTER TABLE filme_premiacao ADD CONSTRAINT FILME_PREMIACAO_FK2 FOREIGN KEY (idpre) REFERENCES premiacao (idpre);
ALTER TABLE ticket ADD CONSTRAINT TICKET_FK FOREIGN KEY (idali) REFERENCES cardapio (idali);
ALTER TABLE ticket ADD CONSTRAINT TICKET_FK2 FOREIGN KEY (idfilm) REFERENCES filme (idfilm);

