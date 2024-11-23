<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<style>
a{
text-decoration:none;
}</style>
</head>
<body>
<center>
<h1>User Access Management System</h1>
<br>
<h2>Create an Account/Signup</h2>
    <form action="SignUpServlet" method="post">
        <label>Username: </label><input type="text" name="username"><br>
        <br>
        <label>Password: </label><input type="password" name="password"><br>
        <br>
        <input type="submit" value="Sign Up">
    </form>
     <br>
        <br>
        <a href="login.jsp">Already having Account.Login!!</a>
    </center>
</body>
</html>
