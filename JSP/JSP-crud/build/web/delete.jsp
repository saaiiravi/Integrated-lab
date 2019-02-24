<%-- 
    Document   : delete
    Created on : 24 Feb, 2019, 11:00:49 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
out.println(name);

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
    Statement st=conn.createStatement();
    
    //out.println(sql);
    int i=st.executeUpdate("DELETE FROM userform WHERE name='"+name+"'");
    out.println("Deleted");
    
    
    
}catch(Exception e){
    System.out.print(e);
    e.printStackTrace();
    
}

%>