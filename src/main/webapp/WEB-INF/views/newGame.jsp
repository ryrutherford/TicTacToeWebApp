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
	.center-container{
		text-align: center;
	}
	input{
		width : 300px;
		margin: 0;
		box-sizing: border-box;
	}
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
		<span class="navbar-text">Tic Tac Toe</span>
		<a href="https://www.github.com/ryrutherford" class="navbar-brand">Github</a>	
</nav>
<div class="center-container">
	<p><font color="red">${error}</font></p>
	<h2>Enter Game Details</h2>
	
	<form action="newGame.do" method="post">
		<input type="text" name="width" placeholder="Board Width" required><br>
		<input type="text" name="numPlayers" placeholder="Number of Players" required><br>
		<input type="text" name="toWin" placeholder="Consecutive Marks to Win"required><br>
		<input type="Submit" value="Start New Game">
	</form>
	
</div>

	<script>
		//prevents form resubmissions
	    if (window.history.replaceState) {
	        window.history.replaceState(null, null, window.location.href);
	    }
		
		//prevents going back one page
	    history.pushState(null, document.title, location.href);
	    window.addEventListener('popstate', function (event)
	    {
	      history.pushState(null, document.title, location.href);
	    });
	</script>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>