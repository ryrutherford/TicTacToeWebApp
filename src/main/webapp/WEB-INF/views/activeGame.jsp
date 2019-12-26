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
	td {
  		width: 50px;
  		height: 50px;
	}
	td:hover{
		background-color:#FFC0CB;
		cursor: pointer;
	}
	table {
 		 margin: 5px auto;
	}
	.vert {
  		border-left: 2px solid black;
  		border-right: 2px solid black;
	}
	.hori {
 		border-top: 2px solid black;
  		border-bottom: 2px solid black;
	}
	.footer{
		position: fixed;
		left:0;
		bottom: 0;
		width: 100%;
		height: 30px;
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
		<h2>Game Details</h2>
		<i>Board Width: ${activeGame.width}<br>
		Number of Players: ${activeGame.numPlayers}<br>
		Needed to Win: ${activeGame.toWin}</i><br>
		<font color="blue">${moveMessage}</font> <!-- printing out whether the move was successful or not -->
		<font color="green">${wonMessage}</font> <!-- printing out whether the game has been won -->
		<c:set var="playerID" value="&\#${activeGame.turn + 65}"/> <!-- playerID is the char id of the player -->
		<b>Player ${playerID}'s turn</b><br>
	</div>
	
	<table id="table">
	<c:forEach var="rowData" varStatus="row" items="${activeGame.board}">
		<tr>
		<c:forEach var="colData" varStatus="col" items="${rowData}">
		
			<c:if test="${col.index eq 0 || col.index eq activeGame.width - 1}"> <!-- in the first and last columns -->
			
				<c:if test="${row.index ne 0 && row.index ne activeGame.width -1}"> <!-- we only print two hori lines -->
					<c:if test="${colData eq - 1}">
						<td class="hori"></td>
					</c:if>
					<c:if test="${colData ne -1}">
						<c:set var="val" value="&\#${colData + 65}"/>
						<td class="hori" style="text-align:center">${val}</td>
					</c:if>
				</c:if>
				
				<c:if test="${row.index eq 0 || row.index eq activeGame.width -1}"> <!-- or no lines at all -->
					<c:if test="${colData eq - 1}">
						<td></td>
					</c:if>
					<c:if test="${colData ne -1}">
						<c:set var="val" value="&\#${colData + 65}"/>
						<td style="text-align:center">${val}</td>
					</c:if>
				</c:if>
				
			</c:if>
			
			<c:if test="${col.index gt 0 && col.index lt activeGame.width - 1}"> <!-- in the other columns -->
				
				<c:if test="${row.index ne 0 && row.index ne activeGame.width -1}"> <!-- we print both vert and hori lines -->
					<c:if test="${colData eq - 1}">
						<td class="vert hori"></td>
					</c:if>
					<c:if test="${colData ne -1}">
						<c:set var="val" value="&\#${colData + 65}"/>
						<td class="vert hori" style="text-align:center">${val}</td>
					</c:if>
				</c:if>
				
				<c:if test="${row.index eq 0 || row.index eq activeGame.width -1}"> <!-- or just vert lines if we are in the first or last row -->
					<c:if test="${colData eq - 1}">
						<td class="vert"></td>
					</c:if>
					<c:if test="${colData ne -1}">
						<c:set var="val" value="&\#${colData + 65}"/>
						<td class="vert" style="text-align:center">${val}</td>
					</c:if>
				</c:if>
				
			</c:if>
		</c:forEach>
		</tr>
	
	</c:forEach>
	</table>
	
	<div class="center-container wrapper">
		<!-- <form action="activeGame.do" method="post">
			Row: <input type="text" name="row">
			Column: <input type="text" name="col">
			<input type="Submit" value="Make Move">
		</form> -->
		<form action="activeGame.do" method="post" id="moveMade">
			<input type="hidden" name="row" id="row" value="null" required/>
			<input type="hidden" name="col" id="col" value="null" required/>
			<!-- <input type="submit" value="submit"> -->
		</form>
	</div>

	<footer class="footer">
		<p>Ry Rutherford</p>
	</footer>
	
	<script>
		var table = document.getElementById("table"),rIndex,cIndex;
		 // table rows
        for(var i = 0; i < table.rows.length; i++)
        {
            // row cells
            for(var j = 0; j < table.rows[i].cells.length; j++)
            {
                table.rows[i].cells[j].onclick = function()
                {
                    rIndex = this.parentElement.rowIndex;
                    cIndex = this.cellIndex;
                    console.log("Row : "+rIndex+" , Cell : "+cIndex);
                    document.getElementById("row").value = rIndex;
                    document.getElementById("col").value = cIndex;
                    document.getElementById("moveMade").submit();
                };
            }
        }
	</script>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>