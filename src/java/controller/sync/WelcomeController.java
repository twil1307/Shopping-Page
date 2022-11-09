/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;

/**
 *
 * @author toten
 */
@WebServlet(name = "WelcomeController", urlPatterns = {"/welcome"})
public class WelcomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            CategoryDAO ctd = new CategoryDAO();
            List<Category> listCategory = ctd.getAll();
            request.setAttribute("listCategory", listCategory);

            ProductDAO prD = new ProductDAO();
            List<Product> listProduct = prD.getAll();
            List<Product> listDealOfTheMonth = prD.dealOfTheMonth();

            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
                request.setAttribute("pageStr", page);
            }
            System.out.println(page);
            final int PAGE_SIZE = 8;

            List<Product> listProductEachPage = prD.getEachPage((page - 1) * PAGE_SIZE, PAGE_SIZE);
            List<Product> listProductEachPage2 = prD.getEachPage(8, PAGE_SIZE);

            request.setAttribute("dealOfTheMonth", listDealOfTheMonth);

            request.setAttribute("listProduct", listProductEachPage);
            request.setAttribute("listProduct2", listProductEachPage2);
            session.setAttribute("urlHistory", "welcome");

            request.getRequestDispatcher("welcomePage.jsp").forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
