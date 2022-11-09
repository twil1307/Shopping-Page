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
import model.Account;
import model.Cart;
import model.Comment;
import model.Product;

/**
 *
 * @author toten
 */
public class CommentDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Comment> getAll() {
        try {
            String query = "select * from Comments";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<Comment> comment = new ArrayList<>();

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                Comment product = new Comment(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6));

                comment.add(product);
            }

            return comment;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//    select * from Comments where productId=3

    public Comment getByCommentID(int commentId) {
        try {
            String query = "select id, content, userId, productId, postedDate, '' from comments where id=?";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, commentId);

            rs = ps.executeQuery();

            Comment product = new Comment();

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                product = new Comment(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6));

                return product;
            }

            return product;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Comment> getWithId(int productId) {
        try {
            String query = "select cmt.id, cmt.content, cmt.userId, cmt.productId, cmt.postedDate, acc.displayName, cmt.reply, cmt.replyCommentId, cmt.replyLevel \n"
                    + "from Comments as cmt, Account as acc \n"
                    + "where productId=? AND cmt.userId=acc.id ORDER BY postedDate DESC";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);

            rs = ps.executeQuery();

            List<Comment> comment = new ArrayList<>();

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                Comment product = new Comment(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9));

                comment.add(product);
            }

            return comment;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void saveNewComment(String content, int userId, int productId) {
        try {
            String query = "insert into comments values \n"
                    + "(?, ?, ?, default, default, default, default)";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, content);
            ps.setInt(2, userId);
            ps.setInt(3, productId);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int saveCommentReturnId(String content, int userId, int productId) {
        try {
            String query = "insert into comments values \n"
                    + "(?, ?, ?, default, default, default, default)";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, content);
            ps.setInt(2, userId);
            ps.setInt(3, productId);

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

    public static void main(String[] args) {
        CommentDAO cmd = new CommentDAO();

//        cmd.saveNewComment("Shop dinh cua chop", 2, 3);
        List<Comment> listCmt = cmd.getWithId(11);

        System.out.println(listCmt);

    }
}
