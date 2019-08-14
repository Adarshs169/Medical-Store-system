<%-- 
    Document   : update_info
    Created on : 9 Nov, 2018, 8:12:51 PM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEDICINE</title>
    </head>
    <body bgcolor="aqua">
        <form action="insert_med.jsp">
            <h1><center>INSERT NEW MEDICINE</center><h1>
            <h4>ENTER MEDICINE ID</h4>
            <input type="text" name="med_id" value="" />
            <h4>ENTER MEDICINE NAME</h4>
            <input type="text" name="med_name" value="" />
            <h4>ENTER CHEMICAL NAME OF THE MEDICINE</h4>
            <input type="text" name="chem_name" value="" />
            <h4>ENTER MEDICINE GENRE</h4>
            <input type="text" name="gene" value="" />
            <h4>ENTER EXPIRY DATE</h4>
            <input type="text" name="exp" value="" />
            <h4>ENTER CELL NUMBER</h4>
            <input type="text" name="cell" value="" />
            <h4>ENTER STOCK QUANTITY</h4>
            <input type="text" name="stock" value="" />
            <h4>ENTER COST PRICE</h4>
            <input type="text" name="cp" value="" />
            <h4>ENTER SELLING PRICE</h4>
            <input type="text" name="sp" value="" />
             <input type="submit" value="ENTER" />
            <p>
        </form>
       
    </body>
</html>
