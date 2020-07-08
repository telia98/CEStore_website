package it.cestore.model;

/* 
 * Bean che memorizza le informazioni di un capo della categoria accessorio recuperato dal DB 
 */
public class BeanAccessorio extends BeanCapo {
	
	private static final long serialVersionUID=1L;
	
	private String tipologia;
		
	public BeanAccessorio(){
		super();
		tipologia="";
	}
	
	public String getTipologia() {
		return tipologia;
	}
	
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	@Override
	public String toString() {
		return "BeanAccessorio" + super.toString() + "[tipologia=" + tipologia + "]";
	}
}