<%-- 
    Document   : home.jsp
    Created on : Mar 10, 2018, 11:16:59 AM
    Author     : CCIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" type="text/css" href="css/style.css">
       <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
         <nav><div id="logo">Digital Locker </div>
             <ul>
                <a href="home.jsp"><li>Home</li></a>
                <a href="file.jsp"><li>File Upload</li></a>
                <a href="encryptiontool.jsp"><li>Encryption Tool</li></a>
                 <a href="profiledit.jsp"><li>profile Edit</li></a>
                <a href="index.jsp"><li>Log Out</li></a>
             </ul>
         </nav>
       <form action="classes/fileupload.jsp" method="post" enctype="multipart/form-data" >
          <h1 style="text-align: center">File Upload</h1>
          <hr>
          <table cellpadding=10px align=center>
             <tr><td><lable>File Name</lable></td><td><input type="text" name="filename" required class="form-control" ></td></tr>
             <tr><td><lable>File Detail</lable></td><td><textarea   name="detials" class="form-control" ></textarea></td></tr>
              <tr><td><lable>Select File</lable></td><td><input type="file" name="file" required class="form-control" ></td></tr>
             <tr><td><lable></lable></td><td><input type="hidden" name="filenme" required class="form-control" ></td></tr>
            <tr><td><lable></lable></td><td><input type="submit"></td></tr>
          </table>
      </form>
    </body>
</html>
<script>
   var file=document.getElementsByTagName("INPUT")[1];
   var data=document.getElementsByTagName("INPUT")[2];
   file.onblur=function(){
      console.log(file);
      console.log(data);
      data.value=file.value;
   }
   
</script>