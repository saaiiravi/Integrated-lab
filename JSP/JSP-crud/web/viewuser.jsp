<%-- 
    Document   : viewuser
    Created on : 24 Feb, 2019, 9:17:53 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<html>
    <body>
        <h1>View the database</h1>
        <table border="2">
            <tr>
                <td>Name</td>
                <td>Password</td>
                <td>Email</td>
                <td>Sex</td>
                <td>Country</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            

<% 
try{
    ResultSet resultset=null;
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
    Statement st=conn.createStatement();
   resultset = st.executeQuery("select * from userform");
   while(resultset.next()){
       %>
       
           <tr>
               <td><%=resultset.getString("name")%></td> 
           <td><%=resultset.getString("password")%></td>
           <td><%=resultset.getString("email")%></td>
           <td><%=resultset.getString("sex")%></td>
           <td><%=resultset.getString("country")%></td><br>
           <td><a href="update.jsp?name=<%=resultset.getString("name")%>">update</a></td>
            <td><a href="delete.jsp?name=<%=resultset.getString("name")%>">delete</a></td>
               
           </tr>
      

   <%    
   }
    
}catch(Exception e){
    System.out.print(e);
    e.printStackTrace();
    
} %>

        </table>
        
    </body>
  
</html>


