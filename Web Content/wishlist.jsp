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
	PreparedStatement pstmt = null;

   Class.forName(JDBC_DRIVER);
   con=DriverManager.getConnection(DB_URL,USER,PASS);
String d_name=(String)session.getAttribute("d_name");
System.out.println(d_name);
int m_price=(Integer)session.getAttribute("model_price");
int vin=(Integer)session.getAttribute("vin");
int c_id=(Integer)session.getAttribute("customer_id");
String insertTableSQL = "INSERT INTO wishlist VALUES(?,?,?,?);";
				   pstmt = con.prepareStatement(insertTableSQL);
				pstmt.setInt(1, c_id);
					pstmt.setString(2,d_name );
					pstmt.setInt(3, vin);
					
					pstmt.setInt(4,m_price);
					out.println(String.valueOf(pstmt));
					pstmt.executeUpdate();
					out.println("<br>success<br>");
					response.sendRedirect("logout.jsp");
					
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