package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out = response.getWriter()){
	        
			String id=request.getParameter("sno");  
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newuser", "root", "1234");
			java.sql.Statement stmt =  con.createStatement();

			int value = stmt.executeUpdate("delete from register where s_no = '"+id+"';");

			if(value == 1){
				out.println("Deleted Successfully");
			}
			else{
				out.println("Sorry");
			}
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
	
	}

}
