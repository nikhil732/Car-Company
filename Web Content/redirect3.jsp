<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
   <%!String DB_URL = "jdbc:mysql://localhost/dbmsproject";%>
   <%!String USER = "root";%>
   <%!String PASS = "password";%>
   <%!Connection con = null;%>
   <%
	 Statement stmt = null;
	 ResultSet rs=null;
	 PreparedStatement pstmt = null;
	   ResultSet rs1=null;
	   PreparedStatement pstmt1 = null;
	   ResultSet rs2=null;
	 String name=request.getParameter("name");
	 String gender=request.getParameter("gender");
	 String phone= request.getParameter("phone");
	 String income= request.getParameter("income");
	 String dob= request.getParameter("dob");
	 //System.out.println(income);
	 String city=request.getParameter("city");
	 String state= request.getParameter("state");
	 
	//out.println(un + " " + pass + " " );
		try
		{
		  // Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   String sqlm="select max(customer_id) from customers";
		   pstmt1 = con.prepareStatement(sqlm);
		   PreparedStatement ps=con.prepareStatement("select customer_id from customers where c_name=? and c_gender=? and c_phone=? and c_income=? and c_address_city=?");
		   ps.setString(1,name);
		   ps.setString(2,gender);
		   ps.setString(3,phone);
		   ps.setString(4,income);
		   ps.setString(5,city);
		   rs=ps.executeQuery();
		    rs1=pstmt1.executeQuery();
		    int count=0;
		    if(rs1.next())
		    {
		    	count=rs1.getInt("max(customer_id)");
		    }
		    count=count+1;
			if(rs.next())
			{
			int customer_id=rs.getInt("customer_id");
			
			
				session.putValue("customer_id",customer_id);
				
				
				response.sendRedirect("choose_car.jsp");
			}
			else if(name!=null && gender!=null)
			{
				out.println("You were not registered !!!!!"+"<br>");
				out.println("We will register you...."+"<br>");
				String insertTableSQL = "INSERT INTO customers (customer_id,c_name,c_address_city,c_address_state,c_phone,c_income,c_gender,c_dob) VALUES(?,?,?,?,?,?,?,?)";
				   pstmt = con.prepareStatement(insertTableSQL);
				pstmt.setInt(1, count);
					pstmt.setString(2,name );
					pstmt.setString(3, city);
					pstmt.setString(5, phone);
					pstmt.setString(4, state);
					pstmt.setString(6, income);
					pstmt.setString(7, gender);
					pstmt.setString(8, dob);
					pstmt.executeUpdate();
					out.println("<center><h1>Registered Successfully</center</h1>");
					session.putValue("customer_id",count);
					response.sendRedirect("choose_car.jsp");
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