<%-- 
    Document   : pay2
    Created on : 20 Nov, 2018, 9:02:09 AM
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
    <body bgcolor="green">
        <%
        int a=0;
        int m=0;
        String pr=session.getAttribute("val").toString();
        int p=Integer.parseInt(pr);
        String med_name=request.getParameter("med_name");
        String qty=request.getParameter("qty");
        String fp=request.getParameter("fp");
        int q=Integer.parseInt(qty);
        float f=Float.parseFloat(fp);%>
        <%!Statement st=null;
        ResultSet results=null;
        Connection con=null;
        String url="jdbc:oracle:thin:@DESKTOP-P87C83O:1521:XE";
        String userid="dbms";
        String password="dbms";%>
       <% try {
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
            float am=f*q;
            st=con.createStatement();
            String sql="select med_id from medicine where med_name='"+med_name+"' ";
             results=st.executeQuery(sql);
             boolean r=results.next();
             if(!r){
                 %>
                 <P>INVALID MEDICINE NAME</P>
                 <a href="pay1.jsp">BACK</a>
                 <%
             }
else{      
             do{
              m=results.getInt(1);%>
            <% }while(results.next());
}
             String query="insert into bill_details values("+f+","+q+","+a+","+m+","+p+")";
                 
                 st.executeQuery(query);
                 CallableStatement cs=con.prepareCall("{call calamount(?,?,?)}");
                 cs.setInt(1,m);
                 cs.setInt(2,p);
                 cs.setFloat(3,am);
                 cs.execute();
                 String query1="update medicine set stock_qty=stock_qty-"+q+"where med_id="+m+"";
                 st.executeUpdate(query1);
                 %>
                 <h1><center>MEDICINE ADDED TO THE CART</center></h1>
                 <a href="pay1.jsp">ADD MORE MEDICINES</a>
                 <form action="pay3.jsp">
                 <input type="submit" value="PROCEED" />
                                      </form>
                 <%
           }
        catch(SQLException error){
            System.err.println("SQL error"+error);
            %>
            <p>ERROR OCCURRED! CHECK THE STOCK DETAILS OF MEDICINE</p>
            <a href="pay1.jsp">BACK</a>
            <%
        }
con.close();
   %>
        
       
    </body>
</html>
