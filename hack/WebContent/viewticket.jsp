<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 20px;
  padding: 20px 30px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}
h1.elegantshadow {
  color: #131313;
  background-color: #e7e5e4;
  letter-spacing: .15em;
}
</style>
</head>
<body>
<a href="logout.jsp"> LogOut</a>
<h1 class='elegantshadow'>Open Tickets</h1>

<table border="2" align="center">
<tr><td>Ticket_NO</td><td>Ticket_Date</td><td>Emp_ID</td><td>Workstation</td><td>Date of Joining</td><td>Action</td></tr>

<%@ page import="java.sql.*" %>


<%

   
    Connection conn = null;String tno="";
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement pst= conn.prepareStatement("select * from ticket where status='PENDING'");
        ResultSet rs=pst.executeQuery();
        
        while(rs.next())
        {
        	tno=rs.getString("TNO");
        %>	
       <tr>
       <td><% out.println(tno);%></td>
       <td><% out.println(rs.getString("TDATE"));%></td>
       <td><% out.println(rs.getString("EMPNO"));%></td>
       <td><% out.println(rs.getString("WKSNO"));%></td>
       <td><% out.println(rs.getString("DOJ"));%></td>
       <td>
       <form action="close.jsp">  
           <input type="hidden" name="tno" value=<%=tno%>>
            <input type="submit" value="Process Ticket">
       </form>
       </td>
       </tr> 	
        	
       <% }
        
        conn.close();
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>
</table>
</body>
</html>