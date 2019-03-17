<%-- 
    Document   : view
    Created on : 17 Mar, 2019, 9:24:39 PM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select * from kart");
        while(rs.next()){
            out.println(rs.getInt("ID"));
            out.println(rs.getString("pname"));
            out.println(rs.getInt("quantity"));
        } %>
        <html>
            <form action="buy.jsp" method="post">
                <input type="submit" value="buy">
            </form>
        </html>
        <%
        
    }catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
%>