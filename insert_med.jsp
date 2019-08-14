<%-- 
    Document   : insert_med.jsp
    Created on : 10 Nov, 2018, 3:41:02 AM
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
    <body bgcolor="silver">
          <%
       String med_id=request.getParameter("med_id");
       int med1=Integer.parseInt(med_id);
       String name=request.getParameter("med_name");
       String chem=request.getParameter("chem_name");
       String gene=request.getParameter("gene");
        String exp=request.getParameter("exp");
         String cell=request.getParameter("cell");
         String stock=request.getParameter("stock");
         int stk=Integer.parseInt(stock);
         String cp=request.getParameter("cp");
         int cp1=Integer.parseInt(cp);
                  String sp=request.getParameter("sp");
         int sp1=Integer.parseInt(sp);
         int profit=sp1-cp1;
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
            String query1="select * from medicine where med_id="+med1+"";
            st=con.createStatement();
            results=st.executeQuery(query1);
     if(results.next()){
         %>
         <p>MEDICINE ID ALREADY TAKEN!</p>
         <a href="insert_info.jsp">back</a>
         <% }
else{
        SimpleDateFormat d=new SimpleDateFormat("dd/mm/yyyy");
        java.util.Date dt=d.parse(exp);
        java.sql.Date sqldt=new java.sql.Date(dt.getTime());

         
            String query="insert into medicine values("+med1+",'"+name+"','"+chem+"','"+gene+"','"+exp+"','"+cell+"',"+stk+")";
            String sql="insert into profit values("+cp1+","+sp1+","+profit+","+med1+")";
            st=con.createStatement();
            results=st.executeQuery(query);
              st.executeQuery(sql);
           
            %>
                <h1><center>WELCOME</center></h1>
                <h3>MEDICINE INSERTION IS SUCCESSFUL!</h3>
                <a href="insert_info.jsp">click here to add more medicine</a>
                <a href="home.jsp">HOME</a>
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
