package it.cestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/** classe che implementa tutti i metodi che devono accedere e operare con il DB per gli utenti */

public class UtenteModelDM {

	/* metodo che permette di aggiungere un utente e le relative informazioni al DB quando effettua la registrazione */
	public boolean insertUtente(BeanUtente utente ) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql= "INSERT INTO anagrafica_cliente VALUES(?,?,?,(SELECT indirizzo_IP FROM sitoWeb))";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,utente.getCodiceFiscale());
			ps.setString(2,utente.getNome());
			ps.setString(3,utente.getCognome());
			ps.executeUpdate();
			
			sql = "INSERT INTO indirizzo_cliente VALUES (?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,utente.getVia());
			ps.setString(2,utente.getProvincia());
			ps.setString(3,utente.getCap());
			ps.setString(4,utente.getnCivico());
			ps.setString(5,utente.getCitta());
			ps.setString(6,utente.getCodiceFiscale());
			ps.executeUpdate();
			
			sql = "INSERT INTO utente VALUES (?,?,?,?,(SELECT indirizzo_IP FROM sitoWeb))";
			ps = con.prepareStatement(sql);
			ps.setString(1,utente.getUsername());
			ps.setString(2,utente.getPassword());
			ps.setString(3,utente.getMail());
			ps.setString(4,utente.getCodiceFiscale());
			ps.executeUpdate();
			
			//restituisco true se l'inserimento nel DB Ã¨ andato a buon fine
			return true; 
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
		
		//restituisco false se l'inserimento nel DB non Ã¨ andato a buon fine
		return false;
	}

	/* metodo che mi permette di controllare se un utente è presente nel DB dato il suo username */
	public boolean thereIsUtente(String nomeUtente) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			String sql= "SELECT * FROM utente WHERE username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,nomeUtente);
			rs=ps.executeQuery();
			
			if (rs.next()==true) //l'username è presente nel DB
				return true; 
			else 
				return false; //restituisco false se non è presente nel DB alcun utente con l'username dato
			
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
		
		//restituisco true se l'utente gia' esiste oppure ci sono stati problemi nell'operazione
		return true;	
	}

	/* metodo che elimina un utente dal DB e tutte le relative informazioni personali associate */
	public void deleteUtente(BeanUtente utente) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			//eseguo la query di eliminazione delle informazioni personali dell'utente
			String sql= "DELETE FROM anagrafica_cliente WHERE CF=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,utente.getCodiceFiscale());
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
	
	/* metodo che controlla la correttezza delle credenziali inserite al momento del login */
	public boolean checkLogin(String username, String password) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			//ricerco l'utente nel DB per controllare la correttezza dell'username inserito
			String sql= "SELECT * FROM utente WHERE username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,username);
			rs=ps.executeQuery();
			
			if (rs.next()) {  //se è presente l'username nel DB
					//controllo che la password inserita sia quella conosciuta dal DB
					String p=rs.getString("pax");
					if (password.equals(p)) //se non si verifica l'uguaglianza
						return true; //restituisco true
			} else
				return false;
			
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
		//restituisco false se l'operazione nel DB non è andata a buon fine
		return false;
	}
	
	/* metodo che permette di aggiungere un utente e le relative informazioni al DB quando effettua la registrazione */
	public BeanUtente searchUtente(String username) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		BeanUtente utente=new BeanUtente();
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "SELECT * FROM utente WHERE username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,username);
			rs=ps.executeQuery();
			if (rs.next()) {
				utente.setUsername(rs.getString("username"));
				utente.setPassword(rs.getString("pax"));
				utente.setMail(rs.getString("mail"));
				utente.setCodiceFiscale(rs.getString("cf_cliente"));
			}
			
			sql = "SELECT * FROM anagrafica_cliente WHERE CF=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,utente.getCodiceFiscale());
			rs1=ps.executeQuery();
			if (rs1.next()) {
				utente.setNome(rs1.getString("nome"));
				utente.setCognome(rs1.getString("cognome"));
			}
			
			sql = "SELECT * FROM indirizzo_cliente WHERE cf_cliente=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,utente.getCodiceFiscale());
			rs2=ps.executeQuery();
			if (rs2.next()) {
				utente.setVia(rs2.getString("via"));
				utente.setProvincia(rs2.getString("provincia"));
				utente.setCap(rs2.getString("CAP"));
				utente.setnCivico(rs2.getString("n_civico"));
				utente.setCitta(rs2.getString("città"));
			}
		
			return utente;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				if (rs != null)
					rs.close();
				if (rs1 != null)
					rs1.close();
				if (rs2 != null)
					rs2.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

	/* metodo che permette di modificare le informazioni anagrafiche e di accesso dell'utente */
	public boolean updateInformazioni(BeanUtente utente) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "UPDATE utente SET username=?, pax=?, mail=? WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,utente.getUsername());
			ps.setString(2,utente.getPassword());
			ps.setString(3,utente.getMail());
			ps.setString(4,utente.getCodiceFiscale());
			
			ps.executeUpdate();
			
			sql = "UPDATE anagrafica_cliente SET nome=?, cognome=? WHERE CF=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,utente.getNome());
			ps.setString(2,utente.getCognome());
			ps.setString(3,utente.getCodiceFiscale());
			ps.executeUpdate();
		
			return true;
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
		
		return false; //se l'aggiornamento non va a buon fine
	}
	
	/* metodo che permette di modificare l'indirizzo dell'utente */
	public boolean updateIndirizzo(BeanUtente utente) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
			
			String sql = "UPDATE indirizzo_cliente SET via=?, provincia=?, CAP=?, n_civico=?, città=? WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,utente.getVia());
			ps.setString(2,utente.getProvincia());
			ps.setString(3,utente.getCap());
			ps.setString(4,utente.getnCivico());
			ps.setString(5,utente.getCitta());
			ps.setString(6,utente.getCodiceFiscale());
			ps.executeUpdate();
			
			return true;
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
		
		return false; //se l'aggiornamento non va a buon fine
	}

	/* metodo che permette di recuperare la lista delle carte di credito registrate al sistema di un dato cliente */
	public ArrayList<BeanCartaDiCredito> getCarteDiCredito(String cf) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<BeanCartaDiCredito> carte=null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			//ricerco l'utente nel DB per controllare la correttezza dell'username inserito
			String sql= "SELECT * FROM cartaDiCredito WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
			rs=ps.executeQuery();
			carte=new ArrayList<BeanCartaDiCredito>();
			while (rs.next()) { 
				BeanCartaDiCredito carta= new BeanCartaDiCredito();
				
				carta.setCodiceFiscaleTitolare(rs.getString("cf_cliente"));
				carta.setCvv(rs.getString("CVV"));
				carta.setNumeroCarta(rs.getString("numero_carta"));
				carta.setDataScadenza(rs.getString("data_scadenza"));
				carta.setIdPagamento(rs.getInt("ID_pagamento"));
				
				carte.add(carta);
			}
			return carte;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				if (rs != null)
					rs.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco null se l'operazione nel DB non è andata a buon fine
		return null;
	}
	
	/* metodo che permette di recuperare la lista dei bonifici registrati al sistema di un dato cliente */
	public ArrayList<BeanBonifico> getBonifici(String cf) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<BeanBonifico> bonifici=null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			//ricerco l'utente nel DB per controllare la correttezza dell'username inserito
			String sql= "SELECT * FROM bonifico WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
			rs=ps.executeQuery();
			bonifici=new ArrayList<BeanBonifico>();
			while (rs.next()) { 
				BeanBonifico bonifico= new BeanBonifico();
				
				bonifico.setIdPagamento(rs.getInt("ID_pagamento"));
				bonifico.setIban(rs.getString("IBAN"));
				bonifico.setNomeMittente(rs.getString("nome_mittente"));
				bonifico.setCodiceFiscale(rs.getString("cf_cliente"));
				
				bonifici.add(bonifico);
			}
			
			return bonifici;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				if (rs != null)
					rs.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco null se l'operazione nel DB non è andata a buon fine
		return null;
	}
	
	/* metodo che permette di recuperare la lista delle fatture dell'ordine di un dato cliente */
	public ArrayList<BeanFattura> getFatture(String cf) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<BeanFattura> fatture=null;
		
		try {
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();
		
			//ricerco l'utente nel DB per controllare la correttezza dell'username inserito
			String sql= "SELECT * FROM ordine WHERE cf_cliente=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,cf);
			rs=ps.executeQuery();
			fatture=new ArrayList<BeanFattura>();
			
			while (rs.next()) { 
				int codOrdine=rs.getInt("codOr");
				String sq= "SELECT * FROM fattura WHERE codOrdine=?";
				PreparedStatement p = con.prepareStatement(sq);
				p.setInt(1,codOrdine);
				rs2=p.executeQuery();
				if (rs2.next()) {
					BeanFattura fattura=new BeanFattura();
					fattura.setCodOrdine(codOrdine);
					fattura.setIdFattura(rs2.getString("ID_fattura"));
					fattura.setTotale(rs2.getInt("importo_totale"));
					
					fatture.add(fattura);
				}
			}
			
			return fatture;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				if (rs != null)
					rs.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//restituisco null se l'operazione nel DB non è andata a buon fine
		return null;
	}
	
}
