<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">

h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 30px;
  padding: 40px 40px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}
h1.elegantshadow {
  color: #131313;
  background-color: #e7e5e4;
  letter-spacing: .15em;
  text-shadow: 1px -1px 0 #767676, -1px 2px 1px #737272, -2px 4px 1px #767474, -3px 6px 1px #787777, -4px 8px 1px #7b7a7a, -5px 10px 1px #7f7d7d, -6px 12px 1px #828181, -7px 14px 1px #868585, -8px 16px 1px #8b8a89, -9px 18px 1px #8f8e8d, -10px 20px 1px #949392, -11px 22px 1px #999897, -12px 24px 1px #9e9c9c, -13px 26px 1px #a3a1a1, -14px 28px 1px #a8a6a6, -15px 30px 1px #adabab, -16px 32px 1px #b2b1b0, -17px 34px 1px #b7b6b5, -18px 36px 1px #bcbbba, -19px 38px 1px #c1bfbf, -20px 40px 1px #c6c4c4, -21px 42px 1px #cbc9c8, -22px 44px 1px #cfcdcd, -23px 46px 1px #d4d2d1, -24px 48px 1px #d8d6d5, -25px 50px 1px #dbdad9, -26px 52px 1px #dfdddc, -27px 54px 1px #e2e0df, -28px 56px 1px #e4e3e2;
}


</style>
</head>

<%@ page import="java.sql.*" %>


<%

   
    Connection conn = null;String user="";
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement pst= conn.prepareStatement("select * from hemp where empid=?");
        pst.setString(1,session.getAttribute("empid").toString());
        ResultSet rs=pst.executeQuery();
        rs.next();
        user=rs.getString("empname");
        
        conn.close();       
    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>


<body>
<a href="logout.jsp"> LogOut</a>
<h1 class='elegantshadow'> WELCOME <%out.println(user); %></h1>
<br><br>
<br>


<center><form action="report.jsp">
<input type="submit" value="Access and Ticket Status">
</form>

<br><br>
<form action="process.jsp">
<input type="submit" value=" Requests Process Tool">
</form>

</center>
