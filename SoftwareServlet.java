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
 * Servlet implementation class SoftwareServlet
 */
public class SoftwareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SoftwareServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String softwareName = request.getParameter("softwareName");
	        String description = request.getParameter("description");
	        String accessLevels = request.getParameter("accessLevels");
	        PrintWriter out=response.getWriter();
	        try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        try {
	        	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMSP", "postgres", "saiteja");
			         String sql = "INSERT INTO software(name, description, access_levels) VALUES (?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, softwareName);
	            stmt.setString(2, description);
	            stmt.setString(3, accessLevels);
	            int i=stmt.executeUpdate();
	            if(i>=1)
	            out.println("Data Inserted");
	            else
	            	out.println("Not Inserted");
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("createSoftware.jsp");	
	
	}

}
