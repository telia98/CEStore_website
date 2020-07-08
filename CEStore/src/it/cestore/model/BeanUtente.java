package it.cestore.model;

import java.io.Serializable;

/* 
 * Bean che memorizza le informazioni di un utente recuperato da DB
 */
public class BeanUtente implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String mail;
	private String codiceFiscale;
	private String nome;
	private String cognome;
	private String ipSito;
	private String via;
	private String provincia;
	private String cap;
	private String nCivico;
	private String citta;
	
	public BeanUtente () {
		username="";
		password="";
		mail="";
		codiceFiscale="";
		nome="";
		cognome="";
		ipSito="";
		via="";
		provincia="";
		cap="";
		nCivico="";
		citta="";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getIpSito() {
		return ipSito;
	}

	public void setIpSito(String ipSito) {
		this.ipSito = ipSito;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getnCivico() {
		return nCivico;
	}

	public void setnCivico(String nCivico) {
		this.nCivico = nCivico;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	@Override
	public String toString() {
		return "BeanUtente [username=" + username + ", password=" + password + ", mail=" + mail + ", codiceFiscale="
				+ codiceFiscale + ", nome=" + nome + ", cognome=" + cognome + ", ipSito=" + ipSito + ", via=" + via
				+ ", provincia=" + provincia + ", cap=" + cap + ", nCivico=" + nCivico + ", città=" + citta + "]";
	}
}