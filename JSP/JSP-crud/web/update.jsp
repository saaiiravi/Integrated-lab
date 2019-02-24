<%-- 
    Document   : update
    Created on : 24 Feb, 2019, 10:02:42 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String name=request.getParameter("name");
    out.println(name);
    try{
        ResultSet resultset=null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
        if(conn!=null){
            out.println("db success!");
            
        }
        Statement st=conn.createStatement();
        //String sql="select * from userform where name="+name;
       // out.println(sql);
        resultset=st.executeQuery("SELECT * FROM userform WHERE name='"+name+"'");
        //out.println("done");
        while(resultset.next()){
            %>
            <html>
                <h1>  lalalal</h1>
                <body>
                    <form action="updateprocess.jsp" method="post">
                        Name:<input type="text" name="name" value="<%=resultset.getString("name")%>">
                        Password:<input type="text" name="password" value="<%=resultset.getString("password")%>">
                        Email:<input type="email" name="email" value="<%=resultset.getString("email")%>">
                        Sex:<input type="text" name="sex" value="<%=resultset.getString("sex")%>">
                        Country: <input type="text" name="country" value="<%=resultset.getString("country")%>">
                        <input type="submit" value="Update">
                    </form>
              
            <% 
        }
        
    }catch(Exception e){
    System.out.print(e);
    e.printStackTrace();
}
    
%>
  </body>
            </html>

