/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import marksbean.addEJB;
import java.sql.ResultSet;

/**
 *
 * @author varsha
 */
public class addservlet extends HttpServlet {

    @EJB
    addEJB obj;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResultSet ress=null;
          int m1=Integer.parseInt(request.getParameter("num1"));
          int m2=Integer.parseInt(request.getParameter("num2"));
          int m3=Integer.parseInt(request.getParameter("num3"));
          String name=request.getParameter("name");
          String rno=request.getParameter("rno");              
                 
          obj.setI(m1);
          obj.setJ(m2);
          obj.setK(m3);
          obj.add();
          int res=obj.getL();         
          String pf=obj.calc();
          try{
              int count;
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
              
              Statement st=conn.createStatement();
              int i=st.executeUpdate("insert into marks(name,rno,m1,m2,m3,sum,result)values('"+name+"',"+rno+","+m1+","+m2+","+m3+","+res+",'"+pf+"')");
              if(i>0)
                  out.println("inserted into database");
              else
                  out.println("no");
              String pass ="pass";
              
              ress= st.executeQuery("select * from marks where result='"+pass+"'");
             
                  ress.last();
count = ress.getRow();
ress.beforeFirst();
                  
              
              
              out.println("Total score is "+res);
              out.println("result is "+pf);
              out.print("Total number of students who have passed so far is "+count);
              
              
              
              
              
          }catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
            
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
