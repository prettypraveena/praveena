<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
String str, str1, name, password;
String t2=new String();
String t=request.getParameter("t");
if(t.equals("2"))
{
	name=request.getParameter("name");
	password=request.getParameter("password");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","navya","nav");
	Statement s =c.createStatement();
	String sql = "select * from admin";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		str=rs.getString("name");	
		str1=rs.getString("password");
		if(name.compareTo(str)==0 && password.compareTo(str1)==0)
		{
			%><jsp:forward page="adminhome.html"/> <%
		}
		else{
			
			t2="User Name and password incorrect";		}

	}
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMINSTRATOR LOGIN FORM</title>
<script language="javascript" >
function fun3()
{
	var name=document.adminlogin.name.value;
	var password=document.adminlogin.password.value;
	if(name =="" || password == "")
	{
			alert("Enter the Details First");
			document.adminlogin.name.focus();
			return false;
	}
}
</script>
</head>
<body>
<body style="background-color:cyan">
<form name="adminlogin" action="adminlogin.jsp?t=2" onsubmit="return fun3()" method=post>
<center>
<img src="logo.png" width="780" height="151" alt="logo">
<marquee bgcolor="yellow" behavior=alternate direction="right" width="100%">ADMINSTRATOR LOGIN FORM</marquee><br><br><br>
<table border="0" cellspacing=0 cellpadding=5 >
<tr>
	<th>USER NAME :</th>
	<td><input name="name" type=text size="20" ></td>
</tr>
<tr>
	<th>PASSWORD :</th>
	<td><input name="password" type=password size="20" ><br><%=t2 %></td>
</tr>
<caption align=bottom>
<input type="submit" value=SUBMIT>
</caption>
</table>
<br><br><br>

<a href="index.html" >Back To Home Page</a><br><br>

</center>
</form>
</body>
</html>