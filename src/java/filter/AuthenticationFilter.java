/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import dao.AccountDAO;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author toten
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/add-cart", "/carts", "/checkout", "/delete-cart", "/update-quantity", "/admin/*", "/dashboard", "/welcome", "/add-cart-async"})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        String urlHistory = (String) session.getAttribute("urlHistory");

//           Kiểm tra đăng nhập bang session
        Account account = (Account) req.getSession().getAttribute("account");

        if (account != null) {
//               Cho qua
            chain.doFilter(request, response);

        } else { //            Kiem tra cookie
            Cookie[] cookie = req.getCookies();
            String username = null;
            String password = null;

            if(cookie!=null) {
                for (Cookie c : cookie) {
                    if (c.getName().equals("username")) {
                        username = c.getValue();
                    }

                    if (c.getName().equals("password")) {
                        password = c.getValue();
                    }

                    if (username != null && password != null) {
                        break;
                    }
                }
            }
            

            if (username != null && password != null) {
                Account accountCookie = new AccountDAO().login(username, password);

                if (accountCookie != null) {
                    req.getSession().setAttribute("account", account);
                    chain.doFilter(request, response);
                    return;
                }
            } else {
                resp.sendRedirect("http://localhost:8080/ShoppingOnline/login");
            }
        }
    }

    @Override
    public void destroy() {

    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {

    }

    /**
     * Return a String representation of this object.
     */
}
