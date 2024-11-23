<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <form action="ApprovalServlet" method="POST">
        <%
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UAMSP", "postgres", "saiteja");
            String sql = "SELECT r.id, u.username, s.name, r.access_type, r.reason " +
                         "FROM requests r " +
                         "JOIN users u ON r.user_id = u.empid " +
                         "JOIN software s ON r.software_id = s.id " +
                         "WHERE r.status = 'Pending'";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    int requestId = rs.getInt("id");
                    out.println("<div>");
                    out.println("Employee: " + rs.getString("username") + "<br>");
                    out.println("Software: " + rs.getString("name") + "<br>");
                    out.println("Access Type: " + rs.getString("access_type") + "<br>");
                    out.println("Reason: " + rs.getString("reason") + "<br>");
                    out.println("<input type='radio' name='status_" + requestId + "' value='Approved'> Approve");
                    out.println("<input type='radio' name='status_" + requestId + "' value='Rejected'> Reject");
                    out.println("</div><br>");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<p>Error: Unable to load database driver.</p>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<p>Error: Unable to connect to the database.</p>");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
        <button type="submit">Submit Decisions</button>
    </form>
</body>
</html>
