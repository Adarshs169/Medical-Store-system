<%-- 
    Document   : pres
    Created on : 20 Nov, 2018, 4:00:43 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME</title>
        <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
    </head>
    <body bgcolor="silver">
        <%
         String pres_id=request.getParameter("pres_id");
           int p=Integer.parseInt(pres_id);
         
           session.setAttribute("val",p);        
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
            String query1="select * from prescription where pres_id="+p+"";
            st=con.createStatement();
            results=st.executeQuery(query1);
     if(results.next()){
         %>
         <h1><center>PRESCRIPTION ID ALREADY TAKEN!</center></h1>
         <a href="buy.jsp">BACK</a>
         <% }
else{
            String cust_id=session.getAttribute("at").toString();
            int c_id=Integer.parseInt(cust_id);
            String query2="insert into prescription values("+p+","+c_id+")";
            st=con.createStatement();
            st.executeQuery(query2); 
            %>
            <h1><center>PRESCRIPTION ID CREATED</center></h1>
            <p>CLICK HERE TO PROCEED THE PURCHASING</p>
            <form action="pay1.jsp">
                <input type="submit" value="PROCEED" />
            
            </form>
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
