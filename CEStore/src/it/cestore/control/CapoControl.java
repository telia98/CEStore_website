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
import it.cestore.model.BeanVestiario;
import it.cestore.model.CapoModelDM;
import it.cestore.model.DriverManagerConnectionPool;
import it.cestore.model.FiltersDM;

/** Servlet per la gestione della jsp che si occupa della visualizzazione di un singolo capo */

@WebServlet("/CapoControl")
public class CapoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//nella request prelevo il codice del capo da visualizzare caricato tramite il form nascosto
		int pos= Integer.parseInt(request.getParameter("pos"));
		
		//tutte le connessioni al DB sono gestite direttamente dalla classe DM
		CapoModelDM model=new CapoModelDM();	
		//prelevo tutti i capi dalla sessione
		ArrayList<BeanCapo> capi= (ArrayList<BeanCapo>) request.getSession().getAttribute("capi");
		//recupero il capo da visualizzare
		BeanCapo capo=capi.get(pos);
		//nella request setto il capo prelevato nella posizione pos indicata
		request.setAttribute("capo",capo);

		//restituisco tutto alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/visualizzazioneCapo.jsp");
		dispatcher.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}