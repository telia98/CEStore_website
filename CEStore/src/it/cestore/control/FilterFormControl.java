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
import it.cestore.model.FiltersDM;

/**
 * Servlet implementation class FilterFormControl
 */
@WebServlet("/FilterFormControl")
public class FilterFormControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		String filter=request.getParameter("filter");
		FiltersDM model=new FiltersDM();
		
		if (action!=null) {
			if (action.equals("taglia")) {
				String[] results = request.getParameterValues("size");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
				
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByTaglia(results[i]);
					
					for (BeanCapo capo: provvisorio) {
					    System.out.println(capo);
					}
					capi.addAll(provvisorio);
				}
				
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);
			}
			
			if (action.equals("colore")) {
				String[] results = request.getParameterValues("color");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
			
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByColore(results[i]);
					
					for (BeanCapo capo: provvisorio) {
						System.out.println(capo);
					}
					capi.addAll(provvisorio);
				}
			
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);
			}
			
			if (action.equals("materiale")) {
				String[] results = request.getParameterValues("materials");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
			
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByMateriale(results[i]);
					
					for (BeanCapo capo: provvisorio) {
						System.out.println(capo);
					}
					
					capi.addAll(provvisorio);
				}
			
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);	
			}
			
			if (action.equals("brand")) {
				String[] results = request.getParameterValues("brand");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
			
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByBrand(results[i]);
					
					for (BeanCapo capo: provvisorio) {
						System.out.println(capo);
					}
					
					capi.addAll(provvisorio);
					
					provvisorio=model.getAccessorioByBrand(results[i]);
					capi.addAll(provvisorio);
				}
			
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);		
			}
			
			if (action.equals("fantasia")) {
				String[] results = request.getParameterValues("style");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
			
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByFantasia(results[i]);
					
					for (BeanCapo capo: provvisorio) {
						System.out.println(capo);
					}
					
					capi.addAll(provvisorio);
					provvisorio=model.getAccessorioByFantasia(results[i]);
					capi.addAll(provvisorio);
				}
			
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);	
			}
			
			if (action.equals("stagione")) {
				String[] results = request.getParameterValues("pattern");
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
			
				for (int i = 0; i < results.length; i++) {
					ArrayList<BeanCapo> provvisorio=new ArrayList<BeanCapo>();
					provvisorio=model.getVestiarioByStagione(results[i]);
					
					for (BeanCapo capo: provvisorio) {
						System.out.println(capo);
					}
					
					capi.addAll(provvisorio);
				}
			
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);		
			}
		}
		
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/visualizzazioneCapi.jsp?page=" + page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
