package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;


@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			String uname = request.getParameter("username");	
			String pass = request.getParameter("password");
			String mobile = request.getParameter("mobile");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
			java.sql.Statement stmt =  con.createStatement();
			
			int value = ((java.sql.Statement) stmt).executeUpdate("insert into register (username,password,mobile) values ('"+uname+"','"+pass+"','"+mobile+"') ");
			
			if(value == 1) {
			out.println("insert successfully");
//			System.out.println("insert successfully ");
		}else {
			out.println("not insert");
//			System.out.println("not insert");
		}
		}catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException e) {
			System.out.println(e);
		}

}
}
