<%-- 
    Document   : pay3
    Created on : 21 Nov, 2018, 6:17:58 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body bgcolor="yellow">
        <form action="pay4.jsp">
            <h1><center>WELCOME</center></h1>
        <h3>ENTER PAYMENT ID</h3>
        <input type="text" name="pay_id" value="" />
        <h3>ENTER PAYMENT STATUS</h3>
        <select name="pay_status">
            <option>DONE</option>
            <option>NOT DONE</option>
        </select>
        <input type="submit" value="PROCEED" />
                </form>

    </body>
</html>
