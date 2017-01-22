<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#formulario {
	width: 400px;
}

body {
	background-color: #646367;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wiki - EtakemonGO</title>
</head>
<body>

<h1 id="h" ></h1>
<form action="" method="get" id="myForm">
  First name:<br>
  <input type="text" name="firstname" id="asd" value="">
  <br>
  Last name:<br>
  <input type="text" name="lastname" value="Mouse">
  <br><br>
  <input type="submit" id="btn" value="Submit">
</form> 

<script>
document.getElementById("myForm").addEventListener("submit",function(e){ 
    e.preventDefault(); 
	myFunction(e);
		});

function myFunction(e) {
    e.preventDefault(); 
    <%request.setAttribute("data", request.getParameter("firstname")); %>
	$("#h").append("<%= request.getAttribute("data") %> HOLA");
	alert("<%= request.getAttribute("data") %> HOLA");
    
}
</script>

</body>
</html>