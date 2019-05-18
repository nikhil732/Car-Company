<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Company</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Welcome">
<style>
body {background-color:#c0dff7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(user.jpg);background-size: cover;}
h2{font-family:Verdana, sans-serif;font-size:25px;color:#A63206;}
h3{font-family:Verdana, sans-serif;font-size:25px;color:#C6C30E;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:20px;color: #000000; background-color: #B22222; padding: 10px; border-radius: 4px;}

</style>
<script type="text/javascript">
function hideall1(){
		
document.getElementById("brand").style.display = "none";
document.getElementById("model").style.display = "none";
document.getElementById("body_type").style.display = "none";
document.getElementById("color").style.display = "none";
document.getElementById("engine").style.display = "block";
document.getElementById("transmission").style.display = "none";
}
</script>
</head>
<body>
<left><h3 name="id">Your Customer ID: </h3>
<%
int id=(Integer)session.getAttribute("customer_id"); 
out.print("<h3>"+id+"</h3>"); %></left>
<center>
<form action="drop_down4.jsp">
	<h2>Select Brand: <select id="brand"  name="select_brand">
		<option  value="7 Series">7 Series</option>
		<option  value="1 Series" >1 Series</option>
		<option  value="i8" >i8</option>
		<option  value="X4" >X4</option>
	</select><br></h2>
	
	<h2>Select Model: <select id="model" name="select_model">
		<option value=" 730d 8AT" selected>730d 8AT</option>
		<option value="745e 8MT" >745e 8MT</option>
		<option value="750i xDrive 8AT" > 750i xDrive 8AT</option>
		<option value="1.5 6AT" > 1.5 6AT</option>
		<option value="2.5 8MT" >2.5 8MT</option>
		<option value="M40 8AT" >M40 8AT</option>
		<option value="xDrive20i 8AT" >xDrive20i 8AT</option>
		<option value="116d 6MT" >116d 6MT</option>
		<option value="120i 8AT" >120i 8AT</option>
	</select><br></h2>
	<h2>Select Body Type: <select id="body_type"  name="select_body_type">
		<option value="Sedan" selected>Sedan</option>
		<option value="Coupe" >Coupe</option>
		<option value="SUV" >SUV</option>
		<option value="Hatchback" > Hatchback</option>
	</select><br></h2>
	<h2>Select Color: <select id="color"  name="select_color">
		<option value="red" selected>Red</option>
		<option value="black" >Black</option>
		<option value="white" >White</option>
		<option value="yellow" >Yellow</option>
		<option value="orange" >Orange</option>
	</select><br></h2>
	<h2>Select Engine: <select id="engine" onclick="hideall1()" name="select_engine">
		<option value="Petrol" selected>Petrol</option>
		<option value="Diesel" >Diesel</option>
		<option value="Hybrid" >Hybrid</option>
	</select><br></h2>
	<h2>Select Transmission: <select id="transmission" name="select_transmission">
		<option value="Automatic" selected>Automatic</option>
		<option value="Manual" >Manual</option>
	</select><br></h2>
	<input type="submit" Value="Car Enquiry"/></form>
	
</center>
</body>
</html>