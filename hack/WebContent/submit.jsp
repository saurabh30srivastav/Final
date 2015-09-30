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
     String eid=request.getParameter("eid");
     String pid=request.getParameter("pid");
     String doj=request.getParameter("doj");
     String wks=request.getParameter("wks");
     String tcno="";
    session.setAttribute("newemp", eid);
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement st= conn.prepareStatement("select nvl(max(tno),0)as tno from ticket ");
        
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
        	tcno=rs.getString("tno");
        	tcno=(Integer.parseInt(tcno)+1)+"";
        }
        
        st=conn.prepareStatement("insert into ticket(tno,empno,projid,mgrid,wksno,doj) values(?,?,?,?,?,?)");
        st.setString(1,tcno);
        st.setString(2,eid);
        st.setString(3,pid);
        st.setString(4,session.getAttribute("empid").toString());
        st.setString(5,wks);
        st.setString(6,doj);
        st.executeUpdate();
        session.setAttribute("tno", tcno);
        session.setAttribute("pid", pid);
        response.sendRedirect("swlist.jsp");
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>



</body>
</html>