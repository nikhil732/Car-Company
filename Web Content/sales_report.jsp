<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Sales">
<style>
body {background-color:#c098f7;background-repeat:no-repeat;background-position:top left;background-attachment:fixed;background-image: url(admin1.jpg);background-size: cover;}
h1{font-family:Verdana, sans-serif;font-size:90px;color:#443EDE;}
h2{font-family:Verdana, sans-serif;font-size:20px;color:#8506A6;}
h3{font-family:Verdana, sans-serif;font-size:15px;color:#85DE3E;}
p {font-family:Georgia, serif;font-size:14px;font-style:normal;font-weight:normal;color:#000000;background-color:#c0dff7;}
button{font-size:20px;color: #000000; background-color: #BB9F22; padding: 10px; border-radius: 4px;}

</style>


 <script type="text/javascript">
 	var x=1;
   		function hide_month(){
   			x=3;
		document.getElementById("from_month").style.display = "none";
		document.getElementById("to_month").style.display = "none";
		document.getElementById("from_week").style.display = "block";
		document.getElementById("to_week").style.display = "block";
	}
		function hide_month_week(){
			x=1;
		document.getElementById("from_month").style.display = "none";
		document.getElementById("to_month").style.display = "none";
		document.getElementById("from_week").style.display = "none";
		document.getElementById("to_week").style.display = "none";
	}
		function hide_week(){
			x=2;
		document.getElementById("from_week").style.display = "none";
		document.getElementById("to_week").style.display = "none";
		document.getElementById("from_month").style.display = "block";
		document.getElementById("to_month").style.display = "block";
	}

		function search(){
			var from_year, to_year, from_month, to_month, from_week, to_week, brand, dealer, body_type, engine_type, transmission;
			from_month = document.getElementById("from_month");
			to_month = document.getElementById("to_month");
			from_week = document.getElementById("from_week");
			to_week = document.getElementById("to_week");
			from_year = document.getElementById("from_year");
			to_year = document.getElementById("to_year");
			brand = document.getElementById("brand");
			dealer = document.getElementById("dealer");
			body_type = document.getElementById("body_type");
			engine_type = document.getElementById("engine_type");
			transmission = document.getElementById("transmission");

			//String extra_filter = " &brand="+brand.value+" &dealer="+dealer.value+" &body_type="+body_type.value+" &engine_type="+engine_type.value+" &transmission="+transmission.value;

			if(x==2){
			window.location.replace("byMonth.jsp?from_month="+from_month.value+" &to_month="+to_month.value+" &from_year="+from_year.value+" &to_year="+to_year.value+" &brand="+brand.value+"&dealer="+dealer.value+"&body_type="+body_type.value+"&engine_type="+engine_type.value+"&transmission="+transmission.value); 
			}
			if(x==1){
				window.location.replace("byYear.jsp?from_year="+from_year.value+" &to_year="+to_year.value+" &brand="+brand.value+"&dealer="+dealer.value+"&body_type="+body_type.value+"&engine_type="+engine_type.value+"&transmission="+transmission.value); 
			}
			if(x==3){
				window.location.replace("byWeek.jsp?from_year="+from_year.value+" &to_year="+to_year.value+" &from_week="+from_week.value+" &to_week="+to_week.value+" &brand="+brand.value+"&dealer="+dealer.value+"&body_type="+body_type.value+"&engine_type="+engine_type.value+"&transmission="+transmission.value);
			}
		}

		function show_inventory(){
			window.location.replace("showInventory.jsp")
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
   Statement stmt=null;
   Statement stmt1=null;
   Statement stmt2=null;
   Statement stmt3=null;
   ResultSet rs=null;
   ResultSet rs1=null;
   ResultSet rs2=null;
   ResultSet rs3=null;
		try
		{
		   Class.forName(JDBC_DRIVER);
		   con=DriverManager.getConnection(DB_URL,USER,PASS);
		   stmt=con.createStatement();
		stmt1=con.createStatement();
		stmt2=con.createStatement();
		stmt3=con.createStatement();
        String sql="SELECT sum(sale_price) as sale FROM `sales`";
        rs=stmt.executeQuery(sql);
        String sql1=" select brand_name,sum(sale_price) as total_sales from `vehicle` natural join `sales` where year(sale_date)=2018 group by brand_name order by total_sales desc limit 2;";
        rs1=stmt1.executeQuery(sql1);
        String sql2="select brand_name,count(sale_id) as no_of_sales from `vehicle` natural join `sales` where year(sale_date)=2018 group by brand_name order by no_of_sales desc limit 2;";
        rs2=stmt2.executeQuery(sql2);
        String sql3="select model_name from t natural join models;";
        rs3 = stmt3.executeQuery(sql3);
  %>
<table style="float:left" border="2" bordercolor="#ff0000" cellpadding="5" width="350px" height="116px">
	<tr bordercolor="#ff0000">
		<th><marquee style="font-size: 25px; color: #85DE3E;">Overall Sales: </marquee></th> 
	</tr>
		
		<%
		while(rs.next()) {
			int sales = rs.getInt("sale");
		
     
     out.println("<td><h3>" + sales+" Rs."+ "</h3></td>");}
		%>
	
		</table>


<table style="float:left" border="2" bordercolor="#ff0000" cellpadding="5" width="350px" height="116px">
		<tr bordercolor="#ff0000"> 
			<th><marquee style="font-size: 25px; color: #85DE3E;">Top 2 Brands by Amount: </marquee></th></tr>
			<%
		while(rs1.next()) {
			String b1 = rs1.getString("brand_name");
			int b2=rs1.getInt("total_sales");
			out.print("<td><h3>" +b1 +"  Rs. "+"   "+b2+ "</h3></td></tr>");
     }
		%>
				</table>
<h3>    </h3>
<table style="float:left" border="2" bordercolor="#ff0000" cellpadding="5" width="350px" height="116px">
	<tr bordercolor="#ff0000">
			<th><marquee style="font-size: 25px; color: #85DE3E;">Top 2 Brands by Sales: </marquee></th></tr>
			<%
		while(rs2.next()) {
			String b3 = rs2.getString("brand_name");
			int b4=rs2.getInt("no_of_sales");
			out.print("<td><h3>" +b3 +"   "+b4+" sales"+ "</h3></td></tr>");
     }
		%>
			
	</table>
<table style="float:left" border="2" bordercolor="#ff0000" cellpadding="5" width="350px" height="116px">
		<tr bordercolor="#ff0000"> 
			<th><marquee style="font-size: 25px; color: #85DE3E;">Model with Highest Sales: </marquee></th></tr>
		<%
		while(rs3.next()) {
			String b3 = rs3.getString("model_name");
			out.print("<td><h3>" +b3 + " </h3></td></tr>");
     }
		%>
				</table>
		<br><br><br><br><br><br>
		<br><br><br><br><br><br>
	<center> <br><br><h1> Get Report </h1> 
	<h2>Get Report By:
		<input type = "button" onclick = "hide_month_week()" value = "year" />
		<input type = "button" onclick = "hide_week()" value = "month" />
		<input type = "button" onclick = "hide_month()" value = "week" />
		<br></h2></center>


	<center>
	<table border="1" bordercolor="#ff0000" cellpadding="4">
		<tr bordercolor="#ff0000">
			<th bordercolor="#ff0000">
				<h2>Select from Year: <select id="from_year" name="select_year" style="height: 30px";>
		<option value="2014" selected>2014</option>
		<option value="2015" >2015</option>
		<option value="2016" > 2016</option>
		<option value="2017" > 2017</option>
		<option value="2018" >2018</option>
		<option value="2019" >2019</option>
	</select><br></h2>
			</th>
			<th bordercolor="#ff0000">
				<h2>to Year: <select id="to_year"  name="select_to_year" style="height: 30px" >
		<option value="2014" selected>2014</option>
		<option value="2015" >2015</option>
		<option value="2016" > 2016</option>
		<option value="2017" > 2017</option>
		<option value="2018" >2018</option>
		<option value="2019" >2019</option>
	</select><br></h2>
			</th>
		</tr>
	
	<tr bordercolor="#ff0000">
		<th bordercolor="#ff0000">
			<h2>Select from Month: <select id="from_month" name="select_month" style="height: 30px">
		<option value="1" selected>January</option>
		<option value="2" >Febraury</option>
		<option value="3" >March</option>
		<option value="4" >April</option>
		<option value="5" >May</option>
		<option value="6" >June</option>
		<option value="7" >July</option>
		<option value="8" >August</option>
		<option value="9" >September</option>
		<option value="10" >October</option>
		<option value="11" >November</option>
		<option value="12" >December</option>
	</select><br></h2>
		</th>

		<th bordercolor="#ff0000">
			<h2>To Month: <select id="to_month" name="select_to_month" style="height: 30px">
		<option value="1" selected>January</option>
		<option value="2" >Febraury</option>
		<option value="3" >March</option>
		<option value="4" >April</option>
		<option value="5" >May</option>
		<option value="6" >June</option>
		<option value="7" >July</option>
		<option value="8" >August</option>
		<option value="9" >September</option>
		<option value="10" >October</option>
		<option value="11" >November</option>
		<option value="12" >December</option>
	</select><br></h2>
		</th>
	</tr>
	
	<tr bordercolor="#ff0000">
		<th bordercolor="#ff0000">
			<h2>Select from Week: <select id="from_week" name="select_week">
		<option value="1" >1</option>
		<option value="2" >2</option>
		<option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option>
		<option value="7" >7</option>
		<option value="8" >8</option>
		<option value="9" >9</option>
		<option value="10" >10</option>
		<option value="11" >11</option>
		<option value="12" >12</option>
		<option value="13" >13</option>
		<option value="14" >14</option>
		<option value="15" >15</option>
		<option value="16" >16</option>
		<option value="17" >17</option>
		<option value="18" >18</option>
		<option value="19" >19</option>
		<option value="20" >20</option>
		<option value="21" >21</option>
		<option value="22" >22</option>
		<option value="23" >23</option>
		<option value="24" >24</option>
		<option value="25" >25</option>
		<option value="26" >26</option>
		<option value="27" >27</option>
		<option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option>
		<option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option>
		<option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option>
		<option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option>
		<option value="52" >52</option>
	</select><br></h2>
		</th>

		<th bordercolor="#ff0000">
			<h2>To Week: <select id="to_week" name="select_to_week">
		<option value="1" >1</option>
		<option value="2" >2</option>
		<option value="3" >3</option>
		<option value="4" >4</option>
		<option value="5" >5</option>
		<option value="6" >6</option>
		<option value="7" >7</option>
		<option value="8" >8</option>
		<option value="9" >9</option>
		<option value="10" >10</option>
		<option value="11" >11</option>
		<option value="12" >12</option>
		<option value="13" >13</option>
		<option value="14" >14</option>
		<option value="15" >15</option>
		<option value="16" >16</option>
		<option value="17" >17</option>
		<option value="18" >18</option>
		<option value="19" >19</option>
		<option value="20" >20</option>
		<option value="21" >21</option>
		<option value="22" >22</option>
		<option value="23" >23</option>
		<option value="24" >24</option>
		<option value="25" >25</option>
		<option value="26" >26</option>
		<option value="27" >27</option>
		<option value="28" >28</option><option value="29" >29</option><option value="30" >30</option><option value="31" >31</option><option value="32" >32</option><option value="33" >33</option>
		<option value="34" >34</option><option value="35" >35</option><option value="36" >36</option><option value="37" >37</option><option value="38" >38</option><option value="39" >39</option>
		<option value="40" >40</option><option value="41" >41</option><option value="42" >42</option><option value="43" >43</option><option value="44" >44</option><option value="45" >45</option>
		<option value="46" >46</option><option value="47" >47</option><option value="48" >48</option><option value="49" >49</option><option value="50" >50</option><option value="51" >51</option>
		<option value="52" >52</option>
	</select></h2>
</table></center>
		</th>
	</tr>
	
	<br>

	<center>
	<table border="1" bordercolor="#ff0000" cellpadding="4">
		<tr bordercolor="#ff0000">
			<th bordercolor="#ff0000">
				<h2>Show by Brand: <select id="brand" name="show_by_brand" style="height: 30px">
		<option value="7 series" selected>7 Series</option>
		<option value="1 series" >1 Series</option>
		<option value="i8" >i8</option>
		<option value="x4" >X4</option>
	</select><br></h2>
			</th>
			<th bordercolor="#ff0000">
				<h2>Show by Dealer: <select id="dealer"  name="show_by_dealer" style="height: 30px">
		<option value=1 selected>Nikhil</option>
		<option value=2 >Adam</option>
		<option value=3 >Adonis</option>
		<option value=4 >Andrew</option>
		<option value=5 >Carter</option>
		<option value=6 >David</option>
		<option value=7 >Harry</option>
		<option value=8 >Justin</option>
		<option value=9 >Sam</option>
		<option value=10 >Xander</option>
	</select><br></h2>
			</th>
			<th bordercolor="#ff0000">
				<h2>Show by BodyType: <select id="body_type" name="show_by_body_type" style="height: 30px">
		<option value="Sedan" selected>Sedan</option>
		<option value="Coupe" >Coupe</option>
		<option value="SUV" >SUV</option>
		<option value="Hatchback" > Hatchback</option>
	</select><br></h2>
			</th>

		</tr>

		<tr bordercolor="#ff0000">
			<th bordercolor="#ff0000">
				<h2>Show by EngineType: <select id="engine_type" name="show_by_engine_type" style="height: 30px">
		<option value="Petrol" selected>Petrol</option>
		<option value="Diesel" >Diesel</option>
		<option value="Hybrid" >Hybrid</option>
	</select><br></h2>
			</th>

			<th>
		<h2>Show by Transmission: <select id="transmission" name="show_by_transmission" style="height: 30px">
		<option value="Automatic" selected>Automatic</option>
		<option value="Manual" >Manual</option>
	</select><br></h2>
			</th>
		</tr>
	</table>
	</center><br>

<center>
<button type="search_results" onclick="search()">Search Results
</button>
<button type="button" onclick="show_inventory()">Show Inventory</button>
</center>
<%
}catch(Exception e)
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