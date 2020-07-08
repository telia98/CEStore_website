package it.cestore.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.cestore.model.PhotoControl;

/**
 * Servlet implementation class SetPictureServlet
 */
@WebServlet(name="/fileupload",
			urlPatterns= {"/fileupload"},
			initParams= {@WebInitParam(name="file-upload", value="tmpDir")})
@MultipartConfig(fileSizeThreshold=1024*1024*2, 
				 maxFileSize=1024*1024*10, 
				 maxRequestSize=1024*1024*50)
public class SetPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String SAVE_DIR="";
    
	public void init() {
		SAVE_DIR=getServletConfig().getInitParameter("file-upload");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/plain");
		
		out.write("error");
		out.close();
	}

	public static void doPost(HttpServletRequest request, HttpServletResponse response,int codCapo,String tabella) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		
		String savePath=request.getServletContext().getRealPath("")+ File.separator+ SAVE_DIR;
		
		File fileSaveDir=new File(savePath);
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		int i=1;
		String colonna="";
		for(Part part: request.getParts()) {
			String fileName=extractFileName(part);
			if(fileName!=null && !fileName.equals("")) {
				part.write(savePath+File.separator+fileName);
				if (i==1)
					colonna="linkFoto1";
				else if (i==2)
					colonna="linkFoto2";
				else
					colonna="linkFoto3";
				PhotoControl.upload(codCapo, savePath + File.separator + fileName,tabella,colonna);
				i++;
			}
		}
		
		String redirectedPage = "/AreaAdminControl";
		response.sendRedirect(request.getContextPath() + redirectedPage);	
	}
	
	private static String extractFileName(Part part) {
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for(String s: items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}	
		}
		return "";
	}
}
