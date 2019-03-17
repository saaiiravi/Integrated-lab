<%-- 
    Document   : buy
    Created on : 17 Mar, 2019, 9:51:59 PM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        ResultSet rs=null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
        Statement st=conn.createStatement();
        rs=st.executeQuery("select * from kart");
        %>
        <center>
    <h1> Drop down box or select element</h1>
    <form action="buyprocess.jsp" method="post">
        <select name="product">
        <%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
            
        <% } %>
        </select>
        <br>   
        quantity: <Input type="text"name="quant" ><br>
        
            
            
        
       
       
        
                <input type="submit" value="buy">
            </form>
</center>
<%
       
      
        
        
    }catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
    %>

