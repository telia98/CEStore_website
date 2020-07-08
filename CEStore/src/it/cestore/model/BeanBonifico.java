package it.cestore.model;

import java.io.Serializable;

/* 
 * Bean che memorizza le informazioni di un metodo di pagamento bonifico recuperato da DB
 */
public class BeanBonifico implements Serializable {
	private static final long serialVersionUID = 1L;
	private int idPagamento;
	private String iban;
	private String nomeMittente;
	private String codiceFiscale;
	
	public BeanBonifico() {
		idPagamento=-1;
		iban="";
		nomeMittente="";
		codiceFiscale="";
	}

	public int getIdPagamento() {
		return idPagamento;
	}

	public void setIdPagamento(int idPagamento) {
		this.idPagamento = idPagamento;
	}

	public String getIban() {
		return iban;
	}

	public void setIban(String iban) {
		this.iban = iban;
	}

	public String getNomeMittente() {
		return nomeMittente;
	}

	public void setNomeMittente(String nomeMittente) {
		this.nomeMittente = nomeMittente;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	@Override
	public String toString() {
		return "BeanBonifico [idPagamento=" + idPagamento + ", iban=" + iban + ", nomeMittente=" + nomeMittente
				+ ", codiceFiscale=" + codiceFiscale + "]";
	}
}
