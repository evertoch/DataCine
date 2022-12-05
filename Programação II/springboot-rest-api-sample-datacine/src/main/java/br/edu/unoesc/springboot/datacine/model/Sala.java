package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * Classe Sala: classe com mapeamento para criacao da tabela sala.
 * @author Everto Carlos Holleweiger
 */
@Entity
@SequenceGenerator(name = "seq_sala", sequenceName = "seq_sala", allocationSize = 1, initialValue = 1)
public class Sala implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Construtor vazio
	 */
	public Sala() {}
	
	/**
	 * Construtor para conseguir salvar o valor preenchido em um formulario
	 * sem esse construtor, ele nao consegue trazer o valor como Long.
	 */
	public Sala(String idsala) {
		this.idsala = Long.parseLong(idsala);
	}
	
	/**
	 * ID da sala
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idsala", length=2 , nullable=false, columnDefinition = "integer")
	private Long idsala;
	
	/**
	 * Nome da sala
	 */
	@Column(name="nome", length=45, nullable=false, columnDefinition = "varchar(45)")
	private String nome;
	
	/**
	 * Capacidade da sala
	 */
	@Column(name="capsal", length=3 , nullable=false, columnDefinition = "integer")
	private int capsal;
	
	/**
	 * Getters e Setters
	 */
	
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
