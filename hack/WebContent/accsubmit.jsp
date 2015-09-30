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
        PreparedStatement st= conn.prepareStatement("insert into servicesubmit(serviceid,empreq,emplid) values(?,?,?) ");
        PreparedStatement pst;

String []sw=request.getParameterValues("service"); String empl="";

for(String s: sw)
{
	st.setString(1, s);
	st.setString(2, session.getAttribute("newemp").toString());
	
	pst=conn.prepareStatement("select empid from serviceaccess where projid=? and serviceid=?");
	pst.setString(1,session.getAttribute("pid").toString());
	pst.setString(2,s);
	ResultSet rs1=pst.executeQuery();
	while(rs1.next())
	{
	empl=rs1.getString("empid");
	System.out.println("value="+empl);
	}
	st.setString(3, empl);
	st.executeUpdate();
}
conn.close();

   response.sendRedirect("welcome.jsp");     
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>



</body>
</html>