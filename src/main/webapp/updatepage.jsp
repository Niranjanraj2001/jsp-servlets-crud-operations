<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdatePage</title>
<style>
body{
background-image: linear-gradient(-225deg, #5D9FFF 0%, #B8DCFF 48%, #6BBBFF 100%);
background-repeat: no-repeat;
 background-attachment: fixed;
  background-position: center;
}

 form{
 background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
 padding: 25px;
 width: 990px;
 margin-top: 3%;
 margin-left: 15%;
 }
 
 input{
 height: 30px;
 width: 200px;
 
 }

td,th{
padding: 15px;
border: 2px solid black;

}

table{
border-collapse: collapse;
}

.submit{
background-image: linear-gradient(to top, #37ecba 0%, #72afd3 100%);
}

</style>

</head>
<body>



<%
String sno = request.getParameter("sno");
//session.setAttribute("id",sno); 
 
	//String sno = (String) session.getAttribute("id");


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
	<h1 align="center">Update Page</h1>
		<table>
		
			<tr>
				<th></th>
				<th>Username</th>
				<th>Password</th>
				<th>Mobile</th>
				<th></th>
			</tr>
			
			<tr>
				<td><input type="hidden" value="<%=Serialno %>" name="sno"></td>
				<td><input type="text" value="<%=uname %>" name="uname"></td>
				<td><input type="text" value="<%=pass %>" name="pass"></td>
				<td><input type="text" value="<%=mobile %>" name="mobile"></td>
				<td><input type="submit" value="Update" class="submit" ></td>
							
			</tr>
			
		
		</table>
			
	</form>		
		
<% 	
	}
	

}

 %>

</body>
</html>