package it.cestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PagamentoModelDM {

	/* metodo che permette di creare un nuovo ordine */
	public boolean createOrdine(BeanOrdine ordine) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql="";
			if(ordine.getPagamentoConBonifico()!=null) 
				sql = "INSERT INTO ordine(dataOr,n_tracking,cf_cliente,codCarrello,pag_bonifico,nomeDitta) VALUES (?,?,?,?,?,?)"; //creo la query
			else if (ordine.getPagamentoConCarta()!=null) 
				sql = "INSERT INTO ordine(dataOr,n_tracking,cf_cliente,codCarrello,pag_carta,nomeDitta) VALUES (?,?,?,?,?,?)"; //creo la query

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,ordine.getDataOrdine());
			ps.setString(2,ordine.getNumeroTracking());
			ps.setString(3,ordine.getCodiceFiscale());
			ps.setInt(4, ordine.getCodiceCarrello());
			if(ordine.getPagamentoConBonifico()!=null)
				ps.setInt(5, ordine.getPagamentoConBonifico());
			else
				ps.setInt(5, ordine.getPagamentoConCarta());
			
			ps.setString(6, ordine.getDittaSpedizione());
			ps.executeUpdate();
		
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
	
	/* metodo che permette di trovare una carta di credito */
	public BeanCartaDiCredito findCartaDiCredito(String numeroCarta) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "SELECT * FROM cartaDiCredito WHERE numero_carta=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,numeroCarta);
			rs=ps.executeQuery();
		
			while(rs.next()) {
				BeanCartaDiCredito carta= new BeanCartaDiCredito();
				
				carta.setIdPagamento(rs.getInt("ID_pagamento"));
				carta.setCodiceFiscaleTitolare(rs.getString("cf_cliente"));
				carta.setNumeroCarta(rs.getString("numero_carta"));
				carta.setDataScadenza(rs.getString("data_scadenza"));
				carta.setCvv(rs.getString("CVV"));
				
				return carta;
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
		
		//restituisco null nel caso l'operazione non vada a buon fine
		return null;
	}
	
	/* metodo che permette di recuperare un bonifico di un cliente */
	
	/* metodo che permette di recuperare un bonifico */
	public BeanBonifico findBonifico(String iban) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "SELECT * FROM bonifico WHERE IBAN=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,iban);
			rs=ps.executeQuery();
		
			while(rs.next()) {
				BeanBonifico bonifico= new BeanBonifico();
				
				bonifico.setIdPagamento(rs.getInt("ID_pagamento"));
				bonifico.setIban(rs.getString("IBAN"));
				bonifico.setNomeMittente(rs.getString("nome_mittente"));
				bonifico.setNomeMittente(rs.getString("cf_cliente"));
				
				return bonifico;
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
		
		//restituisco null nel caso l'operazione non vada a buon fine
		return null;
	}
	
	/* metodo che permette di recuperare una fattura */
	
	/* metodo che permette di recuperare una fattura di un cliente */
	public float findFattura(int codOrdine) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "SELECT * FROM fattura WHERE codOrdine=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,codOrdine);
			rs=ps.executeQuery();
		
			if (rs.next()) {
				float spesaTotale=rs.getInt("importo_totale");
				return spesaTotale;
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
		
		//restituisco null nel caso l'operazione non vada a buon fine
		return 0;
	}
	
	/* metodo che permette di creare un fattura */
	public boolean createFattura(int codOrdine,int spesa,String codFattura) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "INSERT INTO fattura VALUES (?,?,?)"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,codFattura);
			ps.setInt(2,spesa);
			ps.setInt(3,codOrdine);
			
			ps.executeUpdate();
		
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
	
	/* metodo che permette di recuperare il codice di un ordine */
	public int findOrdine(String tracking) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "SELECT * FROM ordine WHERE n_tracking=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,tracking);
			rs=ps.executeQuery();
		
			if(rs.next()) {
				int codOrdine=rs.getInt("codOr");
				
				return codOrdine;
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
		
		//restituisco -1 nel caso l'operazione non vada a buon fine
		return -1;	
	}

	/* metodo che permette di inserire un bonifico relativo ad un cliente */
	public boolean insertBonifico(BeanBonifico bonifico) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "INSERT INTO bonifico(IBAN,nome_mittente,cf_cliente) VALUES (?,?,?)"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,bonifico.getIban());
			ps.setString(2,bonifico.getNomeMittente());
			ps.setString(3,bonifico.getCodiceFiscale());
			
			ps.executeUpdate();
		
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
	
	/* metodo che permette di inserire una carta relativa ad un cliente */
	public boolean insertCartaDiCredito(BeanCartaDiCredito cartaDiCredito) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "INSERT INTO cartaDiCredito(numero_carta,data_scadenza,CVV,cf_cliente) VALUES (?,?,?,?)"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cartaDiCredito.getNumeroCarta());
			ps.setString(2,cartaDiCredito.getDataScadenza());
			ps.setString(3,cartaDiCredito.getCvv());
			ps.setString(4,cartaDiCredito.getCodiceFiscaleTitolare());
			
			ps.executeUpdate();
		
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
	
	/* metodo che permette di recuperare una fattura */
	public BeanFattura findFattura(String idFattura) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql = "SELECT * FROM fattura WHERE ID_fattura=?"; //creo la query
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,idFattura);
			rs=ps.executeQuery();
		
			if(rs.next()) {
				BeanFattura fattura=new BeanFattura();
				
				fattura.setCodOrdine(rs.getInt("codOrdine"));
				fattura.setIdFattura(rs.getString("ID_fattura"));
				fattura.setTotale(rs.getFloat("importo_totale"));
				return fattura;
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
		
		//restituisco -1 nel caso l'operazione non vada a buon fine
		return null;	
	}
	
}
