package com.aruthe1.newGame;

public class GameValidationService {

	public String isGameValid(String w, String nP, String tW) {
		String error = "false";
		String cur = "";
		try {
			
			int width = Integer.parseInt(w);
			int numPlayers = Integer.parseInt(nP);
			int toWin = Integer.parseInt(tW);
			if(width < 3) {
				cur += "The width must be greater than or equal to 3<br>";
			}
			if(toWin > width) {
				cur += "The value to win must be less than or equal to the width of the board.<br>";
			}
			if(toWin < 3) {
				cur += "The value to win must be greater than or equal to 3.<br>";
			}
			if(numPlayers > 26) {
				cur += "No more than 26 players can play the game.<br>";
			}
			if(numPlayers > width) {
				cur += "The number of players must be less than or equal to the width of the board.<br>";
			}
			if(numPlayers < 2) {
				cur += "The number of players must be greater than or equal to 2.<br>";
			}
			if(cur.equals("") == false) {
				error = "Your input had the following error(s):<br>" + cur;
			}
			return error;
		}
		catch (NumberFormatException e){
			error = "You must enter integer numbers, any other input is invalid<br>";
			return error;
		}
	}
}
