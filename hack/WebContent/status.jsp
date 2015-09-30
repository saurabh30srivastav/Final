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
   String svid=request.getParameter("svid");
   String empreq=request.getParameter("empreq");
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement pst= conn.prepareStatement("update servicesubmit set status='Done' where empreq=? and serviceid=?");
        pst.setString(1,session.getAttribute("empid").toString());
        pst.setString(1,empreq);
        pst.setString(2,svid);
     pst.executeUpdate();
       
        conn.close();       
    response.sendRedirect("process.jsp");
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>
</body>
</html>