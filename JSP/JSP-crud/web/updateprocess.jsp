<%-- 
    Document   : updateprocess
    Created on : 24 Feb, 2019, 10:27:19 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<% 
String name=request.getParameter("name");
     String pass=request.getParameter("password");
    String email=request.getParameter("email");
    String sex=request.getParameter("sex");
    String country=request.getParameter("country");
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
    PreparedStatement ps=conn.prepareStatement("update userform set name=?,password=?,email=?,sex=?,country=? where name='"+name+"'");
    ps.setString(1,name);
    ps.setString(2, pass);
    ps.setString(3, email);
    ps.setString(4, sex);
    ps.setString(5, country);
    int i=ps.executeUpdate();
    if(i>0){
        out.println("Records updated successfully");
    }else{
        out.println("No!");
    }
}catch(Exception e){
    System.out.print(e);
    e.printStackTrace();
}
%>
