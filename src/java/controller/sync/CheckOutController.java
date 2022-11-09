/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.Shipping;

/**
 *
 * @author toten
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

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
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            
            if(carts==null) {
                carts = new LinkedHashMap<>();
            }
            
            double totalAmount = 0;
            
            Set<Integer> keySet = carts.keySet();
            for (Integer key : keySet) {
                totalAmount+=carts.get(key).getProduct().getPrice() * carts.get(key).getQuantity();
                
            }
            
            request.setAttribute("totalAmount", Math.ceil(totalAmount*100.0)/ (100.0));
            
            request.setAttribute("carts", carts);
            
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
//        set up de go duoc tieng viet
             request.setCharacterEncoding("UTF-8");
             response.setCharacterEncoding("UTF-8");
             HttpSession session = request.getSession();
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String note = request.getParameter("note");
            double totalPrice = 0;
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            
            Set<Integer> keySet = carts.keySet();
            for (Integer key : keySet) {
                totalPrice+=carts.get(key).getProduct().getPrice() * carts.get(key).getQuantity();
                
            }
            
//            Add dữ liệu shipping
            ShippingDAO spd = new ShippingDAO();
            Shipping sp = Shipping.builder()
                                        .name(name)
                                        .phone(phone)
                                        .address(address).build();
            
            int idShipping = spd.createReturnId(sp);
            
//            Add dữ liệu vào order
            Order ord = Order.builder()
                                    .account_id(1)
                                    .totalPrice(totalPrice)
                                    .note(note)
                                    .shippingId(idShipping).build();
            
            int idOrder = new OrderDAO().createReturnId(ord);
            
//            Add du lieu vao order detail            
            new OrderDetailDAO().saveCart(idOrder, carts);
            
            response.sendRedirect("thanks");
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
