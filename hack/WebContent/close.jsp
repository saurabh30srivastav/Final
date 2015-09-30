<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table align="center" border="2">
<tr>
<td>Ticket_No</td><td>Software Code</td><td>Software</td><td>License???</td><td>Licence_Number</td>
</tr>


<%@ page import="java.sql.*" %>

<%

   
    Connection conn = null;
    String tno=request.getParameter("tno");
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement pst= conn.prepareStatement("select a.tno,a.swno,h.swname,h.license,nvl(h.licenseno,'not_required')licenseno from TICKETSW a INNER JOIN SWLIST h on h.SWNO = a.SWNO and a.TNO=?");
        pst.setString(1,tno);
        pst.executeQuery();
        
        ResultSet rs=pst.executeQuery();
        
        while(rs.next())
        {
        	//tno=rs.getString("TNO");
        %>	
       <tr>
       <td><% out.println(tno);%></td>
       <td><% out.println(rs.getString("swno"));%></td>
       <td><% out.println(rs.getString("swname"));%></td>
       <td><% out.println(rs.getString("license"));%></td>
       <td><% out.println(rs.getString("licenseno"));%></td>
       
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
<center>
<form action="closetkt.jsp">
<input type="hidden" name="tno" value=<%=tno%>>
<input type="submit" value="Close Ticket">
</form>
</center>
</body>
</html>