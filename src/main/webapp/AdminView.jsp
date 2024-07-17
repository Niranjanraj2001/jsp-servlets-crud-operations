<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin View</title>
<style type="text/css">
td,th{
padding: 10px;

border: 2px solid black;

}

body{
background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
background-repeat: no-repeat;
 background-attachment: fixed;
  background-position: center;
}

table{
border: 2px solid black;
background-image: linear-gradient(to top, #ebc0fd 0%, #d9ded8 100%);
 border-collapse: collapse;
}

</style>
</head>
<body>

<table align="center">
<tr>
	<th>s.no</th>
    <th>username</th>
    <th>password</th>
    <th>mobile</th>
    <th></th>
    <th></th>
    

</tr>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
	java.sql.Statement stmt =  con.createStatement();
	
	ResultSet res = stmt.executeQuery("select * from register");
	
	while(res.next()){
		String sno1 = res.getString("s_no"); 
		String username = res.getString("username");
		String password = res.getString("password");
		String mobile = res.getString("mobile");
		
		//session.setAttribute("id",sno1);
		
	
%>

	<tr>
	
	<td><%=sno1 %></td>
	<td><%=username %></td>	
	<td><%=password %></td>
	<td><%=mobile %></td>
	<td><a href="updatepage.jsp?sno=<%=sno1 %>" >Edit</a></td>
	<td><a href="Delete?sno=<%=sno1 %>">Delete</a></td>
	
	</tr>
	
	
	

<%}%>


</table>




</body>
</html>