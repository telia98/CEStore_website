package it.cestore.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/** 
 * classe che gestisce le operazioni di recupero e salvataggio
 * delle immagini dal DB del sistema
 */
public class PhotoControl {

	/* per recuperare dal DB l'immagine del capo */
	public synchronized static byte[] load(int codCapo, String tabella, String linkFoto) {
		Connection connection=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		byte[] bt=null;
		
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			String sql;
			if (tabella.equals("accessorio"))
				sql="SELECT " + linkFoto + " FROM accessorio WHERE codCapo=?";
			else
				sql="SELECT " + linkFoto + " FROM vestiario WHERE codCapo=?";
			
			stmt=connection.prepareStatement(sql);
			stmt.setInt(1,codCapo);
			rs=stmt.executeQuery();
			
			if (rs.next())
				bt=rs.getBytes(linkFoto);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt!=null)
					stmt.close();
				if (connection!=null)
					DriverManagerConnectionPool.releaseConnection(connection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bt;
	}
	
	/* per caricare nel DB l'immagine di un capo */
	public synchronized static void upload(int codCapo, String foto, String tabella,String colonna) {
		Connection connection=null;
		PreparedStatement stmt=null; 
		System.out.println("FOTO PASSATA A UPLOAD: " + foto);
		try {
			connection= DriverManagerConnectionPool.createDBConnection();
			String sql="UPDATE "+ tabella + " SET " + colonna + "=? WHERE codCapo=?";
			stmt= connection.prepareStatement(sql);
			File file=new File(foto);
			
			try {
				FileInputStream fis=new FileInputStream(file);
				
				stmt.setBinaryStream(1, fis, fis.available());
				stmt.setInt(2, codCapo);
				
				stmt.executeUpdate();
				//con.commit();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt!=null)
					stmt.close();
				if (connection!=null)
					DriverManagerConnectionPool.releaseConnection(connection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
