/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
public class servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String search=request.getParameter("t1");
            int val=0;
                    val=Integer.parseInt(request.getParameter("number"));
            String option=request.getParameter("option1");
           // out.print(search+option+val);
            
            try{
            Class.forName("com.mysql.jdbc.Driver"); 
            
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root",""); 
            Statement stmt=(Statement) con.createStatement();
             String sql;
             ResultSet rs;
                    if(option.compareTo("save")==0)
                    {
                         sql = "INSERT INTO data(condent)VALUES ('"+search+"')";
                         int v= stmt.executeUpdate(sql);
                        
                    }
                    if(option.compareTo("update")==0)
                    {
                       PreparedStatement ps = con.prepareStatement("update data set condent=? where num=?");
                       ps.setString(1,search);
                       ps.setInt(2,val);
                       int v=ps.executeUpdate();
                    }
                    if(option.compareTo("search")==0)
                    {sql="SELECT * FROM data WHERE condent='"+search+"'";
                        rs = stmt.executeQuery(sql);
                        
                        while(rs.next()){
         //Retrieve by column name
         int id  = rs.getInt("num");
         String data = rs.getString("condent");
         out.print("<br>");
         //Display values
         out.print("ID: " + id);
         out.print(", DATA: " + data);
         
                        }
                    }
                        if(option.compareTo("delete")==0)
                        { sql="DELETE FROM data WHERE num='"+val+"'";
                        int v = stmt.executeUpdate(sql);
                         }
            sql="select * from data";
            rs = stmt.executeQuery(sql);
            out.print("<br><br>");
                      out.print("DATABASE VALUES IS:");
                        while(rs.next()){
         //Retrieve by column name
         int id  = rs.getInt("num");
         String data = rs.getString("condent");
        out.print("<br>");
         //Display values
         out.print("ID: " + id);
         out.print("DATA: " + data);
        }
            }catch(Exception e)
            {
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
            throws ServletException, IOException  {
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
