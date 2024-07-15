package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");

		
		try(PrintWriter out = response.getWriter()){
			
			String username = request.getParameter("uname");
			String password = request.getParameter("pwd");
			
			if("admin".equals(username) && "admin@123".equals(password)) {
//				out.println("Welcome Admin");
				response.sendRedirect("AdminView.jsp");
				
			}else {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
				java.sql.Statement stmt =  con.createStatement();
				
				ResultSet res = ((java.sql.Statement) stmt).executeQuery("select * from register");
				
				int flag =0;
				
				while(res.next()) {
					String uname = res.getString("username");
					String pass = res.getString("password");
					
					if(username.equals(uname) && password.equals(pass)) {
						out.println("Welcome User");
						flag=1;
						
						RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
						rd.forward(request, response);
					}
				}
				
				if(flag == 0) {
					out.println("sorry username and password incorrect");
					
					RequestDispatcher rd = request.getRequestDispatcher("login.html");
					rd.include(request, response);
				}
				
				
				
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
