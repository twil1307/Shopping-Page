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
public class Account {
    public static final String ADMIN = "ADMIN";
    public static final String USER = "USER";

    private int id;
    private String userName;
    private String password;
    private String displayName;
    private String address;
    private String email;
    private String phone;
    private String role;

    public Account(int id, String userName, String password, String displayName, String address, String email, String phone, String role) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.displayName = displayName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }
    
    
    public Account(String userName, String password, String displayName, String address, String email, String phone, String role) {
        this.userName = userName;
        this.password = password;
        this.displayName = displayName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.role = role;
    }

    public Account() {
    }

    
}
