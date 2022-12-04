package br.edu.unoesc.springboot.datacine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.datacine.model.Ingresso;


@Repository
public interface IngressoRepository extends JpaRepository<Ingresso, Long> {
	
	@Query(value = "select u from Ingresso u where upper(trim(u.nomfil)) like %?1%")
	List<Ingresso> ingressoByName(String name);
	
	
}