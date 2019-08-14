<%-- 
    Document   : insert_exp.jsp
    Created on : 11 Nov, 2018, 10:42:13 PM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CELL No.</title>
        <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
        
    </head>
    <body bgcolor="silver"><%
         String med_id=request.getParameter("med_id");
        String exp=request.getParameter("exp");
           int med=Integer.parseInt(med_id);
    %>
           <% 
        ResultSet results=null;
        Statement st=null;
        Connection con=null;
        String url="jdbc:oracle:thin:@DESKTOP-P87C83O:1521:XE";
        String userid="dbms";
        String password="dbms";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,userid,password);
            }
        catch(ClassNotFoundException error) {
            System.err.println("unable to load jdbc/odbc bridge"+error);
            
                }
        catch(SQLException error){
            System.err.println("cannot connect to the database"+error);
        }
        try{
            String query="update medicine set exp_date=? where med_id="+med+"";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,exp);
            ps.executeUpdate();
       %>
                 
       <p><center>UPDATE SUCCESSFUL</center></p>
   <%
}
            
catch(SQLException error){
            System.err.println("SQL error"+error);
       %>
                 
           <p>there is a problem occurred in updating</p>
   <%
        }
con.close();
           

       %>
    </body>
</html>

