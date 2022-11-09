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
import model.Shipping;

/**
 *
 * @author toten
 */
public class ShippingDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public int createReturnId(Shipping sp) {
        try {
            String query = "insert into Shipping (username, phone, address) values (?, ?, ?)";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, sp.getName());
            ps.setString(2, sp.getPhone());
            ps.setString(3, sp.getAddress());

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

    public List<Shipping> getAll() {
        try {
            String query = "select * from Shipping";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<Shipping> shipping = new ArrayList<>();

            while (rs.next()) {
                Shipping sp = Shipping.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .phone(rs.getString(3))
                        .address(rs.getString(4)).build();
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

    public static void main(String[] args) {
        List<Shipping> list = new ShippingDAO().getAll();

        for (Shipping pr : list) {
            System.out.println(pr.toString());
        }
    }
}
