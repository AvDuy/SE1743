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
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name="searchControl", urlPatterns={"/search"})
public class searchControl extends HttpServlet {
   
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
        BaseDAO dao = new BaseDAO();
        
        List<Category> listCategory = dao.getCategory();
        request.setAttribute("listCategory", listCategory);
        
        HttpSession session = request.getSession();
        String txSearch = request.getParameter("txt");
        if(txSearch == null){
            txSearch = (String) session.getAttribute("txt");
        }else{
            session.setAttribute("txt", txSearch);
        }
        
        List<Product> listP = dao.searchName(txSearch);
        
        int page, numbperpage = 6;
        int size = listP.size();
        int numb=(size%numbperpage==0?(size/numbperpage):(size/numbperpage+1));
        String xpage = request.getParameter("page");
        if(xpage==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        
        int start, end;
        start=(page-1)*numbperpage;
        end = Math.min(page*numbperpage, size);
        List<Product> listPage = dao.getListByPage(listP, start, end);
        
        request.setAttribute("numb", numb);
        request.setAttribute("page", page);
        request.setAttribute("data", listPage);
        request.setAttribute("txtS", txSearch);
        request.setAttribute("listProduct", listP);
        request.getRequestDispatcher("searchedProduct.jsp").forward(request, response);
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
