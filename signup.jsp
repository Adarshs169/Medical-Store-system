<%-- 
    Document   : signup
    Created on : 8 Nov, 2018, 8:58:24 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sign up</title>
         <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
    </head>
    <body bgcolor="silver">
       <%
       String cust_id=request.getParameter("cust_id");
       int cust_id1=Integer.parseInt(cust_id);
       String phone=request.getParameter("phone");
       String name=request.getParameter("cust_name");
        Statement st=null;
        ResultSet results=null;
        Connection con=null;
        String url="jdbc:oracle:thin:@DESKTOP-P87C83O:1521:XE";
        String userid="dbms";
        String password="dbms";
        String a,b;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,userid,password);
            }
        catch(ClassNotFoundException error) {
            System.err.println("unable to load jdbc/odbc bridge"+error);
            System.exit(1);
                }
        catch(SQLException error){
            System.err.println("cannot connect to the database"+error);
            System.exit(2);
        }
         try{
            String query1="select * from customer where cust_id="+cust_id1+"";
            st=con.createStatement();
            results=st.executeQuery(query1);
     if(results.next()){
         %>
         <p><center>CUSTOMER ID ALREADY TAKEN!</center></p>
         <% }
else{
         
            String query="insert into customer values("+cust_id1+",'"+name+"','"+phone+"')";
            st=con.createStatement();
            results=st.executeQuery(query);
           
            %>
                <h1><center>WELCOME</center></h1>
                <h3><CENTER>SIGN UP IS SUCCESSFUL!</center></h3>
                <a href="home.jsp">LOGIN</a>
                <%
            }
}

catch(SQLException error){
            System.err.println("SQL error"+error);
            System.exit(2);
        }
con.close();


              %>
    </body>
</html>

