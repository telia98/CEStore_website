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

@WebFilter(filterName = "CheckAdmin",urlPatterns = {"/areaAmministratore.jsp"})
public class CheckAdmin implements Filter {

    public CheckAdmin() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        BeanUtente utente = (BeanUtente) ((HttpServletRequest) request).getSession().getAttribute("utente");
        Boolean roles = (Boolean) ((HttpServletRequest) request).getSession().getAttribute("adminRoles");

        if (utente!=null && roles) {
            chain.doFilter(request, response);
        } else {
        	String message="non puoi accedere alla pagina poiche' non sei un amministratore";
            ((HttpServletResponse) response).sendRedirect("errorPage.jsp?message=" + message);
        }

    }

    public void destroy() {
    }


    public void init(FilterConfig filterConfig) throws ServletException {

    }
}