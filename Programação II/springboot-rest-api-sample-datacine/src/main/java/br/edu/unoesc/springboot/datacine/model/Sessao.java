package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

/**
 * Classe Sessao: classe com mapeamento para criacao da tabela sessao.
 * @author Everto Carlos Holleweiger
 */
@Entity
@SequenceGenerator(name = "seq_sessao", sequenceName = "seq_sessao", allocationSize = 1, initialValue = 1)
public class Sessao implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * Construtor vazio.
	 */
	public Sessao() {}
	
	/**
	 * Construtor para conseguir salvar o valor preenchido em um formulario
	 * sem esse construtor, ele nao consegue trazer o valor como Long.
	 */
	public Sessao(String idsessao) {
		this.idsessao = Long.parseLong(idsessao);
	}	

	/**
	 * ID da sessao
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idsessao", length=10 , nullable=false, columnDefinition = "integer")
	private Long idsessao;
	
	/**
	 * Nome da sala
	 */
	@Column(name="nome", length=45, nullable=false, columnDefinition = "varchar(45)")
	private String nome;
	
	/**
	 * Hora da sessao
	 */
	@Column(name="horses", length=8, nullable=false, columnDefinition = "varchar(45)")
	private String horses;
	
	/**
	 * Ligacao ManyToOne com a coluna "idfilme" da tabela "filme"
	 * ID do filme
	 */
	@ManyToOne
	@JoinColumn(name="idfilme", referencedColumnName = "idfilme", nullable = false, columnDefinition = "integer")
	private Filme idfilme;
	
	/**
	 * Ligacao ManyToOne com a coluna "idsala" da tabela "sala"
	 * ID da sala
	 */
	@ManyToOne
	@JoinColumn(name="idsala", referencedColumnName = "idsala", nullable = false, columnDefinition = "integer")
	private Sala idsala;

	/**
	 * Getters e Setters.
	 */
	public Long getIdsessao() {
		return idsessao;
	}

	public void setIdsessao(Long idsessao) {
		this.idsessao = idsessao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getHorses() {
		return horses;
	}

	public void setHorses(String horses) {
		this.horses = horses;
	}

	public Filme getIdfilme() {
		return idfilme;
	}

	public void setIdfilme(Filme idfilme) {
		this.idfilme = idfilme;
	}

	public Sala getIdsala() {
		return idsala;
	}

	public void setIdsala(Sala idsala) {
		this.idsala = idsala;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

	