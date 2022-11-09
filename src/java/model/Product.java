/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author toten
 */
@Builder
@Getter
@Setter
@ToString
public class Product {
    private int productID;
    private String productName;
    private int quantity;
    private double price;
    private String description;
    private String imageUrl;
    private String date;
    private int categoryID;
//    private String status;
    
    

    public Product(int productID, String productName, int quantity, double price, String description, String imageUrl, String date, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
        this.date = date;
        this.categoryID = categoryID;
    }

    public Product() {
    }

    
    
    
}
