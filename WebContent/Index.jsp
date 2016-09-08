<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movies.*"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.util.Arrays" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<script type="text/javascript">
	function searchGenres() {
		alert("IT WORKS!");

	}
</script>

<style>
table td {
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;
}

table th {
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;
}

table th:hover {
	background-color: yellow;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies</title>
</head>
<body>

	<fieldset>
	<form>
		<legend>Please select all genre, or select multiple genres</legend>
		<input type="submit" value="All Genres"> <input
			type="checkbox" name="genre" value=scifi> Sci-Fi <input
			type="checkbox" name="genre" value="horror"> Horror <input
			type="checkbox" name="genre" value="drama"> Drama <input
			type="checkbox" name="genre" value="musical"> Musical <input
			type="checkbox" name="genre" value="comedy"> Comedy <input
			type="checkbox" name="genre" value="animated"> Animated <input
			type="submit" value="Search Genre(s)">
	</form>
	</fieldset>





	<sql:setDataSource var="datasrc" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/movie?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
		user="jdbc" password="java123" />
	<sql:query dataSource="${datasrc}" var="result">
Select * from Movie where category <%
String req = request.getQueryString();

if(req != null && req != "?"){

	
	String[] requests = req.split("&");
	int i = 0;
	for (String s : requests){
		String[] pair = s.split("=");
		if (i>=1){
			out.println("or category = '" + pair[1]+ "'");
		} else{
			out.println("= '"+pair[1] + "'");
		}
		i++;
	}

} else {
	out.println("is not null");
}

%> order by Title<%



%>;

</sql:query>



	<table>
		<tr>
			<th sorted>ID</th>
			<th onclick="http://localhost:8080/Lab23/Index.jsp?">Title</th>
			<th onclick="searchGenres()">Genre</th>
			<th onclick="searchGenres()">Rating</th>
		</tr>


		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.MovieID}" /></td>
				<td><c:out value="${row.Title}" /></td>
				<td><c:out value="${row.Category}" /></td>
				<td><c:out value="${row.Rating}" /></td>
			</tr>
		</c:forEach>
	</table>



</body>
</html>