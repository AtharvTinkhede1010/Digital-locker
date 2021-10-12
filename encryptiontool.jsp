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
         <link rel=stylesheet type="text/css" href="css/style.css">
       <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
         <nav><div id="logo">Digital Locker </div>
             <ul>
                <a href="home.jsp"><li>Home</li></a>
                <a href="file.jsp"><li>File Upload</li></a>
                <a href="profiledit.jsp"><li>Encryption Tool</li></a>
                 <a href="profiledit.jsp"><li>profile Edit</li></a>
                 <li>Log Out</li>
             </ul>
         </nav>
       <br><br>
       <div class="lead" style="padding-left: 50px;padding-right: 100px;text-align: justify">
          <p class="h1">Encryption Tool</p>
          1. To Download encryption tool click on <mark>Download</mark>.<br>
          2. Excute the <mark>encryptiontool.jar</mark> file. The encryptiontool get excuted. <br>
          3. To create your owen key for encryption click on <mark>create Key </mark>it will open input dialog box it will create a key so you can encrypt file by using that key.<br>
          4. To encrypt file click on <mark>encrypt</mark> it will open choose dialogbox. Select the file you want to encrypt click on open. Then input dialogbox is open  enter the key you created and press ok. It will show loction of file where encrypted file is store.<br>
          5. You will see the file of same name as you choose file for encrypted  but with extension <mark>.aes</mark>.<br>
          6. To Decrypt file click on <mark>Decrypt</mark> it will open choose dialogbox. Select the file you want to Decrypt click on open. Then input dialogbox is open  enter the key you created and press ok. It will show loction of file where Decrypted file is store.
          <br><br><a href="tool/encryptiontool.jar"><button class="btn btn-primary">Download</button></a>
       </div>
    </body>
</html>
