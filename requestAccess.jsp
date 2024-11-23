<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<style>
a{
text-decoration:none;
}</style>
<body><center>
<h1>User Access Management System</h1>
<br>
    <h2>Request Access</h2>
    <form action="RequestServlet" method="POST">
        Software Name: 
        <select name="softwareId" required>
            <option value="1">Microsoft Office</option>
            <option value="2">Adobe Photoshop</option>
            <option value="3">Slack</option>
            <option value="4">Zoom</option>
            <option value="5">Jira</option>
            <option value="6">GitHub</option>
        </select><br><br>

        Access Type: 
        <select name="accessType" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>

        Reason: 
        <textarea name="reason" required></textarea><br><br>

        <button type="submit">Submit Request</button>
        
        <br>
        <br>
        <a href="createSoftware.jsp">Create SoftWare</a>
    </form>
</center></body>
</html>
