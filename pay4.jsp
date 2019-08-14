<%-- 
    Document   : pay4
    Created on : 21 Nov, 2018, 11:26:34 PM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ page import="java.util.*" %>
         <%@ page import="java.sql.*" %>
    </head>
    <body bgcolor="yellow">
  <%
         String pay_id=request.getParameter("pay_id");
         int p=Integer.parseInt(pay_id);
         String pay_st=request.getParameter("pay_status");
          String pres_id=session.getAttribute("val").toString();    
          int pr=Integer.parseInt(pres_id); 
        Statement st=null;
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
            String query1="select * from payment where payment_id="+p+"";
            st=con.createStatement();
            results=st.executeQuery(query1);
     if(results.next()){
         %>
         <p><center>PAYMENT ID ALREADY TAKEN!</center></p>
         <a href="pay3.jsp">ENTER AGAIN</a>
         <% }
else{
          float famt=0;
          String query2="select amount from bill_details where pres_id="+pr+"";
           results=st.executeQuery(query2);
           while(results.next()){
           famt=famt+results.getFloat(1);
}
           String query3="insert into payment values("+p+","+famt+",'"+pay_st+"',"+pr+")";
           st.executeQuery(query3);
  %>
  <h1><center>PURCHASING SUCCESSFUL!</center></h1>
             <p>PAYMENT ID=<%=p%></p>
             <p>FINAL AMOUNT=<%=famt%></p>
  <a href="home.jsp">HOME</a>
  <%

}
}
catch(SQLException error){
            System.err.println("SQL error"+error);
%>
<p>OOPS! ERROR OCCURRED</p>
<%
        }
con.close();
        %>
    </body>
</html>
