package it.cestore.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanBonifico;
import it.cestore.model.BeanCartaDiCredito;
import it.cestore.model.BeanFattura;
import it.cestore.model.BeanUtente;
import it.cestore.model.UtenteModelDM;

/**
 * Servlet per la gestione delle operazioni di controllo credenziali e login al sistema 
 */
@WebServlet("/Login")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UtenteModelDM model=new UtenteModelDM();
	
	//credenziali dell'unico amministratore del sistema
	String usernameAdmin= "admin";
	String passwordAdmin= "admin";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String redirectedPage;
		String message;
		
		//effettuo il controllo delle credenziali
		
		if(username.equals(usernameAdmin)&&password.equals(passwordAdmin)) {
			//controllo se le credenziali inserite sono quelle dell'admin
			BeanUtente admin=new BeanUtente();
			admin.setUsername(usernameAdmin);
			admin.setPassword(passwordAdmin);
			
			request.getSession().setAttribute("utente",admin);
			
			//settiamo nella sessione che chi si è loggato non è un admin 
			request.getSession().setAttribute("adminRoles", true);
			
			//deve essere reindirizzato alla pagina riservata all'amministratore
			redirectedPage="/areaAmministratore.jsp";
		} else {
			//se le credenziali inserite non sono quelle dell'amministratore procedo con il controllo comune per gli user
			
			boolean result=model.checkLogin(username, password);
			if (result==false) {
				message="autenticazione fallita";
				//visualizzare pagina di errore
				redirectedPage="/errorPage.jsp?message=" + message;
			} else {
				//settiamo l'oggetto utente nella sessione
				BeanUtente utente=model.searchUtente(username);
				request.getSession().setAttribute("utente",utente);
				
				//settiamo nella sessione che chi si è loggato non è un admin 
				request.getSession().setAttribute("adminRoles",false);
				//settiamo nella sessione il nome dell'username che si è appena loggato
				request.getSession().setAttribute("nameuser",username);
			
				ArrayList<BeanCartaDiCredito> carte=model.getCarteDiCredito(utente.getCodiceFiscale());
				if(carte!=null)
					request.getSession().setAttribute("carte",carte);
				
				ArrayList<BeanBonifico> bonifici=model.getBonifici(utente.getCodiceFiscale());
				if (bonifici!=null)
					request.getSession().setAttribute("bonifici",bonifici);
				
				ArrayList<BeanFattura> fatture=model.getFatture(utente.getCodiceFiscale());
				if (fatture!=null)
					request.getSession().setAttribute("fatture", fatture);
				
				//torno alla pagina precedente da cui ha richiesto l'operazione di login
				redirectedPage="/areaUtente.jsp";
			}
		}
		
		response.sendRedirect(request.getContextPath() + redirectedPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
