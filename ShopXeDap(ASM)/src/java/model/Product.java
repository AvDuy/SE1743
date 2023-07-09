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
public class Product implements Serializable{
    private int id;
    private String name;
    private String image;
    private double price;
    private String description;
    private double oldPrice;
    private int cateId;

    Locale locale = new Locale("vi", "VN");
    Currency currency = Currency.getInstance("VND");
    
    public double returnPrice(){
        return oldPrice;
    }
    
    public Product(int id, String name, String image, double price, String description, int cateId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.cateId = cateId;
        this.oldPrice = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCateId(){
        return cateId;
    }
    
    public void setCateId(int cateId) {
        this.cateId = cateId;
    }
    
    public String getPrice() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        currencyFormatter.setCurrency(currency);
        if (currencyFormatter instanceof DecimalFormat) {
            DecimalFormat decimalFormat = (DecimalFormat) currencyFormatter;
            decimalFormat.applyPattern("#,##0.000");
        }

        String formattedValue = currencyFormatter.format(price);
//        DecimalFormat df = new DecimalFormat("#.000");
//        String formattedValue = df.format(price);
        return formattedValue;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", description=" + description + '}';
    }
    
}
