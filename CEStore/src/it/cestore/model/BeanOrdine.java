package it.cestore.model;

import java.io.Serializable;

/* 
 * Bean che memorizza le informazioni di un ordine recuperato da DB
 */
public class BeanOrdine implements Serializable {

	private static final long serialVersionUID = 1L;
	private int codiceOrdine;
	private String dataOrdine;
	private String numeroTracking;
	private String codiceFiscale;
	private int codiceCarrello;
	private Integer pagamentoConBonifico;
	private Integer pagamentoConCarta;
	private String dittaSpedizione;
	
	public BeanOrdine() {
		codiceOrdine=-1;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int codiceOrdine) {
		this.codiceOrdine = codiceOrdine;
	}

	public String getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

	public String getNumeroTracking() {
		return numeroTracking;
	}

	public void setNumeroTracking(String numeroTracking) {
		this.numeroTracking = numeroTracking;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public int getCodiceCarrello() {
		return codiceCarrello;
	}

	public void setCodiceCarrello(int codiceCarrello) {
		this.codiceCarrello = codiceCarrello;
	}

	public Integer getPagamentoConBonifico() {
		return pagamentoConBonifico;
	}

	public void setPagamentoConBonifico(int pagamentoConBonifico) {
		this.pagamentoConBonifico = pagamentoConBonifico;
	}

	public Integer getPagamentoConCarta() {
		return pagamentoConCarta;
	}

	public void setPagamentoConCarta(int pagamentoConCarta) {
		this.pagamentoConCarta = pagamentoConCarta;
	}

	public String getDittaSpedizione() {
		return dittaSpedizione;
	}

	public void setDittaSpedizione(String dittaSpedizione) {
		this.dittaSpedizione = dittaSpedizione;
	}

	@Override
	public String toString() {
		return "BeanOrdine [codiceOrdine=" + codiceOrdine + ", dataOrdine=" + dataOrdine + ", numeroTracking="
				+ numeroTracking + ", codiceFiscale=" + codiceFiscale + ", codiceCarrello=" + codiceCarrello
				+ ", pagamentoConBonifico=" + pagamentoConBonifico + ", pagamentoConCarta=" + pagamentoConCarta
				+ ", dittaSpedizione=" + dittaSpedizione + "]";
	}
}
