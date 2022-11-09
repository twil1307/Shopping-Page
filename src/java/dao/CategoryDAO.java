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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author toten
 */
public class CategoryDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public List<Category> getAll() {
        try {
            String query = "select * from Category";
            
            conn = new DBContext().getConnection();
            
            ps = conn.prepareStatement(query);
            
            rs = ps.executeQuery();
            
            List<Category> categories = new ArrayList<>();
            
            while(rs.next()) {
                Category category = Category.builder()
                                                        .categoryID(rs.getInt(1))
                                                        .categoryName(rs.getString(2)).build();
                categories.add(category);
            }
            
            return categories;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Category> getByID(int id) {
        try {
            String query = "select * from Category where id=?";
            
            conn = new DBContext().getConnection();
            
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            List<Category> categories = new ArrayList<>();
            
            while(rs.next()) {
                Category category = Category.builder()
                                                        .categoryID(rs.getInt(1))
                                                        .categoryName(rs.getString(2)).build();
                categories.add(category);
            }
            
            return categories;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Category getSpecifyCategory(int id) {
        try {
            String query = "select * from Category where id=?";
            
            conn = new DBContext().getConnection();
            
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            
            rs = ps.executeQuery();

            
            while(rs.next()) {
                Category category = Category.builder()
                                                        .categoryID(rs.getInt(1))
                                                        .categoryName(rs.getString(2)).build();
                return category;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public static void main(String[] args) {
        List<Category> list = new CategoryDAO().getByID(1);
        
        for(Category cat  : list) {
            System.out.println(cat.toString());
        }
    }
}
