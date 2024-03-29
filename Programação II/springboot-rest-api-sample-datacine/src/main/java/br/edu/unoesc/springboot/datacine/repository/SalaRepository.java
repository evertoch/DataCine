package br.edu.unoesc.springboot.datacine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.datacine.model.Sala;

/**
 * Repository sala
 * @author Everto
 */
@Repository
public interface SalaRepository extends JpaRepository<Sala, Long> {
	
	/**
	 * Query para buscar a sala usando o nome.
	 */
	@Query(value = "select u from Sala u where upper(trim(u.nome)) like %?1%")
	List<Sala> salaByName(String name);
	
}