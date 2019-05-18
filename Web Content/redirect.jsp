<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
   <%
	 Statement stmt = null;
	 ResultSet rs=null;
	 String un=request.getParameter("usr");
	 String pass=request.getParameter("pwd");
	//out.println(un + " " + pass + " " );
		try
		{
		  // Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		   //out.println(1);
		   String sql="SELECT * FROM `admins` where `un` = '"+ un +"' and `pass` = " + pass;
		    rs=stmt.executeQuery(sql);
		    
			if(rs.next())
			{
			String name=rs.getString("un");
			String password=rs.getString("pass");
				session.putValue("Name",name);
				response.sendRedirect("sales_report.jsp");
			}
			else
				out.println("Invalid Entry");
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