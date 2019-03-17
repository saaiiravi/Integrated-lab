<%-- 
    Document   : login
    Created on : 11 Mar, 2019, 11:14:02 AM
    Author     : varsha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginForm.do" method="post">
            Username: <input type="text" name="uname"> <br>
            Password: <input type="password" name="upass"> <br>
            <input type="submit" value="OK">
        </form>
    </body>
</html>
