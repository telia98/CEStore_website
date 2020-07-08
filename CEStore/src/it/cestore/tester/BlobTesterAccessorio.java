package it.cestore.tester;
import it.cestore.model.DriverManagerConnectionPool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class BlobTesterAccessorio {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		try {
			
			con = DriverManagerConnectionPool.createDBConnection();
			st = con.createStatement();

			//carico blob per immagini linkFoto1 e linkFoto2
			for(int i=1;i<72;i++) {
				String sql="UPDATE accessorio SET linkFoto1=?,linkFoto2=? WHERE codCapo=?";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
			
				//elaboro le immagini come se fossero file
				// read the file
				//converto il codice del capo in intero per costruire il nome dell'immagine
				String cartella1="accessorio/link1/";
				String cartella2="accessorio/link2/";
				String nomeImmagine=Integer.toString(i) + ".jpg";
				System.out.println(nomeImmagine);
				
				File file1 = new File(cartella1.concat(nomeImmagine));
				File file2 = new File(cartella2.concat(nomeImmagine));

				FileInputStream input1 = new FileInputStream(file1); //trasformo l'immagine in binario
				FileInputStream input2 = new FileInputStream(file2); //trasformo l'immagine in binario

				// set parameters
				pstmt.setBinaryStream(1, input1); //setto il blob
				pstmt.setBinaryStream(2, input2); //setto il blob
				pstmt.setInt(3,i);
            
				// store the resume file in database
				System.out.println("Store file in the database.");
				pstmt.executeUpdate();
			}
			
			String sql="UPDATE accessorio SET linkFoto3=? WHERE codCapo=?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
		
			// read the file
			String cartella3="accessorio/link3/";
			
			//carico blob per immagini linkFoto3
			for(int i=1;i<10;i++) {

				String nomeImmagine=Integer.toString(i) + ".jpg";
			
				File file3 = new File(cartella3.concat(nomeImmagine));

				FileInputStream input3 = new FileInputStream(file3); //trasformo l'immagine in binario

				// set parameters
				pstmt.setBinaryStream(1, input3); //setto il blob
				pstmt.setInt(2,i);
            
				// store the resume file in database
				System.out.println("Store file in the database.");
				pstmt.executeUpdate();
			}
			
			for(int i=19;i<46;i++) {

				String nomeImmagine=Integer.toString(i) + ".jpg";
				
				File file3 = new File(cartella3.concat(nomeImmagine));

				FileInputStream input3 = new FileInputStream(file3); //trasformo l'immagine in binario

				// set parameters
				pstmt.setBinaryStream(1, input3); //setto il blob
				pstmt.setInt(2,i);
            
				// store the resume file in database
				System.out.println("Store file in the database.");
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				DriverManagerConnectionPool.releaseConnection(con);
			} catch (SQLException e) {
				printSQLException(e);
			}
		}
	}
	
	public static void printResult(ResultSet rs) {
		
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				System.out.print(rsmd.getColumnLabel(i) + " ");
			}
			System.out.println("");
			
			while (rs.next()) {
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					System.out.print(rs.getString(i) + " ");
				}
				System.out.println("");
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public static void printSQLException(SQLException ex) {
		System.out.println("SQLException description:");
		while (ex != null) {
			System.out.println("Message: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("ErrorCode: " + ex.getErrorCode());
			ex = ex.getNextException();
		}
	}
}
