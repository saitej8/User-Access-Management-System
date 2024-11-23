package zp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter(); 
		String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String role = "Employee"; // Default role
	        try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	        
	        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMSP", "postgres", "saiteja")) {
	            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
	            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	                stmt.setString(1, username);
	                stmt.setString(2, password);
	                stmt.setString(3, role);
	               int i=stmt.executeUpdate();
	               if(i>=1)
	            	   out.println("Congratulations! "+username+" Account is creared");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().write("Error during sign-up."+e);
	            return;
	        }
	        response.sendRedirect("login.jsp");	
	        
	}

}
