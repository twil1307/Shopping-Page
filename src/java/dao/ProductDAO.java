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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author toten
 */
public class ProductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Product> getAll() {
        try {
            String query = "select * from Product;";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);
            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getEachPageByID(int id, int beginProduct, int endProduct) {
        try {
            String query = "SELECT * FROM Product where category_id=? ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, beginProduct);
            ps.setInt(3, endProduct);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);

            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getEachPage(int beginProduct, int endProduct) {
        try {
            String query = "SELECT * FROM Product ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, beginProduct);
            ps.setInt(2, endProduct);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);

            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> searchProduct(String contentSearch) {
        try {
            String query = "select * from Product where name like ?";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + contentSearch + "%");

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);

            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getRelatedProduct(int id) {
        try {
            String query = "select top 9 * from Product where category_id=? order by created_date";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);

            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> dealOfTheMonth() {
        try {
            String query = "select top 9 * from Product order by created_date";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                products.add(product);

            }

            return products;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public HashMap<String, Integer> getNumberEachCategory() {
        try {
            String query = "select ctg.name, sum(quantity) from OrderDetail as detail, Category as ctg\n"
                    + "where detail.category_id = ctg.id\n"
                    + "group by category_id, ctg.name  ";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            HashMap<String, Integer> products = new HashMap<>();

            while (rs.next()) {

                products.put(rs.getString(1), rs.getInt(2));

            }

            return products;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getByID(int ID) {
        try {
            String query = "select * from Product where id=?";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setInt(1, ID);

            rs = ps.executeQuery();

            List<Product> products = new ArrayList<>();

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                Product product = Product.builder()
                        .productID(rs.getInt(1))
                        .productName(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .date(rs.getString(7))
                        .categoryID(rs.getInt(8)).build();

                return product;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getHighestId() {
        try {
            String query = "select top 1 id from Product order by id desc";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            int a = -1;

            while (rs.next()) {
//                products.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), 
//                  rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
                a = rs.getInt(1);

                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void saveNewProduct(Product prd) {
        try {
            String query = "insert into Product (id, name, quantity, price, description, imageUrl, created_date, category_id) values (?, ?, ?, ?, ?, ?, ?, ?)";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            System.out.println(prd);

            ps.setInt(1, prd.getProductID());
            ps.setString(2, prd.getProductName());
            ps.setInt(3, prd.getQuantity());
            ps.setDouble(4, prd.getPrice());
            ps.setString(5, prd.getDescription());
            ps.setString(6, prd.getImageUrl());
            ps.setString(7, prd.getDate());
            ps.setInt(8, prd.getCategoryID());

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateNewProduct(Product prd) {
        try {
            String query = "UPDATE Product\n"
                    + "SET name = ?, quantity = ?, price=?, description=?, imageUrl=?, created_date=?, category_id=?\n"
                    + "WHERE id=?;";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            System.out.println(prd);

            ps.setInt(8, prd.getProductID());
            ps.setString(1, prd.getProductName());
            ps.setInt(2, prd.getQuantity());
            ps.setDouble(3, prd.getPrice());
            ps.setString(4, prd.getDescription());
            ps.setString(5, prd.getImageUrl());
            ps.setString(6, prd.getDate());
            ps.setInt(7, prd.getCategoryID());

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deleteProduct(int id) {
        try {
            String query = "delete from Product where id=?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        List<Product> list = new ProductDAO().dealOfTheMonth();

        ProductDAO prd = new ProductDAO();

        prd.updateNewProduct(new Product(2, "XK 333", 10, 50.0, "Pain due to vascular prosthetic devices, implants and grafts 333", "http://dummyimage.com/144x213.png/ff4444/ffffff", "2021-12-03", 5));
    }
}
