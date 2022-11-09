/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author toten
 */
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/admin/*", "/dashboard", "/table", "/new-product", "/delete-cart"})
public class AuthorizationFilter implements Filter {


    public AuthorizationFilter() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        //           Kiểm tra đăng nhập bang session
        Account account = (Account) req.getSession().getAttribute("account");

        if (account != null && account.getRole().equals(account.ADMIN)) {
//               Kiem tra role

            chain.doFilter(request, response);
            return;
        }
        
        String urlHistory = (String) req.getSession().getAttribute("urlHistory");
        
        if(urlHistory==null) {
            urlHistory="home";
        }

//        req.setAttribute("error", "You do not have permission");
//        req.getRequestDispatcher("../login.jsp").forward(request, response);
    
//        resp.sendRedirect("http://localhost:8080/ShoppingOnline/login");
           resp.sendRedirect(urlHistory);
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    @Override
    public void init(FilterConfig filterConfig) {

    }

}
