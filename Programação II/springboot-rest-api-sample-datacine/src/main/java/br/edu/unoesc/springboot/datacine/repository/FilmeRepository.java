package br.edu.unoesc.springboot.datacine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.datacine.model.Filme;

@Repository
public interface FilmeRepository extends JpaRepository<Filme, Long> {
	
	@Query(value = "select u from Filme u where upper(trim(u.nome)) like %?1%")
	List<Filme> filmeByName(String name);
	
}
	

