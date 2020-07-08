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
 * Servlet per la gestione della pagina personale dell'utente
 */
@WebServlet("/AreaUtenteControl")
public class AreaUtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UtenteModelDM model=new UtenteModelDM();
		BeanUtente utente=(BeanUtente) request.getSession().getAttribute("utente");
		System.out.println("ACCOUNT PRESO DA SESSIONE " + utente.toString());
		String action= request.getParameter("action");
		String message="";
		String error="";
		
		if (action!=null) {
			if (action.equals("modificaInfo")) {
				//recupero dati dal form
				String nome=request.getParameter("nome");
				String cognome=request.getParameter("cognome");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String email=request.getParameter("email");
				
				if (valida(username,password,email,nome,cognome,utente.getCodiceFiscale(),utente.getCitta(),utente.getProvincia(),utente.getVia(),utente.getnCivico(),utente.getCap())) {
					BeanUtente u=new BeanUtente();
					u.setNome(nome);
					u.setCognome(cognome);
					//lavoriamo con il CF dell'utente in sessione così ci assicuriamo che se modificato per sbaglio, non ci sono problemi
					u.setCodiceFiscale(utente.getCodiceFiscale());
					u.setUsername(username);
					u.setPassword(password);
					u.setMail(email);
				
					boolean result=model.updateInformazioni(u);
					if (result)
						message="aggiornamento effettuato correttamente";
					else
						error="aggiornamento fallito";
				} else {
					error="formato dati non valido: assicurarsi che tutti i campi siano verdi";
				}
			} else if (action.equals("modificaIndirizzo")) {
				//recupero dati dal form
				String via=request.getParameter("via");
				String numeroCivico=request.getParameter("numeroCivico");
				String provincia=request.getParameter("provincia");
				String cap=request.getParameter("CAP");
				String citta=request.getParameter("citta");

				if (valida(utente.getUsername(),utente.getPassword(),utente.getMail(),utente.getNome(),utente.getCognome(),utente.getCodiceFiscale(),citta,provincia,via,numeroCivico,cap)) {
					utente.setVia(via);
					utente.setnCivico(numeroCivico);
					utente.setProvincia(provincia);
					utente.setCap(cap);
					utente.setCitta(citta);
					
					boolean result=model.updateIndirizzo(utente);
					if (result)
						message="aggiornamento effettuato correttamente";
					else
						error="aggiornamento fallito";
				} else {
					error="formato dati non valido: assicurarsi che tutti i campi siano verdi";
				}
			}
		}
		
		//aggiorno l'utente in sessione con le nuove modifiche, cosi' nella pagina vengono visualizzate direttamente
		utente=model.searchUtente(utente.getUsername());
		request.getSession().setAttribute("utente",utente);
		request.setAttribute("error",error);
		request.setAttribute("message",message);
		
		//ritorno alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/areaUtente.jsp");
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
