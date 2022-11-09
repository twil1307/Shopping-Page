/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author toten
 */
public class OrderDetailDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<OrderDetail> getAll() {
        try {
            String query = "select * from Shipping";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<OrderDetail> shipping = new ArrayList<>();

            while (rs.next()) {
                OrderDetail sp = OrderDetail.builder()
                        .id(rs.getInt(1))
                        .orderId(rs.getInt(2))
                        .productName(rs.getString(3))
                        .productImg(rs.getString(4))
                        .productPrice(rs.getDouble(5))
                        .quantity(rs.getInt(6)).build();
                shipping.add(sp);
            }

            return shipping;
        } catch (SQLException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void saveCart(int idOrder, Map<Integer, Cart> carts) {
        try {
            String query = "insert into OrderDetail (order_id, productName, productImg, productPrice, quantity, category_id) \n"
                    + "values (?, ?, ?, ?, ?, ?)";
            conn = new DBContext().getConnection();
            Set<Integer> keySet = carts.keySet();
            for (Integer key : keySet) {
                ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, idOrder);
                ps.setString(2, carts.get(key).getProduct().getProductName());
                ps.setString(3, carts.get(key).getProduct().getImageUrl());
                ps.setDouble(4, carts.get(key).getProduct().getPrice());
                ps.setInt(5, carts.get(key).getQuantity());
                ps.setInt(6, carts.get(key).getProduct().getCategoryID());

                ps.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<OrderDetail> dealOfTheMonth() {
        try {
            String query = "select top 9 productName, productImg, productPrice, sum(quantity) from OrderDetail group by productName, productPrice, productImg order by sum(quantity) desc";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            

            rs = ps.executeQuery();

            List<OrderDetail> shipping = new ArrayList<>();

            while (rs.next()) {
                OrderDetail sp = new OrderDetail(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getInt(4));
                       
                shipping.add(sp);

            }

            return shipping;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        OrderDetailDAO ood = new OrderDetailDAO();
        List<OrderDetail> listOd = ood.dealOfTheMonth();
        
        System.out.println(listOd);
    }

}
