<%-- 
    Document   : medicine_info
    Created on : 8 Nov, 2018, 9:00:04 AM
    Author     : adars
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <%@ page import="java.util.*" %>
 <%@ page import="java.sql.*" %>
 <style>
     table, th, td {
         border: 1px solid black;
     }
 </style>
</head>
<body bgcolor="yellow"><%
        String med_name=request.getParameter("med_name");
        String med_name1=med_name.toLowerCase();
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
            System.exit(1);
                }
        catch(SQLException error){
            System.err.println("cannot connect to the database"+error);
            System.exit(2);
        }
        
         try{
             String a,b,c,d;
            String query="select * from medicine where med_name='"+med_name1+"' ";
            st=con.createStatement();
            results=st.executeQuery(query);
             if(!results.next()){
                 %>
                 <p><center>NO MEDICINES FOUND!</center></p>
<a href="home.jsp">HOME</a>
                 <%
             }
else{
                int med_id=results.getInt(1);
                a=results.getString(2);
                b=results.getString(3);
                c=results.getString(4);
                d=results.getString(6);
                String date=results.getDate(5).toString();
                int stqty=results.getInt(7);
                %>
<p><center>THE MEDICINE FOUND IS:-</center></p>
                <table style="width:100%">
                    <tr>
                        <th>MEDICINE_ID</th>
                        <th>MEDICINE NAME</th>
                        <th>CHEMICAL NAME</th>
                        <th>GENRE</th>
                        <th>EXPIRY DATE</th>
                        <th>CELL NUMBER</th>
                        <th>STOCK QUANTITY</th>
                    </tr>
                    <tr>
                        <td><%=med_id%></td>
                        <td><%=a%></td>
                        <td><%=b%></td>
                        <td><%=c%></td>
                        <td><%=date%></td>
                        <td><%=d%></td>
                        <td><%=stqty%></td>
                    </tr>
                </table>
<a href="home.jsp">HOME</a>
                <%
                
            }

}
 catch(SQLException error){
            System.err.println("SQL error"+error);
            System.exit(3);
        }
        con.close();
        %>
        
        
</body>
</html>