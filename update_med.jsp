<%-- 
    Document   : update_med
    Created on : 10 Nov, 2018, 6:15:22 PM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEDICINE</title>
         <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
         <%@ page import="java.text.SimpleDateFormat" %>
    </head>
    <body bgcolor="silver"><%
        
        String med_id=request.getParameter("med_id");
        String stock=request.getParameter("stock");
          int stock1=Integer.parseInt(stock);
           int med=Integer.parseInt(med_id);%>
           <%Statement st=null;
        ResultSet results=null;
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
            String query="update medicine set stock_qty="+stock1+"where med_id="+med+"";
            st=con.createStatement();
            int i=st.executeUpdate(query);
            if(i>0){
                 %>
                 
           <p>UPDATE SUCCESSFUL</p>
   <%
               
                
            }
else{
               %>
                 
           <p>there is a problem occured in updating</p>
   <%
        

}
            }
catch(SQLException error){
            System.err.println("SQL error"+error);
        }
con.close();
           

       %>
    </body>
</html>
