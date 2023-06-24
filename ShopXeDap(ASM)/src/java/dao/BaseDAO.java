/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author AD
 */

import context.DBContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;
import model.Product;


public class BaseDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void signUp(String user, String pass){
        String query = "insert into Account values(?,?,0,0)";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public Account checkAccountExit(String user){
        String query =  "select * from Account\n" +
                        "where [user] = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4), 
                        rs.getInt(5));
            }
        }catch (Exception e){
        }
        return null;
    }
    
    public Account login(String user, String pass){
        String query =  "select * from Account\n" +
                        "where [user] = ?\n" +
                        "and pass = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getInt(4), 
                        rs.getInt(5));
            }
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Product> searchName(String searchTxt){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" +
                        "where [name] like ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchTxt + "%");
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(   rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getDouble(4), 
                                    rs.getString(6)));
            }
        }catch (Exception e){
        }
        
        return list;
    }
    
    public Product getProduct(String id){
        String query = "select * from product\n" +
                        "where id = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Product(   rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getDouble(4), 
                                    rs.getString(6));
            }
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        String query = "Select * from product";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(   rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getDouble(4), 
                                    rs.getString(6)));
            }
        }catch (Exception e){
        }
        
        return list;
    }
    
    public List<Category> getCategory(){
        List<Category> list = new ArrayList<>();
        String query = "Select * from Category";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(   rs.getInt(1), 
                                    rs.getString(2)));
            }
        }catch (Exception e){
        }
        
        return list;
    }
    
    public List<Product> getProductByCid(String id){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" +
                        "where cateID = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(   rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getDouble(4), 
                                    rs.getString(6)));
            }
        }catch (Exception e){
        }
        
        return list;
    }
    
    public static void main(String[] args) {
        BaseDAO dao = new BaseDAO();
        List<Category> list =  dao.getCategory();
        for(Category p: list){
            System.out.println(p);
        }
    }
    
}
