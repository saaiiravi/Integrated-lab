<%-- 
    Document   : reg 
    Created on : 24 Feb, 2019, 7:56:10 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String name=request.getParameter("name");
    String uname=request.getParameter("uname");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Varsha26");
if(conn!=null){
    out.println("database connected");
}
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into user(name,uname)values('"+name+"','"+uname+"')");
out.println("Thank you for registering ! Please <a href='index.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}    
    %>
