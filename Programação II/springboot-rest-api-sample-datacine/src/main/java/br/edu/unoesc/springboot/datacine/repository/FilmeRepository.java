package br.edu.unoesc.springboot.datacine.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.edu.unoesc.springboot.datacine.model.Filme;

@Repository
public interface FilmeRepository extends JpaRepository<Filme, Long> {
}


