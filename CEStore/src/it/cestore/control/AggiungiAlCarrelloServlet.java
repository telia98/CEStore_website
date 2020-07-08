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

/**
 * Servlet implementation class AggiungiAlCarrelloServlet
 */
@WebServlet("/AggiungiAlCarrelloServlet")
public class AggiungiAlCarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model=new CapoModelDM();
		BeanCapo capo=null;
		
		int codCapo=Integer.parseInt(request.getParameter("capo"));
		String tabella=request.getParameter("tabella");
		ArrayList<BeanCapo> capi=(ArrayList<BeanCapo>) request.getSession().getAttribute("capi"); //lista capi attualmente in sessione
		
		//rendiamo indisponibile il capo da inserire nel carrello
		if (tabella.equals("vestiario")) {
			capo=model.selectVestiario(codCapo);
			model.setInvisible(capo.getCodCapo(), tabella);
		} else {
			capo=model.selectAccessorio(codCapo);
			model.setInvisible(capo.getCodCapo(), tabella);
		}
		
		//aggiungiamo il capo al carrello "falso" del sistema
		ArrayList<BeanCapo> carrello=new ArrayList<BeanCapo>();
		carrello.add(capo);
		boolean result=model.insertCarrello("FFFFFF00F00F000F", carrello);

		if (result) {
			System.out.println("capo aggiunto al falso carrello");
			if (request.getSession().getAttribute("carrello")==null) {
				request.getSession().setAttribute("carrello",carrello);
			} else {
				ArrayList<BeanCapo> carrelloSessione=(ArrayList<BeanCapo>) request.getSession().getAttribute("carrello");
				carrelloSessione.add(capo);
				request.getSession().setAttribute("carrello",carrelloSessione);
			}
			
			System.out.println("CAPO AGGIUNTO AL CARRELLO " + capo);
			
			//aggiorno la lista dei capi caricata in sessione togliendo il capo aggiunto al carrello
			int pos=-1;
			for(int i=0;i<capi.size();i++) {
				if (capi.get(i).getCodCapo()==capo.getCodCapo() && capi.get(i).getClass()==capo.getClass()) 
					pos=i;
			}
			System.out.println("POSIZIONE CAPO DA ELIMINARE " + pos);
			capi.remove(pos);

			request.getSession().setAttribute("capi", capi);
		} else 
			System.out.println("capo non aggiunto al falso carrello");
		
		String filter= (String) request.getSession().getAttribute("filter");
		//restituisco tutto alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/visualizzazioneCapi.jsp?page=1&filter=" + filter);
		dispatcher.forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
