package it.cestore.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.PhotoControl;

/**
 * Servlet per il recupero delle immagini dei capi dal database tramite relativo codice
 */
@WebServlet("/GetPictureServlet")
public class GetPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/* 
	 * passando il codice del capo
	 * chiama la classe PhotoControl che preleva l'immagine assegnata a quel capo
	 * e dal formato binario la converte nel formato immagine
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//prelevo codice e tipo del capo di cui si necessita visualizzare l'immagine
		int codCapo=Integer.parseInt(request.getParameter("codCapo"));
		String tabella=request.getParameter("tabella");
		String linkFoto=request.getParameter("foto");
		
		if (codCapo!=0) {
			byte[] bt=PhotoControl.load(codCapo,tabella,linkFoto);
			System.out.println("ho letto");
			ServletOutputStream out=response.getOutputStream();
			if (bt!=null) {
				out.write(bt);
				response.setContentType("image/jpg,png");
			}
			
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
