<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel=stylesheet type="text/css" href="css/style.css">
         <link rel=stylesheet type="text/css" href="css/bootstrap.css">
    </head>
<body>
<% 
String Fname=session.getAttribute("fname").toString();
String Lname=session.getAttribute("lname").toString();
String Mobile=session.getAttribute("mobile").toString();
String Email=session.getAttribute("email").toString();
String id=session.getAttribute("Id").toString();
%>
         <nav><div id="logo">Digital Locker </div>
             <ul>
                <a href="home.jsp"><li>Home</li></a>
                <a href="file.jsp"><li>File Upload</li></a>
                <a href="encryptiontool.jsp"><li>Encryption Tool</li></a>
                 <a href="profiledit.jsp"><li>profile Edit</li></a>
                <a href="index.jsp"><li>Log Out</li></a>
             </ul>
         </nav>
   <br>
<form action="classes/userdataupdate.jsp" method=post >
<H1  align=center>Profile Edit</H1>
   <hr>
<table align=center cellpadding=10px>
<tr><td><lable>First Name</lable></td><td><input type=text name=fname class="form-control" value=<%=Fname%> ></td></tr>
<tr><td><lable>Last Name</lable></td><td><input type=text name=lname class="form-control" value=<%=Lname%>></td></tr>
<tr><td><lable>Mobile Name</lable></td><td><input type=text name=mobile class="form-control" value=<%=Mobile%>></td></tr>
<tr><td><lable>Email Name</lable></td><td><input type=email name=email class="form-control" value=<%=Email%>></td></tr>
<tr><td><lable>Password</lable></td><td><input type="password" name=password class="form-control" ></td></tr>
<tr><td><lable></lable></td><td><input type=hidden name=id value=<%=id%>></td></tr>
<tr><td><lable></lable></td><td><input type=submit class="btn btn-primary"></td></tr>
</table>
</form>
</body>
</html>