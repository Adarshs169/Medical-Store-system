<%-- 
    Document   : home
    Created on : 8 Nov, 2018, 4:04:54 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
    </head>
    <body bgcolor="red">
        <h1><center>WELCOME TO MEDICAL STORE</center></h1>
        <h3>LOGIN:</h3>
        <form name="login" action="login.jsp" method="POST">
            <h3>ENTER THE PHONE NUMBER</h3>
            <input type="password" required="required" name="phone_no" value="" />
            <input type="submit" value="login" />
        </form>
        <form action="sucess.jsp" method="POST">
            <h3>ENTER HERE TO CREATE A NEW ACCOUNT</h3>
            <input type="submit" value="ENTER" />
        </form>
        <form action="medicine_info.jsp" method="POST">
    <h3>ENTER THE MEDICINE NAME TO BE SEARCHED</h3>
<input type="text" name="med_name" required="required" value="" />
<input type="submit" value="enter" />
  </form>
<form action="insert_info.jsp" method="POST">
    <h3>CLICK HERE TO INSERT MEDICINE INFORMATION</h3>
    <input type="submit" value="INSERT INFORMATION" />
</form>
        <form action="update_info.jsp">
            <h3>CLICK HERE TO UPDATE MEDICINE INFORMATION</h3>
            <input type="submit" value="UPDATE" />
            
            </form>
      </body>
</html>