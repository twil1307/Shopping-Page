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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.Shipping;

/**
 *
 * @author toten
 */
public class OrderDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public int createReturnId(Order order) {
        try {
            String query = "insert into Orders (account_id, totalPrice, note, shipping_id) values (?, ?, ?, ?)";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getAccount_id());
            ps.setDouble(2, order.getTotalPrice());
            ps.setString(3, order.getNote());
            ps.setInt(4, order.getShippingId());
            
            ps.executeUpdate();
            
            rs = ps.getGeneratedKeys();
            
            while(rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public List<Order> getAll() {
        try {
            String query = "select * from Orders";
            
            conn = new DBContext().getConnection();
            
            ps = conn.prepareStatement(query);
            
            rs = ps.executeQuery();
            
            List<Order> order = new ArrayList<>();
            
            while(rs.next()) {
                Order sp = Order.builder()
                                            .id(rs.getInt(1))
                                            .account_id(rs.getInt(2))
                                            .totalPrice(rs.getDouble(3))
                                            .note(rs.getString(4))
                                            .date(rs.getString(5))
                                            .shippingId(rs.getInt(6)).build();
                order.add(sp);
            }
            
            return order;
        } catch (SQLException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    List<OrderDetail> dealOfTheMonth() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
