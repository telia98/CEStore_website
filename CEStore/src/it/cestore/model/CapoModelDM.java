package it.cestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/** classe che implementa tutti i metodi che devono accedere e operare con il DB per i capi */

public class CapoModelDM {
	
	/* metodo che recupera tutti i capi presenti nel DB */
	public ArrayList<BeanCapo> selectCapi() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			capi.addAll(selectCapiVestiario());
			capi.addAll(selectCapiAccessorio());
			
			//restituisco la lista dei capi recuperata dal DB
			return capi;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//se l'operazione non è andata a buon fine
		return null;
	}
	
	/* metodo che recupera tutti i capi di vestiario */
	public ArrayList<BeanVestiario> selectCapiVestiario() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanVestiario> capi= new ArrayList<BeanVestiario>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "SELECT * FROM vestiario"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			
			rs=ps.executeQuery(sql);
			
			//per ogni capo recuperato dal DB
			while (rs.next()) { 
				sql = "SELECT * FROM rendeVisibile WHERE codVestiario=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setInt(1,rs.getInt("codCapo"));
				rs2=ps.executeQuery();
				if (rs2.next()) {
					BeanVestiario capo= new BeanVestiario(); 
				
					//carico il bean con le informazioni prelevate
					capo.setCodCapo(rs.getInt("codCapo"));
					capo.setDescrizione(rs.getString("descrizione"));
					capo.setCodCategoria(rs.getString("codCategoria"));
					capo.setColore(rs.getString("colore"));
					capo.setCosto(rs.getFloat("costo"));
					capo.setMateriale(rs.getString("materiale"));
					capo.setModello(rs.getString("modello"));
					capo.setNomeDeposito(rs.getString("nomeDeposito"));
					capo.setTaglia(rs.getString("taglia"));
				
					//aggiungo il capo nell'arrayList finale
					capi.add(capo);
				}
			}
			
			//restituisco la lista dei capi recuperata dal DB
			return capi;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (rs2 != null)
					rs2.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/* metodo che recupera tutti i capi accessorio */
	public ArrayList<BeanAccessorio> selectCapiAccessorio() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanAccessorio> capi= new ArrayList<BeanAccessorio>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "SELECT * FROM accessorio"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
		
			rs=ps.executeQuery(sql);
			
			//per ogni capo recuperato dal DB
			while (rs.next()) { 
				sql = "SELECT * FROM rendeVisibile WHERE codAccessorio=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setInt(1,rs.getInt("codCapo"));
				rs2=ps.executeQuery();
				if (rs2.next()) {
					BeanAccessorio capo= new BeanAccessorio(); 
				
					//carico il bean con le informazioni prelevate
					capo.setCodCapo(rs.getInt("codCapo"));
					capo.setDescrizione(rs.getString("descrizione"));
					capo.setCodCategoria(rs.getString("codCategoria"));
					capo.setCosto(rs.getFloat("costo"));
					capo.setNomeDeposito(rs.getString("nomeDeposito"));
					capo.setTipologia(rs.getString("tipologia"));
				
					//aggiungo il capo nell'arrayList finale
					capi.add(capo);
				}
			}
			
			//restituisco la lista dei capi recuperata dal DB
			return capi;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco la lista dei capi recuperata dal DB
		return capi;
	}

	/* metodo che recupera un capo di accessorio dato il codice del capo */
	public BeanAccessorio selectAccessorio(int codCapo) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();

			String sql = "SELECT * FROM accessorio WHERE codCapo=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,codCapo);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				BeanAccessorio capo= new BeanAccessorio();
				capo.setCodCapo(rs.getInt("codCapo"));
				capo.setDescrizione(rs.getString("descrizione"));
				capo.setCodCategoria(rs.getString("codCategoria"));
				capo.setCosto(rs.getFloat("costo"));
				capo.setTipologia(rs.getString("tipologia"));
				capo.setNomeDeposito(rs.getString("nomeDeposito"));
			
				return capo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che recupera un capo di vestiario dato il codice del capo */
	public BeanVestiario selectVestiario(int codCapo) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();

			String sql = "SELECT * FROM vestiario WHERE codCapo=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,codCapo);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				BeanVestiario capo= new BeanVestiario();
				capo.setCodCapo(rs.getInt("codCapo"));
				capo.setDescrizione(rs.getString("descrizione"));
				capo.setCodCategoria(rs.getString("codCategoria"));
				capo.setCosto(rs.getFloat("costo"));
				capo.setColore(rs.getString("colore"));
				capo.setMateriale(rs.getString("colore"));
				capo.setModello(rs.getString("modello"));
				capo.setTaglia(rs.getString("taglia"));
				capo.setMateriale(rs.getString("materiale"));
				capo.setNomeDeposito(rs.getString("nomeDeposito"));
				
				return capo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/* metodo che recupera tutti i capi presenti nel carrello di un determinato utente */
	public ArrayList<BeanCapo> getCarrello(String cf) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		
		ArrayList<BeanCapo> capiCarrello= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "SELECT * FROM contiene WHERE cf_cliente=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
			rs=ps.executeQuery();
			
			//per ogni capo recuperato dal DB
			while (rs.next()) {  
				if(rs.getInt("codVestiario")!=0) {
					sql = "SELECT * FROM vestiario WHERE codCapo=?"; //creo la query
					ps = con.prepareStatement(sql);
					ps.setInt(1,rs.getInt("codVestiario"));
					rs1=ps.executeQuery();
					
					while (rs1.next()) {
						BeanVestiario vestiario= new BeanVestiario();
						//carico il bean con le informazioni prelevate
						vestiario.setCodCapo(rs1.getInt("codCapo"));
						vestiario.setDescrizione(rs1.getString("descrizione"));
						vestiario.setCodCategoria(rs1.getString("codCategoria"));
						vestiario.setColore(rs1.getString("colore"));
						vestiario.setCosto(rs1.getFloat("costo"));
						vestiario.setMateriale(rs1.getString("materiale"));
						vestiario.setModello(rs1.getString("modello"));
						vestiario.setNomeDeposito(rs1.getString("nomeDeposito"));
						vestiario.setTaglia(rs1.getString("taglia"));
					
						//aggiungo il capo nell'arrayList finale
						capiCarrello.add(vestiario);
					}
				} else {
					sql = "SELECT * FROM accessorio WHERE codCapo=?"; //creo la query
					ps = con.prepareStatement(sql);
					ps.setInt(1,rs.getInt("codAccessorio"));
					rs1=ps.executeQuery();
					
					while (rs1.next()) {
						BeanAccessorio accessorio= new BeanAccessorio();
						//carico il bean con le informazioni prelevate
						accessorio.setCodCapo(rs1.getInt("codCapo"));
						accessorio.setDescrizione(rs1.getString("descrizione"));
						accessorio.setCodCategoria(rs1.getString("codCategoria"));
						accessorio.setCosto(rs1.getFloat("costo"));
						accessorio.setNomeDeposito(rs1.getString("nomeDeposito"));
						accessorio.setTipologia(rs1.getString("tipologia"));
					
						//aggiungo il capo nell'arrayList finale
						capiCarrello.add(accessorio);
					}
				}
			}
			return capiCarrello;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco null nel caso l'operazione non vada a buon fine
		return null;
	}

	/* metodo che permette di eliminare i capi di vestiario*/
	public boolean deleteCapoVestiario(BeanVestiario v) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "DELETE FROM vestiario WHERE codCapo=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, v.getCodCapo());		
			int rs=ps.executeUpdate();
			
			if (rs==1) { //ha trovato il capo da eliminare
				sql = "DELETE FROM rendeVisibile WHERE codVestiario=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, v.getCodCapo());		
				ps.executeUpdate();
			
				return true; //se tutto va bene
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return false;
	}
	
	/* metodo che permette di eliminare i capi di accessorio*/
	public boolean deleteCapoAccessorio(BeanAccessorio a) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "DELETE FROM accessorio WHERE codCapo=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, a.getCodCapo());		
			int rs=ps.executeUpdate();
			
			if(rs==1) { //ha trovato il capo da eliminare
				sql = "DELETE FROM rendeVisibile WHERE codAccessorio=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, a.getCodCapo());		
				ps.executeUpdate();
				
				return true; //se tutto va bene
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return false;
	}
	
	/* metodo che permette di inserire capi di vestiario*/
	public int insertCapoVestiario(BeanVestiario v) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
				
			String sql = "INSERT INTO vestiario(taglia,colore,materiale,descrizione,costo,modello,codCategoria,nomeDeposito) VALUES (?,?,?,?,?,?,?,(SELECT nome_dep FROM deposito))";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, v.getTaglia());
			ps.setString(2, v.getColore());
			ps.setString(3, v.getMateriale());
			ps.setString(4, v.getDescrizione());
			ps.setFloat(5, v.getCosto());
			ps.setString(6, v.getModello());
			ps.setString(7, v.getCodCategoria());
			ps.executeUpdate();
			
			//recupero il codice del capo appena inserito
			sql="SELECT * FROM vestiario WHERE descrizione=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, v.getDescrizione());
			rs=ps.executeQuery();
			int codCapo=-1;
			
			if (rs.next()) {
				codCapo=rs.getInt("codCapo");
				setVisible(codCapo,"vestiario"); //per rendere il capo visibile sul sito
				
				return codCapo; //se tutto va bene
			}
				
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return -1;
	}
		
	/* metodo che permette di inserire capi di acessorio*/
	public int insertCapoAccessorio(BeanAccessorio a) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
				
			String sql = "INSERT INTO accessorio(descrizione,costo,tipologia,codCategoria,nomeDeposito) VALUES (?,?,?,?,(SELECT nome_dep FROM deposito))";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, a.getDescrizione());
			ps.setFloat(2, a.getCosto());
			ps.setString(3, a.getTipologia());
			ps.setString(4, a.getCodCategoria());
				
			ps.executeUpdate();
			
			//recupero il codice del capo appena inserito
			sql="SELECT * FROM accessorio WHERE descrizione=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, a.getDescrizione());
			rs=ps.executeQuery();
			int codCapo=-1;
			
			if (rs.next()) {
				codCapo=rs.getInt("codCapo");
				setVisible(codCapo,"accessorio"); //per rendere il capo visibile sul sito
				
				return codCapo; //se tutto va bene
			}	
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return -1;
	}

	/* metodo che permette di rendere invisibile sul sito un capo presente in un carrello */
	public void setInvisible(int codCapo,String tabella) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql;
			
			if (tabella.equals("vestiario"))
				sql = "DELETE FROM rendeVisibile WHERE codVestiario=?";
			else
				sql = "DELETE FROM rendeVisibile WHERE codAccessorio=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,codCapo);		
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/* metodo che permette di rendere visibile sul sito un capo tolto da un carrello */
	public void setVisible(int codCapo,String tabella) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql;
			
			if (tabella.equals("vestiario"))
				sql = "INSERT INTO rendeVisibile(IP_sito,codVestiario) VALUES ((SELECT indirizzo_IP FROM sitoWeb),?)";
			else
				sql = "INSERT INTO rendeVisibile(IP_sito,codAccessorio) VALUES ((SELECT indirizzo_IP FROM sitoWeb),?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,codCapo);		
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/* metodo che permette di inserire una lista di capi in un carrello */
	public boolean insertCarrello(String cf,ArrayList<BeanCapo> carrello) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql="";
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			for (int i=0;i<carrello.size();i++) {
				if (carrello.get(i).getClass()==BeanVestiario.class) {
					//bisogna aggiungere un capo di vestiario
					sql="INSERT INTO contiene(codVestiario,codCarrello,cf_cliente) VALUES(?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1,carrello.get(i).getCodCapo());
					int codCar=getCodCarrello(cf);
					ps.setInt(2,codCar);
					ps.setString(3,cf);
					ps.executeUpdate();
					
				} else {
					//bisogna aggiungere un capo di accessorio
					sql="INSERT INTO contiene(codAccessorio,codCarrello,cf_cliente) VALUES(?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1,carrello.get(i).getCodCapo());
					int codCar=getCodCarrello(cf);
					ps.setInt(2,codCar);
					ps.setString(3,cf);
					ps.executeUpdate();
				}
			}
			
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco false nel caso l'operazione non vada a buon fine
		return false;
	}

	/* metodo che permette di svuotare il carrello */
	public boolean deleteCarrello(String cf,int codCapo,String tabella) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			if (tabella.equals("vestiario")) {
				String sql="DELETE FROM contiene WHERE codVestiario=? AND cf_cliente=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1,codCapo);
				ps.setString(2,cf);
				ps.executeUpdate();
				
			} else {
				String sql="DELETE FROM contiene WHERE codAccessorio=? AND cf_cliente=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1,codCapo);
				ps.setString(2,cf);
				ps.executeUpdate();
			}
			
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco false nel caso l'operazione non vada a buon fine
		return false;
	}
	
	public int getCodCarrello(String cf) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();

			String sql = "SELECT * FROM carrello WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				int codiceCarrello=rs.getInt("codCar");
			
				return codiceCarrello;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return -1; //se l'operazione non va a buon fine
	}
	
	/* metodo per ricercaAjax che recupera tutti i capi presenti nel DB */ 
	public ArrayList<BeanCapo> selectCapi(String c) { 		
		Connection con = null; 		
		Statement st = null; 		
		ResultSet rs = null; 	
		ResultSet rs1 = null; 
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); 
		
		//lista dei capi presi da database  		
		try { 			
			con = DriverManagerConnectionPool.createDBConnection(); 			
			st = con.createStatement(); 			 			
			//restituisco la lista dei capi recuperata dal DB
			
			String sql = "SELECT * FROM vestiario WHERE descrizione LIKE ?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,"%" + c + "%");
			rs=ps.executeQuery();
			
			//per ogni capo recuperato dal DB
			while (rs.next()) { 
				
				BeanVestiario capo= new BeanVestiario(); 
				
				//carico il bean con le informazioni prelevate
				capo.setCodCapo(rs.getInt("codCapo"));
				capo.setDescrizione(rs.getString("descrizione"));
				capo.setCodCategoria(rs.getString("codCategoria"));
				capo.setColore(rs.getString("colore"));
				capo.setCosto(rs.getFloat("costo"));
				capo.setMateriale(rs.getString("materiale"));
				capo.setModello(rs.getString("modello"));
				capo.setNomeDeposito(rs.getString("nomeDeposito"));
				capo.setTaglia(rs.getString("taglia"));
				
				//aggiungo il capo nell'arrayList finale
				capi.add(capo);
			}
			
			sql = "SELECT * FROM accessorio WHERE descrizione LIKE ?"; //creo la query
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + c + "%");
			rs1=ps.executeQuery();
			
			//per ogni capo recuperato dal DB
			while (rs1.next()) { 
				
				BeanAccessorio capo= new BeanAccessorio(); 
				
				//carico il bean con le informazioni prelevate
				capo.setCodCapo(rs1.getInt("codCapo"));
				capo.setDescrizione(rs1.getString("descrizione"));
				capo.setCodCategoria(rs1.getString("codCategoria"));
				capo.setCosto(rs1.getFloat("costo"));
				capo.setNomeDeposito(rs1.getString("nomeDeposito"));
				capo.setTipologia(rs1.getString("tipologia"));
				
				//aggiungo il capo nell'arrayList finale
				capi.add(capo);
			}
		
			return capi;
		} catch (SQLException e) { 			
			e.printStackTrace(); 		
		} finally { 				
			try { 				
				if (rs != null) 					
					rs.close(); 				
				if (st != null) 				
					st.close(); 
				if (rs1 != null) 				
					rs1.close();
				DriverManagerConnectionPool.releaseConnection(con); 		
				} catch (SQLException e) { 			
					e.printStackTrace(); 			
				} 		
		} 	
		//se l'operazione non è andata a buon fine 	
		return null; 	
	}
	
	/* metodo che permette di creare un carrello ed assegnarlo ad un utente */
	public boolean createCarrello(String cf) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
				
			String sql = "INSERT INTO carrello(cf_cliente) VALUES (?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
				
			ps.executeUpdate();
			
			return true; //se tutto va bene
				
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return false;
	}
}
