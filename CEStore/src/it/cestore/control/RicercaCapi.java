package it.cestore.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import it.cestore.model.BeanCapo;
import it.cestore.model.CapoModelDM;

/**
 * Servlet implementation class RicercaCapi per ricerca capi tramite ajax
 */
@WebServlet("/RicercaCapi")
public class RicercaCapi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model = null;
		model = new CapoModelDM();			
		 
		JSONArray prodJson = new JSONArray();
		String query = request.getParameter("ricerca");

		if (query != null) {
			List<BeanCapo> capi=null;
			capi = model.selectCapi(query);
			
			for (BeanCapo c : capi) {
				prodJson.put(c.getDescrizione());
				System.out.println("stringa trovata:" + c.getDescrizione());
			}
		}
		
		response.setContentType("application/json");
		response.getWriter().append(prodJson.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
