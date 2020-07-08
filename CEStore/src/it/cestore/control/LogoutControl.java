package it.cestore.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet per la gestione delle operazioni di logout dal sistema
 */
@WebServlet("/Logout")
public class LogoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//chiudo la sessione rimuovendo gli attributi impostati al login
		request.getSession().removeAttribute("adminRoles");
		request.getSession().removeAttribute("nameuser");
		request.getSession().removeAttribute("utente");
		request.getSession().invalidate();
		
		//in caso di logout si viene sempre reindirizzati alla homepage
		String redirectedPage="/homepage.jsp";
		response.sendRedirect(request.getContextPath()+ redirectedPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
