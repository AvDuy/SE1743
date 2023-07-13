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
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
    
    public void addBill(Date date, int status,String totalPrice, int billAdId){
        String query = "INSERT INTO bill (date_created, status, total_price, billAdId) " +
                     "VALUES (?, ?, ?, ?)";
         try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, status);
            ps.setString(3, totalPrice);
            ps.setInt(4, billAdId);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public int getAddressID(String email, String firstName, String lastName, String address1, String address2, String phone){
        String query = "SELECT billId FROM BillAddress WHERE email = ? " +
                     "AND first_name = ? AND last_name = ? AND address1 = ? " +
                     "AND address2 = ? AND phone = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, address1);
            ps.setString(5, address2);
            ps.setString(6, phone);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int billId = resultSet.getInt("billId");
                return billId;
            } else {
                return -1;
            }
        }catch (Exception e){
        }
        return 0;
    }
    
    public void addAddress(String email, String firstName, String lastName, String address1, String address2, String phone){
        String query = "INSERT INTO BillAddress (email, first_name, last_name, address1, address2,uID, phone)\n" +
                        "VALUES (?,\n" +
                        "		?,\n" +
                        "		?, \n" +
                        "		?, \n" +
                        "		?, \n" +
                        "		?, \n" +
                        "		?);";
        try{
            Account a = checkAccountExitEmail(email);
            if(a != null){
                int uID = a.getId();
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, firstName);
                ps.setString(3, lastName);
                ps.setString(4, address1);
                ps.setString(5, address2);
                ps.setString(6, Integer.toString(uID));
                ps.setString(7, phone);
                ps.executeUpdate();
            }else{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, firstName);
                ps.setString(3, lastName);
                ps.setString(4, address1);
                ps.setString(5, address2);
                ps.setNull(6, Types.NULL);
                ps.setString(7, phone);
                ps.executeUpdate();
            }
        }catch (Exception e){
        }
    }
    
    public List<Product> getListByPage(List<Product> list,int start, int end){
        ArrayList<Product> arr = new ArrayList<>();
        for(int i = start; i< end; i++){
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public void updateProduct(String name, String image, String price, String description, String cateID, String id){
        String query = "UPDATE [dbo].[product]\n" +
                        "   SET [name] = ?" +
                        "      ,[image] = ?" +
                        "      ,[price] = ?" +
                        "      ,[title] = 'x'" +
                        "      ,[description] = ?" +
                        "      ,[cateID] = ?" +
                        "      ,[sell_ID] = 3\n" +
                        " WHERE id= ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, cateID);
            ps.setString(6, id);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public void addProduct(String name, String category, String image, String description, String price){
        String query = "INSERT INTO [dbo].[product]([name],[image],[price],[title],[description],[cateID],[sell_ID])\n" +
"     VALUES\n" +
"           (?" +
"           ,?" +
"           ,?" +
"           ,'x'" +
"           ,?" +
"           ,?" +
"           ,3)";
        
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, category);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public void deleteProduct(String id){
        String query = "INSERT INTO [dbo].[deletedProduct] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID])\n" +
"SELECT [id], [name], [image], [price], [title], [description], [cateID], [sell_ID]\n" +
"FROM [dbo].[Product]\n" +
"WHERE [id] = ?;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public void signUp(String user, String pass, String email){
        String query = "insert into Account values(?,?,0,0,?)";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public Account checkAccountExitEmail(String email){
        String query =  "select * from Account\n" +
                        "where [email] = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
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
                        "where [name] like ? AND id NOT IN (\n" +
                        "    SELECT id\n" +
                        "    FROM deletedProduct\n" +
                        ")";
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
                                    rs.getString(6), 
                                    rs.getInt(7)));
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
                                    rs.getString(6), 
                                    rs.getInt(7));
            }
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n" +
                        "FROM Product\n" +
                        "WHERE id NOT IN (\n" +
                        "    SELECT id\n" +
                        "    FROM deletedProduct\n" +
                        ") order by id asc";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(   rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getDouble(4), 
                                    rs.getString(6), 
                                    rs.getInt(7)));
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
                                    rs.getString(6), 
                                    rs.getInt(7)));
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
