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
 * Classe Ingresso: classe com mapeamento para criacao da tabela ingresso.
 * @author Everto Carlos Holleweiger
 */
@Entity
@SequenceGenerator(name = "seq_ingresso", sequenceName = "seq_ingresso", allocationSize = 1, initialValue = 1)
public class Ingresso implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID do Ingresso
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idingresso", length=10 , nullable=false, columnDefinition = "integer")
	private Long idingresso;
	
	/**
	 * Ligacao ManyToOne com a coluna "idsessao" da tabela "sessao"
	 * ID da Sessao
	 */
	@ManyToOne
	@JoinColumn(name="idsessao", referencedColumnName = "idsessao", nullable = false, columnDefinition = "integer")
	private Sessao idsessao;
	
	/**
	 * Nome do filme	
	 */
	@Column(name="nomfil", length=45 , nullable=false, columnDefinition = "varchar(45)")
	private String nomfil;
	
	/**
	 * Valor do Ingresso
	 */
	@Column(name="valing", length=3 , nullable=false, columnDefinition = "numeric")
	private int valing;
	
	/**
	 * Getters e Setters
	 */

	public Long getIdingresso() {
		return idingresso;
	}

	public void setIdingresso(Long idingresso) {
		this.idingresso = idingresso;
	}

	public Sessao getIdsessao() {
		return idsessao;
	}

	public void setIdsessao(Sessao idsessao) {
		this.idsessao = idsessao;
	}

	public String getNomfil() {
		return nomfil;
	}

	public void setNomfil(String nomfil) {
		this.nomfil = nomfil;
	}

	public int getValing() {
		return valing;
	}

	public void setValing(int valing) {
		this.valing = valing;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}