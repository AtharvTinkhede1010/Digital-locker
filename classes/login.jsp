<%-- 
    Document   : login
    Created on : Mar 10, 2018, 10:58:43 AM
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
            String email=request.getParameter("Email");
         String pwd=request.getParameter("pwd");
             Connection con=null;
             ResultSet res;
        Class.forName("com.mysql.jdbc.Driver");
        try{
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitlock","root","root");
        Statement stmt;
        stmt=con.createStatement();
        String sql="Select * from userdata where email='"+email+"' AND password='"+pwd+"'";
        res=stmt.executeQuery(sql);
        if(res.next())
        { 
         String id=res.getString("ID");
         String fname=res.getString("firstname");
         String lname=res.getString("lastname");
         String mobile=res.getString("mobile");
         String Email=res.getString("email");
         
         session.setAttribute("Id",id);
         session.setAttribute("fname",fname);
         session.setAttribute("lname",lname);
         session.setAttribute("email",Email);
         session.setAttribute("mobile",mobile);
               
         response.sendRedirect("../home.jsp");
        }else
        {
        response.sendRedirect("../index.jsp?login=fail");
        }
        }
        catch(Exception e)
        {
            out.print(e);
        }
            %>
    </body>
</html>
