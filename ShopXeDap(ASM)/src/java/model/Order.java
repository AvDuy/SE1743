/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author admin
 */
public class Order implements Serializable{
    private int id;
    private List<Item> items;
    private int status;
    private double totalPrice;
    
    Locale locale = new Locale("vi", "VN");
    Currency currency = Currency.getInstance("VND");
    
    public String getTotalPrice(){
        double totalBill = 0;
        for(Item i : items){
            totalBill +=i.getPrice();
        }
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        currencyFormatter.setCurrency(currency);
        if (currencyFormatter instanceof DecimalFormat) {
            DecimalFormat decimalFormat = (DecimalFormat) currencyFormatter;
            decimalFormat.applyPattern("#,##0.000");
        }

        String formattedValue = currencyFormatter.format(totalBill);
//        DecimalFormat df = new DecimalFormat("#.000");
//        String formattedValue = df.format(price);
        return formattedValue;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
}
