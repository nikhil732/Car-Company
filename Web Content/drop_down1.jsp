<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Sign In">
<style>
body {background-color:#c0dff7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(info.jpg);background-size: cover;}
h1{font-family:Verdana, sans-serif;font-size:20px;color:#C6C30E;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:20px;color: #000000; background-color: #B22222; padding: 8px; border-radius: 4px; }

</style>
</head>
<body>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
   <%
//String sel = request.getParameter("select_brand");
   String sel1 = request.getParameter("select_model");
  // System.out.println(sel1);
	 Statement stmt = null;
	 //ResultSet rs=null;
	 ResultSet rs1=null;
	 try
		{
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		   session.putValue("m_name",sel1);
		  // PreparedStatement ps=con.prepareStatement("select distinct model_name  from vehicle natural join models where brand_name=?");
		   //ps.setString(1,sel);
		    //rs=ps.executeQuery();
		   Statement ps1=con.createStatement();
		   String query = "select distinct body_type  from  models where model_name='"+sel1+"';";
			 //out.println(query);
			    rs1=ps1.executeQuery(query);
			   // System.out.println(sel1);
		    out.println("<h1>The body type for your selected model is/are :  " + "</h1><br>");
		    String b_type;
		    while(rs1.next())
			{
		 b_type=rs1.getString("body_type");
			System.out.println(b_type);
			out.println("<h1>"+b_type +"</h1><br>");				//session.putValue("model_id",m_id);
				
				
				//response.sendRedirect("choose_car.jsp");
			}
		   
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try{
			rs1.close();
			stmt.close();
			con.close();
			}catch(Exception e){}
		}
   %>
   <form action=choose_car2.jsp method="post"><center>
   <input type="submit" value="Go Back"/></form></center></form></body>
   </html>