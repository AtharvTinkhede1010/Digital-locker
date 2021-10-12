
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<%
   
Part photo=request.getPart("file");
String filename=request.getParameter("filename");
String phoname=request.getParameter("filenme");
String detail=request.getParameter("detials");
    try{
int post=phoname.indexOf(".");
String ext=   phoname.substring(post);
Random rnd=new Random();
int n=rnd.nextInt();                                  
n=Math.abs(n);                
   String type=photo.getContentType();
String fname=n+ext;
String path=application.getRealPath("file");
path=path+"\\"+fname;
photo.write(path);  
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digitlock","root","root");
String msql="insert into file (filename,file,filedetail,userid) values(?,?,?,?)";;
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,filename);   
smt.setString(2,fname);   
smt.setString(3,detail);   
smt.setString(4,(String)session.getAttribute("Id"));   
smt.executeUpdate();   
con.close();
out.print("<h1>SuccessFully Uploaded</h1>");
   }
catch(Exception e)
{
out.print(e);
}
%>   

    </body>
</html>
