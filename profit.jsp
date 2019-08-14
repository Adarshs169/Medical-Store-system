<%-- 
    Document   : profit
    Created on : 12 Nov, 2018, 4:27:45 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROFIT</title>
        <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
         <%@ page import="java.text.SimpleDateFormat" %>
    </head>
    <body bgcolor="silver">
        <%
         String med_id=request.getParameter("med_id");
        String cp=request.getParameter("cp");
           int med=Integer.parseInt(med_id);
           int c=Integer.parseInt(cp);
           String sp=request.getParameter("sp");
           int s=Integer.parseInt(sp);
        %>
   <%   Statement st=null;
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
            int p=s-c;
            String query="update profit set cost_price="+c+"where med_id="+med+"";
            String query1="update profit set selling_price="+s+"where med_id="+med+"";
              String query2="update profit set profit="+p+"where med_id="+med+"";
            st=con.createStatement();
            st.executeUpdate(query);
            st.executeUpdate(query1);
            int i=st.executeUpdate(query2);
            if(i>0){
                 %>
                 
                 <p><center>UPDATE SUCCESSFUL</center></p>
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
