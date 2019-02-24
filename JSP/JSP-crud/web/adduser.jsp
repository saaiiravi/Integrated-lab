<%-- 
    Document   : adduser
    Created on : 23 Feb, 2019, 11:11:10 PM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String name=request.getParameter("name");
    String pass=request.getParameter("password");
    String email=request.getParameter("email");
    String sex=request.getParameter("sex");
    String country=request.getParameter("country");
    out.println(name);
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into userform(name,password,email,sex,country)values('"+name+"','"+pass+"','"+email+"','"+sex+"','"+country+"')");
    out.println("REgistered");
}catch(Exception e){
    System.out.print(e);
    e.printStackTrace();
}
    
    
    
%>

