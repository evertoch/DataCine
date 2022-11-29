package br.edu.unoesc.springboot.datacine.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "seq_filme", sequenceName = "seq_filme", allocationSize = 1, initialValue = 1)
public class Filme implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idfilme", length=10 , nullable=false, columnDefinition = "integer")
	private Long idfilme;
	
	@Column(name="nome", length=45, nullable=false, columnDefinition = "varchar(45)")
	private String nome;
	
	@Column(name="mesexi", length=2 , nullable=false, columnDefinition = "integer")
	private int mesexi;
	
	@Column(name="dubleg", length=1 , nullable=false, columnDefinition = "char(1)")
	private int dubleg;
	
	@Column(name="sinfil", length=255 , nullable=false, columnDefinition = "varchar(45)")
	private int sinfil;
	
	@Column(name="claind", length=2 , nullable=false, columnDefinition = "integer")
	private int claind;

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

	public int getDubleg() {
		return dubleg;
	}

	public void setDubleg(int dubleg) {
		this.dubleg = dubleg;
	}

	public int getSinfil() {
		return sinfil;
	}

	public void setSinfil(int sinfil) {
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
