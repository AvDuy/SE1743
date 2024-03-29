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
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name="signUp", urlPatterns={"/signup"})
public class signUp extends HttpServlet {
   
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
        
        // Get attribue form jsp
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String userLowerCase = user.toLowerCase();
        
        if(!pass.equals(repass)){
            request.setAttribute("warning", "Error! Mật khẩu xác nhận không khớp với mật khẩu tạo ra");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            BaseDAO dao = new BaseDAO();
            Account acc = dao.checkAccountExit(userLowerCase);
            acc = dao.checkAccountExitEmail(email);
            if(acc == null){
                dao.signUp(user, pass,email);
                if(dao.checkEmailInAddress(email)){
                    dao.updateAddressEmail(email);
                }
                request.setAttribute("warning", "Tạo tài khoản thành công, vui lòng đăng nhập tài khoản");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.setAttribute("warning", "Error! Tên Tài khoản hoặc email đã tồn tại, vui lòng tạo tên tài khoản khác");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
