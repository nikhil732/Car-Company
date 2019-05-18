<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
   <%
   Statement stmt=null;
   ResultSet rs=null;
		try
		{
		   Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		    
		   		//out.println(extra_filter);
        String sql="SELECT * FROM `inventory` natural join `dealer` where car_status='unsold';";
        rs=stmt.executeQuery(sql);
        //out.println("Query: "+sql+"<br>");
        out.println("<center><h2>VIN"+"----"+"get_date"+"----"+"sale_date"+"----"+"car_status"+"----"+"dealer_name"+"----"+"dealer_location</h2></center>"+"");
        while(rs.next())
        {
				out.println("<center><h3>"+rs.getString("VIN")+"------"+rs.getString("get_date")+"------"+rs.getString("sale_date")+"------"+rs.getString("car_status")+"------"+rs.getString("dealer_name")+"------"+rs.getString("dealer_location")+"</h3><br></center>");
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
<center>
<form action="index.jsp" mothod="post">
<input type="submit" value="Log Out"/>
</center>
</form>
</body>
</html>