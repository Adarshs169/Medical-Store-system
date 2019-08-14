<%-- 
    Document   : update_info
    Created on : 12 Nov, 2018, 4:18:21 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME</title>
    </head>
    <body bgcolor="silver">
         <form action="update_med.jsp">
             <h1><center>UPDATE MEDICINE INFO</center></h1>
            <h2>UPDATE STOCK </h2>
            <p>ENTER MEDICINE ID</p>
            <input type="text" name="med_id" value="" />
            <p>ENTER STOCK QUANTITY</P>
            <input type="text" name="stock" value="" />   <input type="submit" value="PROCEED" />
      </form>
        <form action="insert_cell.jsp" method="POST">
            <h2>UPDATE CELL NUMBER</h2>
            <p>ENTER MEDICINE ID</p>
            <input type="text" name="med_id" value="" />
            <p>ENTER CELL NUMBER<p>
                <input type="text" name="cell" value="" /><input type="submit" value="PROCEED" />
        </form>
        <form action="exp.jsp" method="POST">
            <h2>UPDATE EXPIRY DATE</h2>
            <p>ENTER MEDICINE ID</p>
            <input type="text" name="med_id" value="" />
            <p>ENTER EXPIRY DATE</P>
            <input type="text" name="exp" value="" />
            <input type="submit" value="PROCEED" />            
        </form>
        <form action="profit.jsp">
            <h2>UPDATE PRICE</h2>
            <p>ENTER MEDICINE ID</p>
            <input type="text" name="med_id" value="" />
            <p>ENTER THE COST PRICE</p>
            <input type="text" name="cp" value="" />
            <p>ENTER THE SELLING PRICE</p>
            <input type="text" name="sp" value="" />
            <input type="submit" value="PROCEED" />
        </form>
    </body>
</html>
