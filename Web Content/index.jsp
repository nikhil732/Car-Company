<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Car Company</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Welcome">
<style>
body {background-color:#c0dff7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(car.jpg);background-size: cover;}
h1{font-family:Verdana, sans-serif;font-size:50px;color:#E91919;}
h2{font-family:Verdana, sans-serif;font-size:30px;color:#F9F900;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:45px;color: #ABDA13; background-color: #B22222; padding: 14px; border-radius: 40px;}

</style>
</head>
<body>
<center>
<h1>NIKHIL's CAR ENTERPRISES</h1>
<marquee style="font-size: 50px; color: #F900D3;">WORLD's LUXURIOUS CARS</marquee>

<br><br>
<form action="proc.jsp" method="post">
<p><h2>Explore Cars  <input type="radio" style="width:40px; height:40px; " value="0" name="type"/></h2></p>
<br><br>
<p><h2>Analyze Sales  <input type="radio" style="width:40px; height:40px; " value="1" name="type"/></h2></p><br><br>
	<input type="submit" value="Proceed"/></form></center>
	
</body>
</html>