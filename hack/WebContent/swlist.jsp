<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Please select the related and essential softwares</h1>
<form action="swsubmit.jsp">
<%@ page import="java.sql.*" %>


<%
   String pid=session.getAttribute("pid").toString();
   Connection conn = null;
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement st= conn.prepareStatement("select b.swno,b.swname,b.license from swlist b inner join swproj a on a.swno=b.swno and  a.projid=?");
        st.setString(1, pid);
        ResultSet rs=st.executeQuery();
        
        while(rs.next())
        {
        	String swno=rs.getString("swno");
        	String sname=rs.getString("swname");
        	String lic=rs.getString("license");
       
        %>
     <input type="checkbox" name="soft" value="<%=swno%>"><%out.println(sname+"         LICENSE=  "+lic);      out.println("<br>");      
     %>       
        <%  }
        conn.close();
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>

<input type="submit" value="Create Ticket">

</form>

</body>
</html>