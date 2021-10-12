<%-- 
    Document   : registration
    Created on : Mar 10, 2018, 10:26:49 AM
    Author     : CCIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
              <div class="alert alert-danger" id=alert style="display: none">
             Password does not Match
          </div>
       <div class="form-group" style="padding-left: 50px">
        <form action="classes/uploaduserinfo.jsp" method="post" >
           <h1>Registration</h1>
            <table style="width:700px" cellpadding="5px">
                <tr><td><lable>First Name</lable></td><td><input type="text" name="Fname" class="form-control" required></td></tr>
                <tr><td><lable>Last Name</lable></td><td><input type="text" name="Lname" class="form-control" required></td></tr>
<tr><td><lable>Email</lable></td><td><input type="text" name="Email" class="form-control" required></td></tr>
<tr><td><lable>mobile</lable></td><td><input type="text" name="Mobile" class="form-control" pattern="[0-9]{10}" title="Enter 10 Digits" required></td></tr>
                <tr><td><lable>Password</lable></td><td><input type="password" name="pwd" id=pwd class="form-control" required></td></tr>
                <tr><td><lable>Password Retry</lable></td><td><input type="password" id=pwdr class="form-control" required></td></tr>
                <tr><td></td><td><input type="submit" class="btn btn-primary"></td></tr>
                
                </table>
        </form>
   
       </div>
    </body>
</html>
<script>
   var pwd=document.getElementById("pwd");
   var pwdr=document.getElementById("pwdr");
   pwdr.onblur=function(){
      if(pwd.value!=pwdr.value)
         document.getElementById("alert").style.display="block";
      pwd.value="";
      pwdr.value="";
   }
   </script>