<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="movies.*"%>
	<%@ page import="java.sql.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<script type="text/javascript">
	function searchGenres() {
		alert("IT WORKS!");
		
	}
</script>

<style>
table td{
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;
}
table th{
	border-width: 1px;
	padding: 1px;
	border-style: inset;
	border-color: gray;
	background-color: white;

}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies</title>
</head>
<body>

<fieldset> <legend>Please select all genre, or select multiple genres</legend>
				 <input type="submit" name="allGenre" value="All Genres">
				<input type="checkbox" name="scifi" value=scifi> Sci-Fi
			<input type="checkbox" name="horror" value="horror"> Horror
				<input type="checkbox" name="drama" value="drama"> Drama
				<input type="checkbox" name="musical" value="musical"> Musical
				<input type="checkbox" name="comedy" value="comedy"> Comedy
				<input type="checkbox" name="animated" value="animated"> Animated
				<input type="submit" name="someGenres" onclick ="searchGenres()" value="Search Genre(s)">
				</fieldset>
			
			
			<sql:setDataSource var="datasrc" driver="com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/movie?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
user = "jdbc" password = "java123" />
<sql:query dataSource = "${datasrc}" var ="result">
Select * from Movie order by Title;

</sql:query>


<table>
		<tr>
			<th onclick="searchGenres()">ID</th>
			<th>Title	</th>
			<th>Genre	</th>
			<th>Rating</th>
		</tr>
		
		
		<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><c:out value ="${row.MovieID}" /></td>
			<td><c:out value ="${row.Title}" />	</td>
			<td><c:out value ="${row.Category}" />	</td>
			<td><c:out value ="${row.Rating}" /></td>
		</tr>
		</c:forEach>
</table>	
	<%
	%>


</body>
</html>