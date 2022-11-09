/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author toten
 */
public class Comment {

    private int id;
    private String content;
    private int userId;
    private int productId;
    private Date postedDate;
    private String displayName;
    private String reply;
    private int replyCommentId;
    private int replyLevel;

    public Comment(int id, String content, int userId, int productId, Date postedDate, String displayName, String reply, int replyCommentId, int replyLevel) {
        this.id = id;
        this.content = content;
        this.userId = userId;
        this.productId = productId;
        this.postedDate = postedDate;
        this.displayName = displayName;
        this.reply = reply;
        this.replyCommentId = replyCommentId;
        this.replyLevel = replyLevel;
    }
    
    public Comment(int id, String content, int userId, int productId, String postedDate, String displayName, String reply, int replyCommentId, int replyLevel) {
        this.id = id;
        this.content = content;
        this.userId = userId;
        this.productId = productId;
        setPostedDate(postedDate);
        this.displayName = displayName;
        this.reply = reply;
        this.replyCommentId = replyCommentId;
        this.replyLevel = replyLevel;
    }

    public Comment(int id, String content, int userId, int productId, String postedDate, String displayName) {
        this.id = id;
        this.content = content;
        this.userId = userId;
        this.productId = productId;
        setPostedDate(postedDate);
        this.displayName = displayName;
    }

    public Comment() {

    }

    public Comment(String content, int userId, int productId, String postedDate, String displayName) {
        this.content = content;
        this.userId = userId;
        this.productId = productId;
        setPostedDate(postedDate);
        this.displayName = displayName;
    }
    
    public Comment(String content, int userId, int productId, String postedDate, String displayName, String reply, int replyCommentId, int replyLevel) {
        this.content = content;
        this.userId = userId;
        this.productId = productId;
        setPostedDate(postedDate);
        this.displayName = displayName;
        this.reply = reply;
        this.replyCommentId = replyCommentId;
        this.replyLevel = replyLevel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getPostedDate() {
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
        return myFormat.format(postedDate);
    }

    public void setPostedDate(String dob) {
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
        try {
            this.postedDate = new Date(myFormat.parse(dob).getTime());
        } catch (ParseException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    
    public String getReply() {
        return reply;
    }
    
    public void setReply(String reply) {
        this.reply = reply;
    }
    
    public int getReplyCommentId() {
        return replyCommentId;
    }
    
    public void setReplyCommentId(int replyCommentId) {
        this.replyCommentId = replyCommentId;
    }
    
    public int getReplyLevel() {
        return  replyLevel;
    }
    
    public void setReplyLevel(int replyLevel) {
        this.replyLevel = replyLevel;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", content=" + content + ", userId=" + userId + ", productId=" + productId + ", postedDate=" + postedDate + ", displayName=" + displayName + ", reply=" + reply + ", replyCommentId=" + replyCommentId + ", replyLevel=" + replyLevel + '}';
    }

    

    

}
