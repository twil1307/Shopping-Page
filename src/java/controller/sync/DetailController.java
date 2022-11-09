/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.CategoryDAO;
import dao.CommentDAO;
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
import model.Comment;
import model.Product;

/**
 *
 * @author toten
 */
@WebServlet(name = "DetailController", urlPatterns = {"/detail"})
public class DetailController extends HttpServlet {

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
        /* TODO output your page here. You may use following sample code. */
        CommentDAO cmd = new CommentDAO();
        
        
        String idString = request.getParameter("productId");
        
        
        
        HttpSession session = request.getSession();
        int id = 0;
        if (idString != null) {
            id = Integer.parseInt(idString);
        }
        
        List<Comment> listCmt = cmd.getWithId(id);

        ProductDAO prd = new ProductDAO();
        CategoryDAO ctd = new CategoryDAO();
        Product product = prd.getByID(id);
        List<Product> relatedProducts = prd.getRelatedProduct(product.getCategoryID());
        String categoryName = ctd.getSpecifyCategory(product.getCategoryID()).getCategoryName();
        

        request.setAttribute("product", product);
        request.setAttribute("categoryName", categoryName);
        request.setAttribute("listCmt", listCmt);
        request.setAttribute("relatedProducts", relatedProducts);
        
        session.setAttribute("urlHistory", "detail?productId=" + id);

        request.getRequestDispatcher("singleProduct.jsp").forward(request, response);
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
