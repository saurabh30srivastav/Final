<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.sql.*" %>


<%

    String user=request.getParameter("Username");
    String pass=request.getParameter("Password");
    String pwd="";String role="";
    Connection conn = null;
   
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Ram", "Ram");
        PreparedStatement st= conn.prepareStatement("select pswd,erole from hemp where empid=?");
        st.setString(1,user);
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
       pwd=rs.getString("PSWD");
       role=rs.getString("erole");
       session.setAttribute("role",role);
      
        }
        
        if(pwd.equals(pass))
        {
        	System.out.println("valid user");
        	session.setAttribute("empid", user);
        	if(role.equals("M"))
            {response.sendRedirect("welcome.jsp");    
            }
        	
        	if(role.equals("E"))
            {response.sendRedirect("Ewelcome.jsp");    
            }
        	
        	if(role.equals("IT"))
            {response.sendRedirect("Iwelcome.jsp");    
            }
            conn.close();
        }
        else
        {
        	out.println("Invalid USERID and PASSWORD");
            conn.close();
            response.sendRedirect("index.jsp");
        }

    }

    catch(Exception e)
    {
        out.println("Exception : " + e.getMessage() + "");
    }


%>
