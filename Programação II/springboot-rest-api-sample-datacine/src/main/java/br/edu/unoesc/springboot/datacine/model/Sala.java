package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "seq_sala", sequenceName = "seq_sala", allocationSize = 1, initialValue = 1)
public class Sala implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idsala", length=2 , nullable=false, columnDefinition = "integer")
	private Long idsala;
	
	@Column(name="nome", length=45, nullable=false, columnDefinition = "varchar(45)")
	private String nome;
	
	@Column(name="capsal", length=3 , nullable=false, columnDefinition = "integer")
	private int capsal;
	
	
	public Long getIdsala() {
		return idsala;
	}
	
	public void setIdsala(Long idsala) {
		this.idsala = idsala;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getCapsal() {
		return capsal;
	}

	public void setCapsal(int capsal) {
		this.capsal = capsal;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
