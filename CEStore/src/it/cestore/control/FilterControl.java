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
import it.cestore.model.FiltersDM;

/**
 * Servlet implementation class FilterControl
 */
@WebServlet("/FilterControl")
public class FilterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model = new CapoModelDM();
		FiltersDM modelFilter= new FiltersDM();

		String action=request.getParameter("action"); //criterio di ricerca
		String filter=request.getParameter("filter"); //filtro attivo o meno
		int page=Integer.parseInt(request.getParameter("page"));

		if (action!=null) { 
			if (action.equals("ajax")) { 
				//devo visualizzare i capi richiesti tramite ricerca ajax
				String ricerca=request.getParameter("ricerca"); //campo text del form
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
				capi = model.selectCapi(ricerca);
				
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);
				
				System.out.println("LISTA CAPI");
				for(int i=0; i<capi.size();i++) {
					System.out.println(capi.get(i).toString());
				}
			} else if (action.equals("donna")||action.equals("uomo")||action.equals("unisex")) { 
				
				//devo visualizzare i capi uomo/donna/unisex richiesti tramite la barra di ricerca
				String codCategoria="";
				//setto il codice per il recupero da DB
				if (action.equals("donna"))
					codCategoria="01";
				else if (action.equals("uomo"))
					codCategoria="02";
				else
					codCategoria="03";
				
				ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
				capi = modelFilter.getCapiByCategory(codCategoria);
				
				System.out.println("LISTA CAPI");
				for(int i=0; i<capi.size();i++) {
					System.out.println(capi.get(i).toString());
				}
				
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);
				
				/* settiamo un attributo nella sessione che indica che da quel momento in poi 
				tutte le ricerche verranno fatte in base a quel genere indicato */
				request.getSession().setAttribute("genere",codCategoria); //donna,uomo,unisex
				
			} else if (action.equals("vestiario")||action.equals("accessorio")) {
				//devo cercare in base alla categoria del capo: accessorio/ vestiario
				if (action.equals("vestiario")) {
					ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
					String categoria=(String) request.getSession().getAttribute("genere");
					System.out.println("LA CATEGORIA CONSIDERATA E' " + categoria);
					capi=modelFilter.selectCapiVestiario(categoria);
					request.getSession().setAttribute("capi",capi);
					
					System.out.println("LISTA CAPI");
					for(int i=0; i<capi.size();i++) {
						System.out.println(capi.get(i).toString());
					}
				} else {
					ArrayList<BeanCapo> capi=new ArrayList<BeanCapo>();
					String categoria=(String) request.getSession().getAttribute("genere");
					System.out.println("LA CATEGORIA CONSIDERATA E' " + categoria);
					capi=modelFilter.selectCapiAccessorio(categoria);	
					request.getSession().setAttribute("capi",capi);
					
					System.out.println("LISTA CAPI");
					for(int i=0; i<capi.size();i++) {
						System.out.println(capi.get(i).toString());
					}
				}
				
				request.getSession().setAttribute("filter",filter);
			} else if (action.equals("maglia")||action.equals("pantalone")||action.equals("giacca")||action.equals("vestito")||action.equals("scarpe")) {
				//devo visualizzare i capi di vestiario richiesti per modello
				String categoria=(String) request.getSession().getAttribute("genere");
				System.out.println("LA CATEGORIA CONSIDERATA E' " + categoria);
				
				ArrayList<BeanVestiario> capi=new ArrayList<BeanVestiario>();
				capi = modelFilter.getVestiarioByFilters(action,categoria);
				
				System.out.println("LISTA CAPI");
				for(int i=0; i<capi.size();i++) {
					System.out.println(capi.get(i).toString());
				}
				
				request.getSession().setAttribute("capi",capi);
				request.getSession().setAttribute("filter",filter);
			} else if (action.equals("borsa")||action.equals("gioielli")||action.equals("sciarpe")||action.equals("cappelli")) {
				//devo visualizzare i capi di vestiario richiesti per modello
				String categoria=(String) request.getSession().getAttribute("genere");
				System.out.println("LA CATEGORIA CONSIDERATA E' " + categoria);
				
				ArrayList<BeanAccessorio> capi=new ArrayList<BeanAccessorio>();
				capi = modelFilter.getAccessorioByFilters(action,categoria);
				
				System.out.println("LISTA CAPI");
				for(int i=0; i<capi.size();i++) {
					System.out.println(capi.get(i).toString());
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
