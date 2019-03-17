<%-- 
    Document   : buyprocess
    Created on : 17 Mar, 2019, 10:44:14 PM
    Author     : varsha
--%>

<%@page import="javax.ejb.EJB"%>
<%@page import="quantity.NewSessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    
   
    String name=request.getParameter("product");
    //out.println(name);
    int q=Integer.parseInt(request.getParameter("quant"));
    try{
        
         
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans","root","Varsha26");
        Statement st=conn.createStatement();
        //out.println("hello");
        ResultSet rs=st.executeQuery("select * from kart where pname='"+name+"'");
        int id=0;
        while(rs.next()){
        id=rs.getInt("quantity");}
         if(id<5){ %>
         <script>
             alert("less");
             </script>
         <%}
                int newquant=id-q;
        out.println(newquant);
        PreparedStatement ps=conn.prepareStatement("update kart set quantity=? where pname='"+name+"'");
        out.println("hello");
       ps.setInt(1, newquant);
        int i=ps.executeUpdate();
    if(i>0){
        out.println("Records updated successfully");
    }else{
        out.println("No!");
    }
        
        
    }catch(Exception e){
        e.printStackTrace();
    }
    %>