package it.cestore.control;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.cestore.model.BeanAccessorio;
import it.cestore.model.BeanVestiario;
import it.cestore.model.CapoModelDM;

/**
 * Servlet per la gestione della pagina dell'amministratore
 */
@WebServlet("/AreaAdminControl")
@MultipartConfig
public class AreaAdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SetPictureServlet fileUpload=new SetPictureServlet();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CapoModelDM model=new CapoModelDM();
		
		//action - serve per stabilire che tipo di operazione è stata richiesta
		String action=request.getParameter("action");
		String message="";
		String error="";
		
		if (action!=null) {
			if(action.equalsIgnoreCase("insertVestiario")) {
				//prelevo i parametri inseriti nel form 
				String codCategoria=request.getParameter("codiceCategoria");
				String taglia=request.getParameter("taglia");
				String colore=request.getParameter("colore");
				String materiale=request.getParameter("materiale");
				String info=request.getParameter("info");
				String marca=request.getParameter("marca");
				String collezione=request.getParameter("collezione");
				String vestibilita=request.getParameter("vestibilita");
				String fantasia=request.getParameter("fantasia");
				String stagione=request.getParameter("stagione");
				float costo=Float.parseFloat(request.getParameter("costo"));
				String modello=request.getParameter("modello");
				Part fPart1 =request.getPart("linkFoto1");
				Part fPart2 =request.getPart("linkFoto2");
				Part fPart3 =request.getPart("linkFoto3");
	            String fileName1=Paths.get(fPart1.getSubmittedFileName()).getFileName().toString();
	            String fileName2=Paths.get(fPart2.getSubmittedFileName()).getFileName().toString();
	            String fileName3=Paths.get(fPart3.getSubmittedFileName()).getFileName().toString();
	            
				//costruisco la stringa della descrizione
				String descrizione="info " + info + ",marca " + marca + ",collezione " + collezione + ", vestibilità " + vestibilita + ",fantasia " + fantasia + ",stagione "+ stagione;
				
				//creo il bean
				BeanVestiario vestiario=new BeanVestiario();
				vestiario.setCodCategoria(codCategoria);
				vestiario.setTaglia(taglia);
				vestiario.setColore(colore);
				vestiario.setMateriale(materiale);
				vestiario.setDescrizione(descrizione);
				vestiario.setCosto(costo);
				vestiario.setModello(modello);
				
				System.out.println(fileName1);
				if (fileName1.equals("") || fileName2.equals("")) 
					error+="e' necessario caricare almeno le prime due immagini del capo da inserire<br>";
				else { 
					try {
						//ho caricato tutte le immagini che mi servono
						//eseguo l'operazione di inserimento nel DB
						int codCapo=model.insertCapoVestiario(vestiario);
						
						if(codCapo>0) {							
							//provvedo ad inserire le immagini caricate relative al capo nel DB
							SetPictureServlet.doPost(request, response, codCapo,"vestiario");
							return;
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else if (action.equalsIgnoreCase("insertAccessorio")) {
				//prelevo i parametri inseriti nel form 
				String codCategoria=request.getParameter("codiceCategoria");
				String marca=request.getParameter("marca");
				String fantasia=request.getParameter("fantasia");
				String info=request.getParameter("info");
				float costo=Float.parseFloat(request.getParameter("costo"));
				String tipologia=request.getParameter("tipologia");
				Part fPart1 =request.getPart("linkFoto1");
	            String fileName1=Paths.get(fPart1.getSubmittedFileName()).getFileName().toString();
	            Part fPart2 =request.getPart("linkFoto2");
	            String fileName2=Paths.get(fPart2.getSubmittedFileName()).getFileName().toString();
	            Part fPart3 =request.getPart("linkFoto3");
	            String fileName3=Paths.get(fPart3.getSubmittedFileName()).getFileName().toString();
	            
				//costruisco la stringa della descrizione
				String descrizione="marca " + marca + ",fantasia " + fantasia + ",info "+ info;

				//creo il bean
				BeanAccessorio accessorio=new BeanAccessorio();
				accessorio.setCodCategoria(codCategoria);
				accessorio.setCosto(costo);
				accessorio.setDescrizione(descrizione);
				accessorio.setTipologia(tipologia);
				
				if (fileName1.equals("") || fileName2.equals("")) 
					error+="e' necessario caricare almeno le prime due immagini del capo da inserire<br>";
				else {
					try {
						//ho caricato tutte le immagini che mi occorrono
						//eseguo l'operazione di inserimento nel DB
						int codCapo=model.insertCapoAccessorio(accessorio);
						
						if(codCapo>0) {
							//inserisco le immagini caricate relative al capo nel DB
							SetPictureServlet.doPost(request, response, codCapo,"accessorio");
							return;
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else if (action.equalsIgnoreCase("deleteAccessorio")) {
				//prelevo i parametri inseriti nel form 
				int codCapo=-1;
				codCapo=Integer.parseInt(request.getParameter("codiceCapo"));
				
				if (codCapo!=-1) {
					//creo il bean provvisorio per l'eliminazione
					BeanAccessorio accessorio=new BeanAccessorio();
					accessorio.setCodCapo(codCapo);
				
					//eseguo l'operazione di cancellazione dal DB
					boolean result=model.deleteCapoAccessorio(accessorio);
					if(result)
						message="cancellazione andata a buon fine";
					else
						error="cancellazione fallita: capo non trovato";
				} else
					error="cancellazione fallita: inserire il codice del capo da eliminare";
				
			} else if (action.equalsIgnoreCase("deleteVestiario")) {
				//prelevo i parametri inseriti nel form
				int codCapo=-1;
				codCapo=Integer.parseInt(request.getParameter("codiceCapo"));
				
				if (codCapo!=-1) {
					//creo il bean
					BeanVestiario vestiario=new BeanVestiario();
					vestiario.setCodCapo(codCapo);
				
					//eseguo l'operazione di cancellazione dal DB
					boolean result=model.deleteCapoVestiario(vestiario);
					if(result)
						message="cancellazione andata a buon fine";
					else
						error="cancellazione fallita: capo non trovato";
				} else
					error="cancellazione fallita: inserire il codice del capo da eliminare";
			} 
		}
		
		if (!message.equals("cancellazione andata a buon fine")) {
			if (error.equals(""))
				message="inserimento andato a buon fine";
		}
		request.setAttribute("error", error);
		request.setAttribute("message", message);
		
		//ritorno alla jsp
		RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/areaAmministratore.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
