

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel=stylesheet type="text/css" href="css/style.css">
       
    </head>
    <body id="index-body">
        <%
            String message="";
        try{
        String login="";
        
        login=request.getParameter("login");
        if(login.equals("fail"))
        {
            message="Emailid/Password invalid";
        }
        else
        { 
            message="";
        }
        }
        catch(Exception e)
        {
        }
        %>
        <header>
            <nav><div id="logo">Digital Locker </div></nav>
            <div id="login-div">
                <h1>Login</h1>
                <form action="classes/login.jsp" method="post">
                <table>
                    <tr><td><lable class="login-lable">Email Id</lable></td><td><input type="email" class="login-input" name="Email"></td></tr>
                  <tr><td><lable class="login-lable">Password</lable></td><td><input type="password" class="login-input" name="pwd"> </td></tr>
        <tr><td style="color: red;font-weight: bolder"><%=message%></td><td><input type="submit" value="Sign in" class="login-btn"><a href="registration.jsp"  value="Sign up" class="login-btn">Sign up</a><td></tr>
                </table>
            </form>
            </div>
        </header>
    </body>
</html>
