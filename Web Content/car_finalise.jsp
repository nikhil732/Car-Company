<!DOCTYPE html>
<html>
<head>
<title>
Car Company</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Welcome">
<style>
body {background-color:#c0dff7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(user.jpg);background-size: cover;}
h3{font-family:Verdana, sans-serif;font-size:20px;color:#0EC6B9;}
h2{font-family:Verdana, sans-serif;font-size:20px;color:#C60EB8;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:20px;color: #000000; background-color: #B22222; padding: 10px; border-radius: 4px;}
table{column-gap: 20px;padding: 10px;bordercolor: #B0C60E;}
</style>
<script type="text/javascript">
	function wishlist(d_name)
	{
		document.write("Function called<br>");
		var checkbox=document.getElementById("\""+d_name+"\"");
		if(checkbox.checked == true){
			document.write("it is checked<br>");
		}
		else
			document.write("it is notchecked<br>");
	}
</script>

</head>
<body>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
<%
String d_name="";
String sel = request.getParameter("select_brand");
String sel1=request.getParameter("select_transmission");
//System.out.println("nrad"+sel);
//System.out.println("tr"+sel1);
   Statement stmt=null;
ResultSet rs=null;
try
{
   Class.forName(JDBC_DRIVER);
   con=DriverManager.getConnection(DB_URL,USER,PASS);
   stmt=con.createStatement();
String b_name=(String)session.getAttribute("b_name");
//System.out.println(b_name);
String m_name=(String)session.getAttribute("m_name");
String b_type=(String)session.getAttribute("b_type");
String c_name=(String)session.getAttribute("c_name");
String e_type=(String)session.getAttribute("e_type");
String t_type=(String)session.getAttribute("t_type");
Statement ps1=con.createStatement();
String query =" select dealer_name,model_price,VIN from inventory natural join vehicle natural join options natural join models natural join dealer where brand_name='"+b_name+"' and model_name ='"+m_name+"' and body_type='"+b_type+"' and color_name='"+c_name+"' and engine_type='"+e_type+"' and transmission_type='"+t_type+"';";
//out.println(query);
/*//ps1.setString(2,m_name);
ps1.setString(3,b_type);
ps1.setString(4,c_name);
ps1.setString(5,e_type);
ps1.setString(2,sel1);*/
rs=ps1.executeQuery(query);
//System.out.println("HHH"+sel);
//rs=stmt.executeQuery(sql);
 //String sql="select distinct dealer_id from inventory natural join vehicle natural join options natural join models where brand_name=b_name and model_name="730d 8AT" and color_name="red" and body_type="Sedan" and engine_type="Diesel" and transmission_type="Automatic";";
   %>
   
	<table>
		<tr>
			<th><h3 name="brand">Brand: &nbsp; <%out.print(b_name);  %></h3></th>
			<th><h3 name="model"> &nbsp; Model: <%out.print(m_name);  %></h3></th>
			<th><h3 name="color"> &nbsp; Color: <%out.print(c_name);  %></h3></th>
			<th><h3 name="body_type">&nbsp; Body-Type: <%out.print(b_type);  %></h3></th>
			<th><h3 name="engine">&nbsp; Engine: <%out.print(e_type);  %></h3></th>
			<th><h3 name="transmission">&nbsp; Transmission: <%out.print(t_type);  %></h3></th>
		</tr>
	</table>
	
<center>
	<table border="2" cellpadding="20" bordercolor= "#B0C60E";>
		<tr bordercolor= "#B0C60E";>
			<th bordercolor= "#B0C60E";><h2>Dealer Name: </h2></th>
			<th bordercolor= "#B0C60E";><h2>VIN: </h2></th> 
			<th bordercolor= "#B0C60E";><h2>Price: </h2></th>
		</tr>
			<%
//out.println("Dealer Name\tPrice\tBuy");
while(rs.next()){
	 d_name=rs.getString("dealer_name");
	 session.putValue("d_name",d_name);
	int m=rs.getInt("model_price");
	session.putValue("model_price",m);
	int v=rs.getInt("VIN");
	session.putValue("vin",v);
	//out.println("<h2>"+d_name+"&nbsp;"+m+"&nbsp;<input type=\"checkbox\" name=\"checkbox\" padding=\"100px\" value=\"Bike\"> </h2>");
	out.println("<tr>");
	out.println("<th><h3>"+d_name+"</h3></th>");
	out.println("<th><h3>"+v+"</h3></th>");
	out.println("<th><h3>"+m+"</h3></th>");
	out.println("</tr>");
	
	
	//System.out.println(d_name);
	
	//out.println(m);
}
%>

	</table>


<center>
	<br>
	<form action="wishlist.jsp">
	<input type="submit" value="Add to WishList"/>
</center>
<%}catch(Exception e)
		{
			//e.printStackTrace();
			out.println(e);
		}
		finally
		{
			try{
			stmt.close();
			con.close();
			}catch(Exception e)
			{
				//e.printStackTrace();
				out.println(e);
			}
		}
%>
</body>
</html>
