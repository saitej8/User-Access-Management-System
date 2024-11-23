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
<h2>Create New Software</h2>
    <form action="SoftwareServlet" method="post">
        <label>Software Name: </label><input type="text" name="softwareName"><br><br>
        <label>Description: </label><textarea name="description"></textarea><br><br>
        <label>Access Levels: </label><input type="checkbox" name="accessLevels" value="Read"> Read
        <input type="checkbox" name="accessLevels" value="Write"> Write
        <input type="checkbox" name="accessLevels" value="Admin"> Admin<br><br>
        <input type="submit" id="button" onclick="submit()" value="Create Software">
        <br>
        <br>
         <a href="requestAccess.jsp">Request Acces</a>
    </form>
    </center>
    <script>
   let d=document.getElementById("button");
   function submit()
   {
	   doucment.write("Software Created Successfully");
	   alert("Software Created Successfully");
   }
    </script>
</body>
</html>
