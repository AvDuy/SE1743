/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BaseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name="quantityControl", urlPatterns={"/quantityControl"})
public class quantityControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String id;
        BaseDAO dao = new BaseDAO();
        request.getParameterMap();
        
        if(request.getParameter("itemId")!=null){
            id = request.getParameter("itemId");
            Product product = dao.getProduct(id);
            if(product!=null){
                if(request.getParameter("quantity")!=null){
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                Order order = (Order) session.getAttribute("order");
                List<Item> listItems = order.getItems();
                boolean check = false;
                for(Item item : listItems){
                    if(item.getProduct().getId() == product.getId()){
                        item.setQuantity(quantity);
                        check = true;
                    }
                }
                if(check == false){
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setImage(product.getImage());
                    item.setPrice(product.returnPrice());
                    listItems.add(item);
                }
                session.setAttribute("order", order);
            }
            
        }
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
