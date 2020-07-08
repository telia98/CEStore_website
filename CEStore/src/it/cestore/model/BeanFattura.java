package it.cestore.model;

import java.io.Serializable;

public class BeanFattura implements Serializable {

	private static final long serialVersionUID = 1L;
	private String idFattura;
	private int codOrdine;
	private float totale;
	
	public BeanFattura() {
		super();
	}

	public BeanFattura(String idFattura, int codOrdine, int totale) {
		super();
		this.idFattura = idFattura;
		this.codOrdine = codOrdine;
		this.totale = totale;
	}

	public String getIdFattura() {
		return idFattura;
	}
	
	public void setIdFattura(String idFattura) {
		this.idFattura = idFattura;
	}
	
	public int getCodOrdine() {
		return codOrdine;
	}
	
	public void setCodOrdine(int codOrdine) {
		this.codOrdine = codOrdine;
	}
	
	public float getTotale() {
		return totale;
	}
	
	public void setTotale(float totale) {
		this.totale = totale;
	}
	
	@Override
	public String toString() {
		return "BeanFattura [idFattura=" + idFattura + ", codOrdine=" + codOrdine + ", totale=" + totale + "]";
	}
}
