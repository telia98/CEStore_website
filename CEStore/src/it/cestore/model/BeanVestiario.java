package it.cestore.model;

/* 
 * Bean che memorizza le informazioni di un capo di vestiario recuperato dal DB
 */
public class BeanVestiario extends BeanCapo {
	private static final long serialVersionUID=1L;
	
	private String colore;
	private String materiale;
	private String modello;
	private String taglia;
	
	public BeanVestiario() {
		super();
		colore="";
		materiale="";
		modello="";
		taglia="";
	}
	
	public String getColore() {
		return colore;
	}

	public void setColore(String colore) {
		this.colore = colore;
	}

	public String getMateriale() {
		return materiale;
	}

	public void setMateriale(String materiale) {
		this.materiale = materiale;
	}

	public String getModello() {
		return modello;
	}

	public void setModello(String modello) {
		this.modello = modello;
	}

	public String getTaglia() {
		return taglia;
	}

	public void setTaglia(String taglia) {
		this.taglia = taglia;
	}

	@Override
	public String toString() {
		return "BeanVestiario" + super.toString() + "[colore=" + colore + ", materiale=" + materiale + ", modello=" + modello + ", taglia="
				+ taglia + "]";
	}
}
