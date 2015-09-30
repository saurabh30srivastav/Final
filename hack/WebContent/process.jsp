<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<table border="2" align="center">
<tr>
<td>Request_ID</td><td>Request_Date</td><td>Onboarding_EmpID</td><td>Action</td>
</tr>


<%

   
    Connection conn = null;
    String empid=session.getAttribute("empid").toString();
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement pst= conn.prepareStatement("select * from servicesubmit where emplid=? and status='Pending'");
        pst.setString(1,empid);
        ResultSet rs=pst.executeQuery();
        
     while(rs.next())
     {
    	String svid=rs.getString("serviceid");
  
    	String empreq=rs.getString("empreq");
    	
     %>
       
     <tr>  
       <td><%out.println(svid); %></td>
        <td><%out.println(rs.getString("submitdate")); %></td> 
        <td><%out.println(empreq); %>    </td>
       <td>
       
       <form action="status.jsp">
       <input type="hidden" name="empreq" value=<%=empreq%>>
       <input type="hidden" name="svid" value=<%=svid%>>
       <input type="submit" value="Request Processed">
       </form>
       
       
       </td>
       </tr>  	 
    <% 	 
     }
        
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