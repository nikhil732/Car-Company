<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Register yourself">
<style>
body {background-color:#c0dff7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(user.jpg);background-size: cover;}
h1{font-family:Verdana, sans-serif;font-size:50px;color:#A63206;}
h2{font-family:Verdana, sans-serif;font-size:25px;color:#06A60A;}
h3{font-family:Verdana, sans-serif;font-size:25px;color:#443EDE;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#FFFFFF;}
button{font-size:30px;}
</style>
</head>
<body>
<center>
<h1>Customer Registration</h1>
<form action="redirect3.jsp" method="post">
<h2>NAME: <input type="text" name="name"><br></h2>
<h2>GENDER:  <input type="text" name="gender"><br></h2>
<h2>PHONE: <input type="text" name="phone"><br></h2>
<h2>INCOME: <input type="text" name="income"><br></h2>
<h2>D.O.B: <input type="text" name="dob"><br></h2>
<h2>Address:<pre>City:  <input type="text" name="city"> State: <input type="text" name="state"><br></h2>
	<pre> <pre><input type="submit" value="Proceed!"/></form> 
	</center>
<p></p>
</body>
</html>