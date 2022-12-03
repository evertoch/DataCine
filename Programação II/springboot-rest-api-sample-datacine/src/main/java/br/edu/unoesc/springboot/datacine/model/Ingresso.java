package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "seq_ingresso", sequenceName = "seq_ingresso", allocationSize = 1, initialValue = 1)
public class Ingresso implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idingresso", length=10 , nullable=false, columnDefinition = "integer")
	private Long idingresso;
	
	@Column(name="datven", length=8, nullable=false, columnDefinition = "varchar(8)")
	private String datven;
	
	@Column(name="valing", length=3 , nullable=false, columnDefinition = "numeric")
	private int valing;
	
	@Column(name="idsessao", length=3 , nullable=false, columnDefinition = "integer")
	private int idsessao;

	public Long getIdingresso() {
		return idingresso;
	}

	public void setIdingresso(Long idingresso) {
		this.idingresso = idingresso;
	}

	public String getDatven() {
		return datven;
	}

	public void setDatven(String datven) {
		this.datven = datven;
	}

	public int getValing() {
		return valing;
	}

	public void setValing(int valing) {
		this.valing = valing;
	}

	public int getIdsessao() {
		return idsessao;
	}

	public void setIdsessao(int idsessao) {
		this.idsessao = idsessao;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
		
}
