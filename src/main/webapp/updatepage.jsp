<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Update Page</h1>

<%
String sno = request.getParameter("sno");
//session.setAttribute("id",sno); 

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
java.sql.Statement stmt =  con.createStatement();

ResultSet res = stmt.executeQuery("Select * from register");

while(res.next()){
	String Serialno = res.getString("s_no");
	String uname = res.getString("username");
	String pass= res.getString("password");
	String mobile = res.getString("mobile");
	
	if(sno.equals(Serialno)){
%>
	<form action="updated.jsp">
		<table>
			<tr>
				<th></th>
				<th>Username</th>
				<th>Password</th>
				<th>Mobile</th>
			</tr>
			
			<tr>
				<td><input type="hidden" value="<%=Serialno %>" name="sno"></td>
				<td><input type="text" value="<%=uname %>" name="uname"></td>
				<td><input type="text" value="<%=pass %>" name="pass"></td>
				<td><input type="text" value="<%=mobile %>" name="mobile"></td>
				<td><input type="submit" value="Update" ></td>
							
			</tr>
			
		
		</table>
			
	</form>		
		
<% 	
	}
	

}

 %>

</body>
</html>