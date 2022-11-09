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
public class OrderDetail {

    private int id;
    private int orderId;
    private String productName;
    private String productImg;
    private double productPrice;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(int id, int orderId, String productName, String productImg, double productPrice, int quantity) {
        this.id = id;
        this.orderId = orderId;
        this.productName = productName;
        this.productImg = productImg;
        this.productPrice = productPrice;
        this.quantity = quantity;
    }
    
    

    public OrderDetail(String productName, String productImg, double productPrice, int quantity) {
        this.productName = productName;
        this.productImg = productImg;
        this.productPrice = productPrice;
        this.quantity = quantity;
    }
    
    
}
