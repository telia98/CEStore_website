package it.cestore.model;

import java.io.Serializable;

/* 
 * Bean che memorizza le informazioni di un capo generico recuperato dal DB 
 */
public class BeanCapo implements Serializable {
	private static final long serialVersionUID=1L;
		
	private int codiceCapo;
	private String descrizione;
	private float costo;
	private String codCategoria;
	private String nomeDeposito;

	public BeanCapo () {
		codiceCapo=-1;
		descrizione="";
		costo=-1;
		nomeDeposito="";
		codCategoria="";
	}
	
	public int getCodCapo() {
		return codiceCapo;
	}

	public void setCodCapo(int codCapo) {
		this.codiceCapo = codCapo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}

	public String getNomeDeposito() {
		return nomeDeposito;
	}

	public void setNomeDeposito(String nomeDeposito) {
		this.nomeDeposito = nomeDeposito;
	}

	public String getCodCategoria () {
		return codCategoria;
	}
	
	public void setCodCategoria (String codCategoria) {
		this.codCategoria=codCategoria;
	}

	@Override
	public String toString() {
		return "BeanCapo [codCapo=" + codiceCapo + ", descrizione=" + descrizione + ", costo=" + costo + ", codCategoria="
				+ codCategoria + ", nomeDeposito=" + nomeDeposito + "]";
	}
}
