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
		position: fixed;
		left:0;
		bottom: 0;
		width: 100%;
		height: 30px;
		background-color: #F8F8FF;
	}
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">

		<a href="https://www.github.com/ryrutherford" class="navbar-brand">Github</a>

</nav>
<div class="container">
	<p><font color="red">${error}</font></p>
	<p>Select the game details</p>
	
	<form action="newGame.do" method="post">
		Board Width: <input type="text" name="width" required>
		Number of Players: <input type="text" name="numPlayers" required>
		Consecutive Inputs to Win: <input type="text" name="toWin" required>
		<input type="Submit" value="Start New Game">
	</form>
	
</div>

<footer class="footer">
		<p>Ry Rutherford</p>
	</footer>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>