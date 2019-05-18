<%@ page import ="java.util.*,java.sql.*,java.io.*"%>
<%!String JDBC_DRIVER = "com.mysql.jdbc.Driver";%>
<%
String ty1=request.getParameter("type");
int ty=Integer.parseInt(request.getParameter("type"));
session.putValue("Type",ty);
if(ty==1||ty1==null)
{
	response.sendRedirect("sign_in.jsp");}
else
	response.sendRedirect("customer_registration.jsp");
%>