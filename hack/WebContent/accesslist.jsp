<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Please select the related and essential Access Grant request</h1>
<form action="accsubmit.jsp">
<%@ page import="java.sql.*" %>


<%
   String pid=session.getAttribute("pid").toString();
   Connection conn = null;
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement st= conn.prepareStatement("select * from serviceaccess where projid=?");
        st.setString(1, pid);
        ResultSet rs=st.executeQuery();
        
        while(rs.next())
        {
        	String srvid=rs.getString("serviceid");
        	String srvname=rs.getString("servicename");
        	String empl=rs.getString("empid");
        	
        	System.out.println(empl);
       
        %>
     <input type="checkbox" name="service" value="<%=srvid%>"><%out.println(srvname+"         TO be Approved By :  "+empl);      out.println("<br>");      
    
     %>       
        <%  }
     conn.close();   
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>

<input type="submit" value="Generate Access Request">

</form>

</body>
</html>