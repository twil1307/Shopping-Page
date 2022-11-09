/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author toten
 */
@MultipartConfig
@WebServlet(name = "newProductCotnroller", urlPatterns = {"/new-product"})
public class newProductCotnroller extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet newProductCotnroller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet newProductCotnroller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        CategoryDAO ctd = new CategoryDAO();
        List<Category> listCategory = ctd.getAll();

        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("newCourse.jsp").forward(request, response);
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
        String productName = request.getParameter("productName");
        String quantityString = request.getParameter("quantity");
        String priceString = request.getParameter("price");
        String categoryIdString = request.getParameter("categoryId");
        String description = request.getParameter("description");

        System.out.println(productName);

        int quantity = 0;
        int categoryId = 0;
        double price = 0.0;
        if (quantityString != null) {
            quantity = Integer.parseInt(quantityString);
        }
        if (categoryIdString != null) {
            categoryId = Integer.parseInt(categoryIdString);
        }
        if (priceString != null) {
            price = Double.parseDouble(priceString);
        }

        Part part = request.getPart("image");

        String realPath = request.getServletContext().getRealPath("/images");
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }

        part.write(realPath + "/" + fileName);

        String linkImage = "images/" + fileName;

        ProductDAO prd = new ProductDAO();
        int id = prd.getHighestId()+1;

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        System.out.println(formatter.format(date));
        String createdDate = formatter.format(date);

        Product product = new Product(id, productName, quantity, price, description,  linkImage, createdDate, categoryId);

        System.out.println(product);
        
        prd.saveNewProduct(product);

        request.getRequestDispatcher("welcome").forward(request, response);

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
