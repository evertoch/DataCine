package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Classe Filme: classe com mapeamento para criacao da tabela filme.
 * @author Everto Carlos Holleweiger
 */

@Entity
@SequenceGenerator(name = "seq_filme", sequenceName = "seq_filme", allocationSize = 1, initialValue = 1)
@JsonIgnoreProperties
public class Filme implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Construtor vazio	
	 */
	
	public Filme() {}
	
	
	
	/**
	 * Construtor para conseguir salvar o valor preenchido em um formulario
	 * sem esse construtor, ele nao consegue trazer o valor como Long.
	 */
	public Filme(String idfilme) {
		this.idfilme = Long.parseLong(idfilme);
	}

	/**
	 * ID do Filme
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idfilme", length=10 , nullable=false, columnDefinition = "integer")
	private Long idfilme;
	
	/**
	 * Nome do filme
	 */
	@Column(name="nome", length=45, nullable=false, columnDefinition = "varchar(45)")
	private String nome;
	
	/**
	 * Mes de exibição do filme
	 */
	@Column(name="mesexi", length=2 , nullable=false, columnDefinition = "integer")
	private int mesexi;
	
	/**
	 * Flag de Dublado ou Legendado
	 */
	@Column(name="dubleg", length=1 , nullable=false, columnDefinition = "char(1)")
	private char dubleg;
	
	/**
	 * Classificacao indicativa do filme
	 */
	@Column(name="claind", length=2 , nullable=false, columnDefinition = "integer")
	private int claind;
	
	/**
	 * Sinopse do Filme
	 */
	@Column(name="sinfil", length=255 , nullable=false, columnDefinition = "varchar(255)")
	private String sinfil;
	
	/**
	 * Getters e Setters
	 * 
	 */
	
	public Long getIdfilme() {
		return idfilme;
	}

	public void setIdfilme(Long idfilme) {
		this.idfilme = idfilme;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getMesexi() {
		return mesexi;
	}

	public void setMesexi(int mesexi) {
		this.mesexi = mesexi;
	}

	public char getDubleg() {
		return dubleg;
	}

	public void setDubleg(char dubleg) {
		this.dubleg = dubleg;
	}

	public String getSinfil() {
		return sinfil;
	}

	public void setSinfil(String sinfil) {
		this.sinfil = sinfil;
	}

	public int getClaind() {
		return claind;
	}

	public void setClaind(int claind) {
		this.claind = claind;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
