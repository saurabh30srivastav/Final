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


<%

    Connection conn = null;
  String tno=session.getAttribute("tno").toString();
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement st= conn.prepareStatement("insert into ticketsw values(?,?) ");
     

String []sw=request.getParameterValues("soft");

for(String s: sw)
{
	st.setString(1, tno);
	st.setString(2, s);
	
	st.executeUpdate();
}

conn.close();

   response.sendRedirect("accesslist.jsp");     
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>



</body>
</html>