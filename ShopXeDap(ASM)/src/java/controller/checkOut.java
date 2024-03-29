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
import java.sql.Date;
import java.time.LocalDate;
import model.Item;
import model.Order;

/**
 *
 * @author admin
 */
@WebServlet(name="checkOut", urlPatterns={"/checkout"})
public class checkOut extends HttpServlet {
   
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
        request.setCharacterEncoding("UTF-8");
        
        // Get order from jsp, if it exist continue
        BaseDAO dao = new BaseDAO();
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        if(order != null){
            // Get bill address
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String LastName = request.getParameter("LastName");
            String address1 = request.getParameter("address1");
            String address2 = request.getParameter("address2");
            String phone = request.getParameter("phone");
            
            // Check bill address have exist in database or not
            int billAdId = dao.getAddressID(email, firstName, LastName, address1, address2, phone);
            if(billAdId == -1){
                // if haven't add into dtb and get the id again
                dao.addAddress(email, firstName, LastName, address1, address2, phone);
                billAdId = dao.getAddressID(email, firstName, LastName, address1, address2, phone);
            }
            
            //get Date created
            LocalDate currentDate = LocalDate.now();
            Date dateCreated = Date.valueOf(currentDate);
            double totalPrice = order.getDoublePrice();
            int status = 0;
            dao.addBill(dateCreated, status, totalPrice, billAdId);
            int billId = dao.getBillId(dateCreated, status, totalPrice, billAdId);
            for(Item item : order.getItems()){
                int productId = item.getId();
                String image = item.getImage();
                double price = item.getProduct().returnPrice();
                int quantity = item.getQuantity();
                double productTotal = item.getPrice();
                dao.addCartToDbs(billId, productId, image, price, quantity, productTotal);
            }
            session.removeAttribute("order");
            response.sendRedirect("thankForShopping.jsp");
            
        }
        
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
