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
         String fname=request.getParameter("fname");
         String lname=request.getParameter("lname");
         String email=request.getParameter("email");
         String mobile=request.getParameter("mobile");
         String pwd=request.getParameter("password");
         String id=session.getAttribute("Id").toString();
         Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
     
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitlock","root","root");
        Statement stmt;
        stmt=con.createStatement();
        String sql="UPDATE userdata SET firstname='"+fname+"',lastname='"+lname+"',email='"+email+"',mobile='"+mobile+"' WHERE ID='"+id+"' AND password='"+pwd+"';";
        int res=stmt.executeUpdate(sql);
        if(res!=0)
  		{
  			out.print("<h1>sccessfully update</h1>");
  		}
     
      
  %>