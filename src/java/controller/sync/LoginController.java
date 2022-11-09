/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author toten
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Kiem tra cookie
        Cookie[] cookie = request.getCookies();
        String username = null;
        String password = null;
        HttpSession session = request.getSession();
        
        for(Cookie c : cookie) {
            if(c.getName().equals("username")) {
                username = c.getValue();
            }
            
            if(c.getName().equals("password")) {
                password = c.getValue();
            }
            
            if (username != null && password != null) {
                break;
            }
        }
        
        if (username != null && password != null) {
            Account account = new AccountDAO().login(username, password);
            
            
            
            if(account!=null) {
                request.getSession().setAttribute("account", account);
                String urlHistory = (String) session.getAttribute("urlHistory");
                System.out.println(urlHistory);
                
                if(urlHistory!=null) {
                    response.sendRedirect(urlHistory);
                } else {
                    response.sendRedirect("welcome");
                }
                

                return;
            }
        }
        
        
        
        
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String urlHistory = (String) session.getAttribute("urlHistory");

//        Checklogin
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        boolean remember = Boolean.parseBoolean(request.getParameter("remember"));

        Account acc = new AccountDAO().login(username, password);

//        Kiem tra username, pass, neu hop le thi luu len session, khong thi tra ve loi
        if (acc != null) {
            session.setAttribute("account", acc);

//            remember
            if (remember) {
                Cookie usernameCooky = new Cookie("username", username);
                usernameCooky.setMaxAge(60 * 60 * 24 * 2);
                response.addCookie(usernameCooky);

                Cookie passwordCooky = new Cookie("password", password);
                passwordCooky.setMaxAge(60 * 60 * 24 * 2);
                response.addCookie(passwordCooky);
            }
            if(urlHistory==null) {
                response.sendRedirect("home");
            } else {
                response.sendRedirect(urlHistory);
            } 
            
        } else {
            request.setAttribute("error", "Username or password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
