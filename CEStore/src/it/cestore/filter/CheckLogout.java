
package it.cestore.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.cestore.model.BeanUtente;

@WebFilter(filterName = "CheckLogout", urlPatterns = {"/login.jsp"})
public class CheckLogout implements Filter {

    public CheckLogout() {
    }

  
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        
        BeanUtente utente = (BeanUtente) ((HttpServletRequest) request).getSession().getAttribute("utente");
   
        if (utente == null) { 
            chain.doFilter(request, response);
        } else {
        	String message="il logout non è andato a buon fine;\n il sistema provvederà ad eseguirlo automaticamente";
            ((HttpServletResponse) response).sendRedirect("errorPage.jsp?message=" + message);
        }
    }

   
    @Override
    public void destroy() {
    }

   
    public void init(FilterConfig filterConfig) {

    }

}
