<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
a{
text-decoration:none;
}</style>

</head>
<body>
<center>
<h1>User Access Management System</h1>
<br>
<h2>Login/Signin</h2>
    <form action="LoginServlet" method="post">
        <label>Username: </label><input type="text" name="username"><br>
        <br>
        
        <label>Password: </label><input type="password" name="password"><br>
        <br>
        <input type="submit" value="Login">
        
        <br>
        <br>
        <a href="signup.jsp">Creat Account!!</a>
    </form>
    </center>
</body>
</html>
