<%-- 
    Document   : login
    Created on : 8 Nov, 2018, 8:56:27 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MEDICAL STORE</title>
    </head>
         <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
         <body bgcolor="silver">
             <h1><center>SORRY! INVALID CREDENTIALS</center></h1>
             <a href="home.jsp">TRY AGAIN</a>
     <%
       String phone_no=request.getParameter("phone_no");
        %>
        <%
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
            String query="select cust_phno,cust_name,cust_id from customer where cust_phno='"+phone_no+"' ";
            st=con.createStatement();
            results=st.executeQuery(query);
            while(results.next()){
                a=results.getString(1);
         b=results.getString(2);
             int c=results.getInt(3);%>
                <p>hi:<%=a%></p>
                <%session.setAttribute("at", c);
                    if (phone_no.equals(a))
                { 
                response.sendRedirect("buy.jsp");
                return;
                
                }
}
}
        catch(SQLException error){
            System.err.println("SQL error"+error);
            
        }
        con.close();
        %>
         </body>
        </html>