package it.cestore.model;

import java.io.Serializable;

/* 
 * Bean che memorizza le informazioni di un metodo di pagamento carta di credito recuperato da DB
 */
public class BeanCartaDiCredito implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idPagamento;
	private String numeroCarta;
	private String dataScadenza;
	private String cvv;
	private String codiceFiscaleTitolare;
	
	public BeanCartaDiCredito() {
		numeroCarta = "";
		dataScadenza = "";
		cvv = "";
		codiceFiscaleTitolare = "";
	}

	public int getIdPagamento() {
		return idPagamento;
	}
	
	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}
	
	public String getNumeroCarta() {
		return numeroCarta;
	}
	
	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}
	
	public String getDataScadenza() {
		return dataScadenza;
	}
	
	public void setDataScadenza(String dataScadenza) {
		this.dataScadenza = dataScadenza;
	}
	
	public String getCvv() {
		return cvv;
	}
	
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	
	public String getCodiceFiscaleTitolare() {
		return codiceFiscaleTitolare;
	}
	
	public void setCodiceFiscaleTitolare(String codiceFiscaleTitolare) {
		this.codiceFiscaleTitolare = codiceFiscaleTitolare;
	}
	
	@Override
	public String toString() {
		return "BeanCartaDiCredito [idPagamento=" + idPagamento + ", numeroCarta=" + numeroCarta + ", dataScadenza="
				+ dataScadenza + ", cvv=" + cvv + ", codiceFiscaleTitolare=" + codiceFiscaleTitolare + "]";
	}
}
