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

<%

String sno = request.getParameter("sno");
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
String mobile = request.getParameter("mobile");



Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
java.sql.Statement stmt =  con.createStatement();

int value = stmt.executeUpdate("update register set username='"+uname+"' , password = '"+pass+"' , mobile = '"+mobile+"' where s_no='"+sno+"'");

if(value == 1){
	
	response.sendRedirect("AdminView.jsp");
}

%>

</body>
</html>