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

@WebFilter(filterName = "Login",
        urlPatterns = {"/areaUtente.jsp", "/AreaUtenteControl"})
public class CheckLogin implements Filter {

    public CheckLogin() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest hreq = (HttpServletRequest) request;

        BeanUtente utente = (BeanUtente) hreq.getSession().getAttribute("utente");
        Boolean role = (Boolean) hreq.getSession().getAttribute("adminRoles");
        
        if (utente!=null && !role) {
            chain.doFilter(request, response);
        } else {
        	 String message = "E' necessario effettuare il login per accedere alla pagina";
        	 ((HttpServletResponse) response).sendRedirect("errorPage.jsp?message=" + message);
           }
    }
    
    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {

    }
}
