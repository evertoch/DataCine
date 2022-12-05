package br.edu.unoesc.springboot.datacine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.datacine.model.Sessao;

/**
 * Sessao Repository
 * @author Everto Carlos Holleweiger
 */

@Repository
public interface SessaoRepository extends JpaRepository<Sessao, Long> {
	
	/**
	 * Query para buscar a sessao usando o nome.
	 */
	@Query(value = "select u from Sessao u where upper(trim(u.nome)) like %?1%")
	List<Sessao> sessaoByName(String id);
	
}