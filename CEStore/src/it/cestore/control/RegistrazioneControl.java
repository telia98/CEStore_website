package it.cestore.control;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanUtente;
import it.cestore.model.UtenteModelDM;

/**
 * Servlet per la gestione della registrazione di nuovi utenti al sistema
 */
@WebServlet("/RegistrazioneControl")
public class RegistrazioneControl extends HttpServlet {
	private static final long serialVersionUID= 1L;
	private String expNome="^[a-z A-Z àéèìòù]{2,15}$";
	private String expCognome="^[a-z A-Z àéèìòù]{2,20}$";
	private String expEmail="^[A-z0-9\\.\\+_-]+@[A-z0-9\\._-]+\\.[A-z]{2,6}";
	private String expPassword="((?=.*[0-9])(?=.*[a-zA-Z]).{6,})$";
	private String expCodiceFiscale="[a-z,A-Z]{6}[0-9]{2}[a-z,A-Z][0-9]{2}[a-z,A-Z][0-9]{3}[a-z,A-Z]";
	private String expCitta="^[a-z A-Z àéèìòù]{2,30}$";
	private String expProvincia="^[a-z A-Z àéèìòù]{2,20}$";
	private String expVia="^[a-z A-Z àéèìòù]{2,50}$";
	private String expNCivico="^[a-z A-Z 0-9]{2,4}$";
	private String expCap="^[0-9]{2,7}$";
	
	UtenteModelDM model=new UtenteModelDM();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//conterrà i messaggi di errore generati dalla servlet
				String error=""; 
				String message="registrazione effettuata correttamente";
				
				request.removeAttribute("error");
				request.removeAttribute("message");
				
				//leggo i parametri inseriti nel form 
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String email=request.getParameter("email");
				
				String nome=request.getParameter("nome");
				String cognome=request.getParameter("cognome");
				String cf=request.getParameter("codiceFiscale").toUpperCase();
				String citta=request.getParameter("citta");
				String provincia=request.getParameter("provincia").toUpperCase();
				String via=request.getParameter("via");
				String ncivico=request.getParameter("numeroCivico");
				String cap=request.getParameter("CAP");
				
				if (valida(username,password,email,nome,cognome,cf,citta,provincia,via,ncivico,cap)) {
					//creo l'oggetto che deve essere caricato
					BeanUtente utente=new BeanUtente();
					utente.setUsername(username);
					utente.setPassword(password);
					utente.setMail(email);
				
					utente.setNome(nome);
					utente.setCognome(cognome);
					utente.setCodiceFiscale(cf);
					utente.setCitta(citta);
					utente.setProvincia(provincia);
					utente.setVia(via);
					utente.setnCivico(ncivico);
					utente.setCap(cap);
					
					//leggo i campi del form e li controllo
					//controllo se l'username inserito è unico nel DB
					boolean test=model.thereIsUtente(username);
					if (test==true) {
						error="username già presente nel DB,cambiare il nome utente inserito";
						request.setAttribute("error",error);
					} else {
						//chiamo il metodo che comunica con il db ed esegue l'operazione di inserimento
						boolean rs=model.insertUtente(utente);
						if (rs)
							request.setAttribute("message",message);
					}
				} else {
					error="validazione fallita, inserire i dati che rispettano il formato richiesto";
					request.setAttribute("error",error);
				}
				
				//ritorno alla jsp sia in caso di successo sia in caso di insuccesso della registrazione
				RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/registrazione.jsp");
				dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/* validazione dati form lato server */
	private boolean valida(String username, String password, String email, String nome, String cognome, String cf, String citta, String provincia, String via, String nCivico, String cap) {
		boolean valido=true;

		if(username.length()>30) {
			valido=false;
		}
	
		if (!Pattern.matches(expPassword, password)) {
			valido=false;
		}
		if (!Pattern.matches(expEmail, email)) {
			valido=false;
		}
		
		if (!Pattern.matches(expNome, nome)) {
			valido=false;
		}
		
		if (!Pattern.matches(expCognome, cognome)) {
			valido=false;
		}
		
		if (!Pattern.matches(expCodiceFiscale, cf)) {
			valido=false;
		}
		
		if (!Pattern.matches(expCitta, citta)) {
			valido=false;
		}
		
		if (!Pattern.matches(expProvincia, provincia)) {
			valido=false;
		}
		
		if (!Pattern.matches(expVia, via)) {
			valido=false;
		}
		
		if (!Pattern.matches(expNCivico, nCivico)) {
			valido=false;
		}
		
		if (!Pattern.matches(expCap, cap)) {
			valido=false;
		}
		
		return valido;
	}
}
