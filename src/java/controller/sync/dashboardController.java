/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Order;
import model.Product;
import model.Shipping;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author toten
 */
@WebServlet(name = "dashboardController", urlPatterns = {"/dashboard"})
public class dashboardController extends HttpServlet {

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
            out.println("<title>Servlet dashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dashboardController at " + request.getContextPath() + "</h1>");
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
        OrderDAO orderdao = new OrderDAO();
        ShippingDAO shippingDAO = new ShippingDAO();
        ProductDAO productDAO = new ProductDAO();
        List<Order> listOrder = orderdao.getAll();
        List<Shipping> listShipping = shippingDAO.getAll();
        List<Product> listProduct = productDAO.getAll();
        String[] months = {"JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"};
//        get all product type
        CategoryDAO category = new CategoryDAO();
        List<Category> listCategory = category.getAll();
        HashMap<String, Integer> categoryType = getEachTypeNumber(listCategory);
        

        double totalPrice = 0;
        double currentMonthTotal = 0;
        double totalEachMonth = 0.0;
        System.out.println(listOrder);

        LocalDate currentdate = LocalDate.now();
        Month currentMonth = currentdate.getMonth();
        System.out.println("Current month: " + currentMonth);

        //        Tinh ra so tien thu duoc trong 12 thang
        HashMap<String, Double> hm = new HashMap();
        hm.put("JANUARY", 0.0);
        hm.put("FEBRUARY", 0.0);
        hm.put("MARCH", 0.0);
        hm.put("APRIL", 0.0);
        hm.put("MAY", 0.0);
        hm.put("JUNE", 0.0);
        hm.put("JULY", 0.0);
        hm.put("AUGUST", 0.0);
        hm.put("SEPTEMBER", 0.0);
        hm.put("OCTOBER", 0.0);
        hm.put("NOVEMBER", 0.0);
        hm.put("DECEMBER", 0.0);

//        So sanh month de tinh ra total trong thang hien tai
        for (int i = 0; i < listOrder.size(); i++) {
            totalPrice += listOrder.get(i).getTotalPrice();

            LocalDate date = LocalDate.parse(listOrder.get(i).getDate());

            Month soldMonth = date.getMonth();

            if (currentMonth.equals(soldMonth)) {
                currentMonthTotal += listOrder.get(i).getTotalPrice();
                hm.replace(currentMonth.toString() + "", currentMonthTotal);
            }
        }

        for (int i = 0; i < months.length; i++) {
            for (Order or : listOrder) {
                LocalDate date = LocalDate.parse(or.getDate());

                Month soldMonth = date.getMonth();

                if (soldMonth.toString().equals(months[i])) {
                    totalEachMonth += or.getTotalPrice();
                }

            }
            hm.replace(months[i], (double) Math.round(totalEachMonth * 100) / 100);
            totalEachMonth = 0;
        }

        System.out.println("hm: " + hm);

//        Lam tron
        currentMonthTotal = (double) Math.round(currentMonthTotal * 100) / 100;
        totalPrice = (double) Math.round(totalPrice * 100) / 100;

//      set request
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("currentMonthTotal", currentMonthTotal);
        request.setAttribute("shippingRequest", listShipping.size());
        request.setAttribute("listProductSize", listProduct.size());
        request.setAttribute("monthlyEarning", hm);
        request.setAttribute("categoryType", categoryType);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
    
    
    public HashMap<String, Integer> getEachTypeNumber(List<Category> listCategory) {
        HashMap<String, Integer> categoryType = new ProductDAO().getNumberEachCategory();
        return categoryType;
        
        
//        String[] type = new String[categoryType.size()];
//        for(int i =0; i<type.length; i++) {
//            type[i] = categoryType.get(i+1);
//        }
//        
//        System.out.println(type);
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
