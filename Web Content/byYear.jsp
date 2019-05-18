<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
   <%
   Statement stmt=null;
   ResultSet rs=null;
   String from_year = request.getParameter("from_year");
   String to_year = request.getParameter("to_year");
   String brand = request.getParameter("brand");
   String dealer = request.getParameter("dealer");
   String body_type = request.getParameter("body_type");
   String engine_type = request.getParameter("engine_type");
   String transmission = request.getParameter("transmission");
  // out.println(brand+dealer+body_type+engine_type+transmission+".<br>");
   //out.println(from_month+" "+to_month);
		try
		{
		   Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		    String extra_filter ="";
		   		extra_filter=" and brand_name='"+brand+"'";
		   		extra_filter+=" and dealer_id="+dealer;
		   		extra_filter+=" and body_type='"+body_type+"'";
		   		extra_filter+=" and engine_type='"+engine_type+"'";
		   		extra_filter+=" and transmission_type='"+transmission+"'";
		   		//out.println(extra_filter);
        String sql="SELECT * FROM `sales` natural join vehicle natural join models natural join options where year(sale_date)>="+from_year+" and year(sale_date)<="+to_year+" "+extra_filter+";";
        rs=stmt.executeQuery(sql);
        out.println("<center><h2>sale_id"+"----"+"sale_date"+"----"+"sale_price</h2></center>"+"");
        while(rs.next())
			{
			String sale_date=rs.getString("sale_date");
			String sale_id=rs.getString("sale_id");
			String sale_price=rs.getString("sale_price");
				//session.putValue("Name",name);
				out.println("<center><h3>"+sale_id+"------"+sale_date+"------"+sale_price+"</h3><br></center>");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try{
			rs.close();
			stmt.close();
			con.close();
			}catch(Exception e){}
		}
        
  %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>By Year</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Sign In">
<style>
body {background-color:#c098f7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(admin1.jpg);background-size: cover;}
h1{font-family:Verdana, sans-serif;font-size:90px;color:#443EDE;}
h2{font-family:Verdana, sans-serif;font-size:25px;color:#8506A6;}
h3{font-family:Verdana, sans-serif;font-size:25px;color:#443EDE;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:20px;color: #000000; background-color: #BB9F22; padding: 10px; border-radius: 4px;}
</style>
<script language="javascript">
	function logout(){
		window.document.replace("");
	}
</script>
</head>
<body>
<br>
<center>
<form action="index.jsp" mothod="post">
<input type="submit" value="Log Out"/>
</center>
</form>
</body>
</html>