-- Criação dos índices chaves estrangeiras

create index fun_codcin_sk 
	on funcionario(codcin);
	
create index fil_idgen_sk
	on filme(idgen);
	
create index fil_iddir_sk
	on filme(iddir);
	
create index ing_idfilm_sk
	on ingresso(idfilm);
	
create index hor_fun_idfuncao_sk
	on horario_funcionario(idfuncao);

create index hor_fun_idhor_sk
	on horario_funcionario(idhor);
		
create index sal_fil_idfilm_sk
	on sala_filme(idfilm);
	
create index sal_fil_idsala_sk
	on sala_filme(idsala);
	
create index sal_fil_idhor_sk
	on sala_filme(idhor);
	
create index fil_pre_idfilm_sk
	on filme_premiacao(idfilm);
	
create index fil_pre_idpre_sk
	on filme_premiacao(idpre);
	
create index tic_idfilm_sk
	on ticket(idfilm);

create index tic_idali_sk
	on ticket(idali);

-- Criação dos índices colunas mais usadas

create index fil_nombr_sk
	on filme(nombr);

create index fil_nomen_sk
	on filme(nomen);

create index ing_valing_sk
	on ingresso(valing);

create index funcao_nomfun_sk
	on funcao(nomfun);

create index funcionario_nomfun_sk
	on funcionario(nomfun);

