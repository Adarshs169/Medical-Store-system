<%-- 
    Document   : sucess
    Created on : 8 Nov, 2018, 9:18:45 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGN UP</title>
         <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
    </head>
    <body bgcolor="lime">
        <form action="signup.jsp">
            <p>ENTER CUSTOMER ID</p>
            <input type="text" required="required" name="cust_id" value="" />
            <p>ENTER THE NAME OF CUSTOMER </P>
            <input type="text" required="required" name="cust_name" value="" />
            <P>ENTER PHONE NUMBER OF CUSTOMER </p>
            <input type="text" required="required" name="phone" value="" />
            <input type="submit" value="SUBMIT" />
   </form>
    </body>
</html>

