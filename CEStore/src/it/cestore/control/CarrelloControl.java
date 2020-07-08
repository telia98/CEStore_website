package it.cestore.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanAccessorio;
import it.cestore.model.BeanCapo;
import it.cestore.model.BeanVestiario;
import it.cestore.model.CapoModelDM;

/**
 * Servlet per la gestione del carrello di un utente
 */
@WebServlet("/CarrelloControl")
public class CarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model=new CapoModelDM();
		
		String action=request.getParameter("action");
		ArrayList<BeanCapo> capi=(ArrayList<BeanCapo>) request.getSession().getAttribute("capi"); //lista capi attualmente in sessione

		//recupero il falso carrello
		ArrayList<BeanCapo> carrello = model.getCarrello("FFFFFF00F00F000F");
		
		if (action.equals("elimina")) {
			System.out.println("HO CLICCATO SUL CESTINO E VOGLIO ELIMINARE");
			//eliminiamo il capo dal carrello
			int codCapo=Integer.parseInt(request.getParameter("codCapo"));
			String tabella=request.getParameter("tabella");
			
			boolean result=model.deleteCarrello("FFFFFF00F00F000F", codCapo, tabella);
			if (result) {
				model.setVisible(codCapo, tabella);
				
				//aggiorniamo il carrello della sessione
				int indice=0;
				for(int i=0;i<carrello.size();i++) {
					if (tabella.equals("vestiario")) {
						if (carrello.get(i).getCodCapo()==codCapo && carrello.get(i).getClass()==BeanVestiario.class) {
							indice=i;
						}
					} else {
						if (carrello.get(i).getCodCapo()==codCapo && carrello.get(i).getClass()==BeanAccessorio.class) {
							indice=i;
						}
					}
				}
				
				//reinserisco il capo eliminato dal carrello nella lista dei capi in sessione
				capi.add(carrello.get(indice));
				request.getSession().setAttribute("capi",capi);
				
				carrello.remove(indice);
				request.getSession().setAttribute("carrello",carrello);
				
			} else {
				System.out.println("la cancellazione da DB non è andata a buon fine");
			}
		} else if (action.equals("null")) {			
			//salvo il carrello nella sessione
			request.getSession().setAttribute("carrello",carrello);
			
			for(BeanCapo c: carrello) {
				System.out.println("CAPO NEL CARRELLO: " + c);
			}
		}

		//restituisco tutto alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/carrello.jsp");
		dispatcher.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
