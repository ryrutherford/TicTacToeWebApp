<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tic Tac Toe</title>
<link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
	
<style>
	.footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 60px;
		background-color: #F8F8FF;
	}
	.center-container{
		text-align: center;
	}
</style>
	
</head>
<body>
<nav class="navbar navbar-dark bg-dark">

		<a href="https://www.github.com/ryrutherford" class="navbar-brand">Github</a>

</nav>

	<div class="center-container">
		<H1>Tic Tac Toe</H1>
		<font color="green">${wonMessage}</font><br> <!-- printing out whether the game has been won -->
		<form action="newGame.do" method="post">
			Board Width: <input type="text" name="width"><br>
			Consecutive Inputs to Win: <input type="text" name="toWin"><br>
			<input type="hidden" name="numPlayers" value="${numPlayers}">
			<input type="Submit" value="Restart Game">
			<input type="Submit" formmethod="get" value ="Exit Game">
		</form>
		
	</div>
	
	<div class="center-container">
		
	</div>

	<footer class="footer">
		<p>Ry Rutherford</p>
	</footer>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>