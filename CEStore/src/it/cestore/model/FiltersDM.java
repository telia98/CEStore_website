package it.cestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * classe che implementa i filtri applicabili nelle ricerche sul sito web
 */
public class FiltersDM {

	/* metodo che restituisce dei capi data una taglia */
	public ArrayList<BeanCapo> getVestiarioByTaglia(String taglia) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE taglia=?";
			ps= con.prepareStatement(sql);
			ps.setString(1, taglia);
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
						rs.close();
			if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che restituisce dei capi dato un colore */
	public ArrayList<BeanCapo> getVestiarioByColore(String colore) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE colore=?";
			ps= con.prepareStatement(sql);
			ps.setString(1, colore);
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (rs2 != null)
					rs2.close();
				if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	/* metodo che restituisce dei capi dato un materiale */
	public ArrayList<BeanCapo> getVestiarioByMateriale(String materiale) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE materiale=? ";
			ps= con.prepareStatement(sql);
			ps.setString(1,materiale);
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
						rs.close();
			if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	/* metodo che restituisce dei capi data una marca */
	public ArrayList<BeanCapo> getVestiarioByBrand(String brand) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE descrizione LIKE ?";
			ps= con.prepareStatement(sql);
			ps.setString(1,"%" + brand + "%");
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
						rs.close();
			if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che restituisce degli accessori data una marca */
	public ArrayList<BeanCapo> getAccessorioByBrand(String brand) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql="";
			PreparedStatement ps;
			
			sql = "SELECT * FROM accessorio WHERE descrizione LIKE ?"; //creo la query
			ps = con.prepareStatement(sql);
			ps.setString(1,"%" + brand + "%");
			rs=ps.executeQuery();
			
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
	
	/* metodo che restituisce degli accessori data una marca */
	public ArrayList<BeanCapo> getAccessorioByFantasia(String fantasia) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql="";
			PreparedStatement ps;
			
			sql = "SELECT * FROM accessorio WHERE descrizione LIKE ?"; //creo la query
			ps = con.prepareStatement(sql);
			ps.setString(1,"%" + fantasia + "%");
			rs=ps.executeQuery();
			
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
	
	/* metodo che restituisce dei capi data una fantasia */
	public ArrayList<BeanCapo> getVestiarioByFantasia(String fantasia) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE descrizione LIKE ?";
			ps= con.prepareStatement(sql);
			ps.setString(1,"%" + fantasia + "%");
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
						rs.close();
			if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che restituisce dei capi data una stagione */
	public ArrayList<BeanCapo> getVestiarioByStagione(String stagione) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanCapo> capiCriterioV= new ArrayList<BeanCapo>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			sql = "SELECT * FROM vestiario WHERE descrizione LIKE ?";
			ps= con.prepareStatement(sql);
			ps.setString(1,"%" + stagione + "%");
			
			rs=ps.executeQuery();

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
						rs.close();
			if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che restituisce un dato capo di accessorio tramite tipologia e descrizione selezionate */ 
	public ArrayList<BeanVestiario> getVestiarioByFilters(String modello,String genere) {
	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String sql="";
		
		ArrayList<BeanVestiario> capiCriterioV= new ArrayList<BeanVestiario>();
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			if (genere==null) {
				sql = "SELECT * FROM vestiario WHERE modello=?";
				ps= con.prepareStatement(sql);
				ps.setString(1, modello);
				rs=ps.executeQuery();
			} else {
				sql = "SELECT * FROM vestiario WHERE modello=? AND codCategoria=?";
				ps= con.prepareStatement(sql);
				ps.setString(1, modello);
				ps.setString(2, genere);
				rs=ps.executeQuery();
			}

			while(rs.next()) {
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
					capiCriterioV.add(capo);
				}
			}
				
			return capiCriterioV;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (rs2 != null)
					rs2.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/* metodo che restituisce un dato capo di accessorio tramite tipologia e descrizione selezionate */ 
	public ArrayList<BeanAccessorio> getAccessorioByFilters(String tipologia,String genere) {
	
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
	
		ArrayList<BeanAccessorio> capiCriterioA= new ArrayList<BeanAccessorio>();

		String sql="";
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			
			if (genere==null) {
				sql = "SELECT * FROM accessorio WHERE tipologia=?";
				ps= con.prepareStatement(sql);
				ps.setString(1, tipologia);
				rs=ps.executeQuery();
			} else {
				sql = "SELECT * FROM accessorio WHERE tipologia=? AND codCategoria=?";
				ps= con.prepareStatement(sql);
				ps.setString(1, tipologia);
				ps.setString(2, genere);
				rs=ps.executeQuery();
			}
			
			while(rs.next()) {
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
					capiCriterioA.add(capo);
				}
			}
				
			return capiCriterioA;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	/* metodo che restituisce la lista dei capi data la categoria ricercata */
	public ArrayList<BeanCapo> getCapiByCategory(String categoria) {
		
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		String sql="";
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>();
	
		String sql1 = "SELECT * FROM vestiario WHERE codCategoria=?";
		String sql2 = "SELECT * FROM accessorio WHERE codCategoria=?";
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			ps1 = con.prepareStatement(sql1);
			ps2 = con.prepareStatement(sql2);
			
			ps1.setString(1,categoria);
			ps2.setString(1, categoria);
			
			rs1=ps1.executeQuery();
			rs2=ps2.executeQuery();
			
			while(rs1.next()) {
				sql = "SELECT * FROM rendeVisibile WHERE codVestiario=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setInt(1,rs1.getInt("codCapo"));
				rs3=ps.executeQuery();
				if (rs3.next()) {
					BeanVestiario capo= new BeanVestiario(); 
				
					//carico il bean con le informazioni prelevate
					capo.setCodCapo(rs1.getInt("codCapo"));
					capo.setDescrizione(rs1.getString("descrizione"));
					capo.setCodCategoria(rs1.getString("codCategoria"));
					capo.setColore(rs1.getString("colore"));
					capo.setCosto(rs1.getFloat("costo"));
					capo.setMateriale(rs1.getString("materiale"));
					capo.setModello(rs1.getString("modello"));
					capo.setNomeDeposito(rs1.getString("nomeDeposito"));
					capo.setTaglia(rs1.getString("taglia"));
				
					//aggiungo il capo nell'arrayList finale
					capi.add(capo);
				}
			}
			
			while(rs2.next()) {
				sql = "SELECT * FROM rendeVisibile WHERE codAccessorio=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setInt(1,rs2.getInt("codCapo"));
				rs3=ps.executeQuery();
				if (rs3.next()) {
					BeanAccessorio capo= new BeanAccessorio(); 
				
					//carico il bean con le informazioni prelevate
					capo.setCodCapo(rs2.getInt("codCapo"));
					capo.setDescrizione(rs2.getString("descrizione"));
					capo.setCodCategoria(rs2.getString("codCategoria"));
					capo.setCosto(rs2.getFloat("costo"));
					capo.setNomeDeposito(rs2.getString("nomeDeposito"));
					capo.setTipologia(rs2.getString("tipologia"));
				
					//aggiungo il capo nell'arrayList finale
					capi.add(capo);
				}
			}
			
			return capi;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs1 != null)
					rs1.close();
				if (rs2 != null)
					rs2.close();
				if (rs3 != null)
					rs3.close();
				if (ps1 != null)
					ps1.close();
				if (ps2 != null)
					ps2.close();
				if (ps != null)
					ps.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	
		return null;
	}
	
	/* metodo che recupera tutti i capi di vestiario */
	public ArrayList<BeanCapo> selectCapiVestiario(String genere) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql="";
			PreparedStatement ps;
			
			if (genere==null) {
				sql = "SELECT * FROM vestiario"; //creo la query
				ps = con.prepareStatement(sql);
				rs=ps.executeQuery(sql);
			} else {
				sql = "SELECT * FROM vestiario WHERE codCategoria=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setString(1, genere);
				rs=ps.executeQuery();
			}
			
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
	public ArrayList<BeanCapo> selectCapiAccessorio(String genere) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		ArrayList<BeanCapo> capi= new ArrayList<BeanCapo>(); //lista dei capi presi da database

		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			String sql="";
			PreparedStatement ps;
			
			if (genere==null) {
				sql = "SELECT * FROM accessorio"; //creo la query
				ps = con.prepareStatement(sql);
				rs=ps.executeQuery(sql);
			} else {
				sql = "SELECT * FROM accessorio WHERE codCategoria=?"; //creo la query
				ps = con.prepareStatement(sql);
				ps.setString(1, genere);
				rs=ps.executeQuery();
			}
			
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
}
	

	




