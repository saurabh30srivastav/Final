<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="logout.jsp"> LogOut</a>
<form action="submit.jsp">
New Employee ID:<input type="text" name="eid" placeholder="enter employee id">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Project ID: <input type="text" name="pid" placeholder="project id">
<br>
<br>
<br>
Date of Joining team:<input type="text" name="doj" placeholder="DD-MON-YY">
&nbsp;&nbsp;&nbsp; Workstation:<input type="text" name="wks" placeholder="WKS Number">
<br>
<input type="submit" value="proceed">
</form>
</body>
</html>