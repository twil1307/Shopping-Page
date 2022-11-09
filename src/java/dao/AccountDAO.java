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
import model.Account;
import model.Shipping;

/**
 *
 * @author toten
 */
public class AccountDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public int register(Account acc) {
        try {
            String query = "insert into Account (username, password, displayName, address, email, phone, role) values (?, ?, ?, ?, ?, ?, ?);";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,  acc.getUserName());
            ps.setString(2, acc.getPassword());
            ps.setString(3, acc.getDisplayName());
            ps.setString(4, acc.getAddress());
            ps.setString(5, acc.getEmail());
            ps.setString(6, acc.getPhone());
            ps.setString(7, acc.getRole());
            
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public Account login(String username, String password) {
        try {
            String query = "select * from Account where username=? and password=?";
                    
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            
            
            rs = ps.executeQuery();
            
            Account acc = null;
            while (rs.next()) {
                acc = Account.builder()
                                        .id(rs.getInt(1))
                                        .userName(rs.getString(2))
                                        .password(rs.getString(3))
                                        .displayName(rs.getString(4))
                                        .address(rs.getString(5))
                                        .email(rs.getString(6))
                                        .phone(rs.getString(7))
                                        .role(rs.getString(8)).build();
                return acc;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Account checkUser(String username) {
        try {
            String query = "select * from Account where username=?";
                    
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            
            
            rs = ps.executeQuery();
            
            Account acc = null;
            while (rs.next()) {
                acc = Account.builder()
                                        .id(rs.getInt(1))
                                        .userName(rs.getString(2))
                                        .password(rs.getString(3))
                                        .displayName(rs.getString(4))
                                        .address(rs.getString(5))
                                        .email(rs.getString(6))
                                        .phone(rs.getString(7))
                                        .role(rs.getString(8)).build();
                return acc;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        AccountDAO accd = new AccountDAO();
        System.out.println(accd.login("user", "1234567"));
    }
}
