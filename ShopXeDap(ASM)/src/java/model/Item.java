/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

/**
 *
 * @author admin
 */
public class Item implements Serializable{
    private int id;
    private Product product;
    private int quantity;
    private String image;
    private double price;
    private double totalPrice;

    Locale locale = new Locale("vi", "VN");
    Currency currency = Currency.getInstance("VND");
    
    public void setImage(String image){
        this.image = image;
    }
    
    public String getImage(){
        return image;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice(){
        double total = price * quantity;
        return total;
    }
    
    public String getTotalPrice() {
        totalPrice = price * quantity;
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        currencyFormatter.setCurrency(currency);
        if (currencyFormatter instanceof DecimalFormat) {
            DecimalFormat decimalFormat = (DecimalFormat) currencyFormatter;
            decimalFormat.applyPattern("#,##0.000");
        }

        String formattedValue = currencyFormatter.format(totalPrice);
//        DecimalFormat df = new DecimalFormat("#.000");
//        String formattedValue = df.format(price);
        return formattedValue;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
}
