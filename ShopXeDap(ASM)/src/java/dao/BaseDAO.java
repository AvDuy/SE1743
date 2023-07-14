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
import model.Item;
import model.Order;
import model.Product;


public class BaseDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void updateAccount(int isSell, int isAdmin, int uID){
        String query = "UPDATE [dbo].[Account]\n" +
                        "   SET [isSell] = ?\n" +
                        "      ,[isAdmin] = ?\n" +
                        " WHERE [uID] = ?";
        
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, isSell);
            ps.setInt(2, isAdmin);
            ps.setInt(3, uID);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public List<Account> getAllAccount(){
        String query = "select * from Account";
        try{
            List<Account> accountList = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                int uId = rs.getInt("uID");
                String user = rs.getNString("user");
                String pass = rs.getNString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                String email = rs.getString("email");
                Account a = new Account(uId, user, pass, isSell, isAdmin);
                a.setEmail(email);
                accountList.add(a);
            }
            return accountList;
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Order> getAllBill(){
        String query = "SELECT b.*, ba.*\n" +
                        "FROM [dbo].[bill] AS b\n" +
                        "JOIN [dbo].[BillAddress] AS ba ON b.billAdId = ba.billId\n";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ResultSet resultSet = ps.executeQuery();
            List<Order> listOrder = new ArrayList<>();
            while (resultSet.next()) {
                Order oder = new Order();
                int billId = resultSet.getInt("billId");
                List<Item> listItem = getCartByBillId(billId);
                oder.setDate(resultSet.getDate("date_created"));
                oder.setEmail(resultSet.getString("email"));
                oder.setFirstName(resultSet.getString("first_name"));
                oder.setLastName(resultSet.getString("last_name"));
                oder.setMainAddress(resultSet.getString("address1"));
                oder.setAddress2(resultSet.getString("address2"));
                oder.setPhone(resultSet.getString("phone"));
                oder.setItems(listItem);
                oder.setStatus(resultSet.getInt("status"));
                oder.setId(billId);
                listOrder.add(oder);
            }
            return listOrder;
        }catch (Exception e){
        }
        return null;
    }
    
    public void updateStatus(int status, int billId){
        String query = "UPDATE bill SET status = ? WHERE billId = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, billId);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public Order getOrderByBillId(int billId){
        String query = "SELECT b.*, ba.*\n" +
                        "FROM [dbo].[bill] AS b\n" +
                        "JOIN [dbo].[BillAddress] AS ba ON b.billAdId = ba.billId\n" +
                        "WHERE b.[billId] = ?";
        try{
            Order oder = new Order();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, billId);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                List<Item> listItem = getCartByBillId(billId);
                oder.setDate(resultSet.getDate("date_created"));
                oder.setEmail(resultSet.getString("email"));
                oder.setFirstName(resultSet.getString("first_name"));
                oder.setLastName(resultSet.getString("last_name"));
                oder.setMainAddress(resultSet.getString("address1"));
                oder.setAddress2(resultSet.getString("address2"));
                oder.setPhone(resultSet.getString("phone"));
                oder.setItems(listItem);
                oder.setStatus(resultSet.getInt("status"));
                oder.setId(billId);
                return oder;
            }else{}
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Item> getCartByBillId(int billId){
        String query = "SELECT b.*, ba.*\n" +
            "FROM [dbo].[product] AS b\n" +
            "JOIN [dbo].[Cart] AS ba ON b.id = ba.product_id\n" +
            "where [Billid] = ?";
        try{
            List<Item> itemList = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, billId);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Item i = new Item();
                i.setId(resultSet.getInt("product_id"));
                i.setImage(resultSet.getNString("image"));
                i.setPrice(resultSet.getDouble("price"));
                i.setQuantity(resultSet.getInt("quantity"));
                i.setName(resultSet.getString("name"));
                itemList.add(i);
            }
            return itemList;
        }catch (Exception e){
        }
        return null;
    }
    
    public List<Order> getBillByStatus(int status){
        String query = "SELECT b.*, ba.*\n" +
                        "FROM [dbo].[bill] AS b\n" +
                        "JOIN [dbo].[BillAddress] AS ba ON b.billAdId = ba.billId\n" +
                        "WHERE b.[status] = ?";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ResultSet resultSet = ps.executeQuery();
            List<Order> listOrder = new ArrayList<>();
            while (resultSet.next()) {
                Order oder = new Order();
                int billId = resultSet.getInt("billId");
                List<Item> listItem = getCartByBillId(billId);
                oder.setDate(resultSet.getDate("date_created"));
                oder.setEmail(resultSet.getString("email"));
                oder.setFirstName(resultSet.getString("first_name"));
                oder.setLastName(resultSet.getString("last_name"));
                oder.setMainAddress(resultSet.getString("address1"));
                oder.setAddress2(resultSet.getString("address2"));
                oder.setPhone(resultSet.getString("phone"));
                oder.setItems(listItem);
                oder.setStatus(status);
                oder.setId(billId);
                listOrder.add(oder);
            }
            return listOrder;
        }catch (Exception e){
        }
        return null;
    }
    
    public void addCartToDbs(int billId, int productId, String image, double price,int quantity, double totalPrice){
        String query = "INSERT INTO [dbo].[Cart]([Billid],[product_id],[image],[price],[quantity],[total_price])\n" +
                        "     VALUES(?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, billId);
            ps.setInt(2, productId);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
            ps.setDouble(6, totalPrice);
            ps.executeUpdate();
        }catch (Exception e){
        }
    }
    
    public int getBillId(Date date, int status,double totalPrice, int billAdId){
        String query = "SELECT billId FROM [dbo].[bill]\n" +
                        "WHERE [date_created] = ?\n" +
                        "  AND [status] = ?\n" +
                        "  AND [total_price] = ?\n" +
                        "  AND [billAdId] = ?;";
        try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, status);
            ps.setDouble(3, totalPrice);
            ps.setInt(4, billAdId);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int billId = resultSet.getInt("billId");
                return billId;
            } else {
                return -1;
            }
        }catch (Exception e){
        }
        return -1;
    }
    
    public void addBill(Date date, int status,double totalPrice, int billAdId){
        String query = "INSERT INTO bill(date_created, status, total_price, billAdId) " +
                     "VALUES (?, ?, ?, ?)";
         try{
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, status);
            ps.setDouble(3, totalPrice);
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
