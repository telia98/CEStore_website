package it.cestore.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanCapo;
import it.cestore.model.CapoModelDM;
import it.cestore.model.FiltersDM;

/**
 * Servlet per la gestione della jsp che si occupa della visualizzazione dei capi
 */
@WebServlet("/CapiControl")
public class CapiControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//gestisco il numero di pagina e la direzione di visualizzazione
		int page=Integer.parseInt(request.getParameter("page"));
		String filter=request.getParameter("filter");
		
		request.getSession().setAttribute("page",page);
		request.getSession().setAttribute("filter", filter);
		//tutte le connessioni al DB sono gestite direttamente dalle classi DM
		CapoModelDM model=new CapoModelDM();
	
		//nella request setto l'attributo capi che conterrà tutti i capi recuperati dal DB
		request.getSession().setAttribute("capi",model.selectCapi());
		
		//restituisco tutto alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/visualizzazioneCapi.jsp?page=" + page);
		dispatcher.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
