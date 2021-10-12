<%-- 
    Document   : home.jsp
    Created on : Mar 10, 2018, 11:16:59 AM
    Author     : CCIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel=stylesheet type="text/css" href="css/style.css">
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
         <br><br>
       <div class="h1" style="padding-left:100px">MY Files</div>
       <hr>
         <div style="padding-left:50px; padding-right:50px;display: grid;grid-template-columns:repeat(5,1fr); ">
       <%
          String userid=(String)session.getAttribute("Id");
             Connection con=null;
         ResultSet res;
        Class.forName("com.mysql.jdbc.Driver");
        try{
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitlock","root","root");
        Statement stmt;
        stmt=con.createStatement();
        String sql="select * from file where userid="+userid;
        res=stmt.executeQuery(sql);
           while(res.next())
           {
            String filename=res.getString("filename");
            String file=res.getString("file");
            int post=file.indexOf(".");
            String ext=file.substring(post);
          String exts=file.substring(post+4);
         
           // out.print(exts);
         
              if(ext.equals(".jpg"))
              out.print("<div id='file-block'><img src='img/jpg.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"' download><button class='btn btn-primary'>Download</button></a></div>");
              else  if(ext.equals(".png"))
                     out.print("<div id='file-block'><img src='img/png.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else if(ext.equals(".doc")||ext.equals(".docx"))
                     out.print("<div id='file-block'><img src='img/doc.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else if(ext.equals(".ppt")||ext.equals(".pptx"))
                     out.print("<div id='file-block'><img src='img/ppt.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else if(ext.equals(".pdf"))
                     out.print("<div id='file-block'><img src='img/pdf.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else if(ext.equals(".txt"))
                     out.print("<div id='file-block'><img src='img/txt.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else if(exts.equals(".aes")||exts.equals(".aes"))
                     out.print("<div id='file-block'><img src='img/lock.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>");
                     else
                     out.print("<div id='file-block'><img src='img/file.png' height=100px ><br>"+filename+"<br><a href='file/"+file+"'  download><button class='btn btn-primary'>Download</button></a></div>"); 
                   
                  
              
           }
        }
         catch(Exception e)
         {
            out.print(e);
         }
          %>
             </div>
    </body>
</html>
