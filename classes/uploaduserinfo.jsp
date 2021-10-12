<%-- 
    Document   : uploaduserinfo
    Created on : Mar 10, 2018, 10:33:34 AM
    Author     : CCIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
         String fname=request.getParameter("Fname");
         String lname=request.getParameter("Lname");
         String email=request.getParameter("Email");
         String mobile=request.getParameter("Mobile");
         String pwd=request.getParameter("pwd");
     
         Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        try{
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitlock","root","root");
        Statement stmt;
        stmt=con.createStatement();
        String sql="insert into userdata (firstname,lastname,email,mobile,password) values ('"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+pwd+"')";
        stmt.executeUpdate(sql);
        out.print("<h1>Successfully Resgistor</h1> >");
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>
    </body>
</html>
