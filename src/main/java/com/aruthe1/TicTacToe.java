package com.aruthe1;

import java.util.*;

public class TicTacToe {
	
	int[][] board;
	int turn;
	int width;
	int size;
	int toWin;
	int numMoves;
	int numPlayers;
	
	public TicTacToe(int width, int numPlayers, int toWin) {
		//initializing the toWin
		this.toWin = toWin;
		this.size = width*width;
		this.width = width;
			
		//initializing the map
		this.board = new int[width][width];
		for(int i = 0; i < this.width; i++) {
			for(int j = 0; j < this.width; j++) {
				this.board[i][j] = -1;
			}
		}
		//initializing the numPlayers
		this.numPlayers = numPlayers;	
		//randomly assigns the first turn to player 0-numPlayers-1
		this.turn = (int)(this.numPlayers*Math.random());
	}
	
	/*
	 * MOVEMADE
	 */
	public String moveMade(String r, String c) {
		String retMessage = "";
		try {
			int row = Integer.parseInt(r);
			int col = Integer.parseInt(c);
			retMessage += "Attempting to execute player " + (char) (this.turn+65) + "'s move<br>";
			if(this.board[row][col] == -1) {
				
				//increasing the number of moves
				this.numMoves++;
				
				//making the move
				this.board[row][col] = this.turn;
				retMessage += "Move Successful.<br>";
				
				//updating the turn
				this.turn = (this.turn + 1)%(this.numPlayers);
			}
			else {
				retMessage += "Move failed. Try again. <br>";
			}
			
			return retMessage;
			
		}
		catch(Exception e) {
			retMessage = "Invalid location entered, try again<br>";
			return retMessage;
		}
	}
	
	/*
	 * GAMEWON
	 */
		public String gameWon() {

			int prev; //prev stores a predecessor value for the matrix value at row i, col j
			int k; //k will be used to iterate through the predecessors in a row, col, or diag
			String retMessage = null; //message to be returned
			
			//the nested for loop iterates through each map entry and uses the indices to check for 'toWin' consecutive X's or O's
			for(int i = 0; i < this.width; i++) {
				for(int j = 0; j < this.width; j++) {
	
					//ROW CHECK
					int cur = this.board[i][j];
					try {
						for(k = 1; k < this.toWin; k++) {
							prev = this.board[i][j-k];
							if(prev != cur || cur == -1) { //if prev and cur don't match or cur = -1 then the row hasn't been won
								break;
							}
						}
						if(k == this.toWin) { //if we iterated through the whole loop then a player has won
							retMessage = "Player " + cur + " has won! Congratulations.";
							return retMessage;
						}
					}
					catch(Exception e) {
						//do nothing, array index out of bounds or negative index exception was thrown
					}
					
					//SW DIAG CHECK
					try {
						for(k = 1; k < this.toWin; k++) {
							prev = this.board[i-k][j-k];
							if(prev != cur || cur == -1) { //if prev isn't equal to cur or cur = -1 then the SW diag hasn't been won
								break;
							}
						}
						if(k == this.toWin) { //if we iterated through the whole loop then a player has won
							retMessage = ("Player " + (char)(cur+65) + " has won! Congratulations.");
							return retMessage;
						}
					}
					catch(Exception e) {
						//do nothing, array index out of bounds or negative index exception was thrown
					}
					
					//SE DIAG CHECK
					try {
						for(k = 1; k < this.toWin; k++) {
							prev = this.board[i-k][j+k];
							if(prev != cur || cur == -1) { //if prev isn't equal to cur or cur = -1 then the SE diag hasn't been won
								break;
							}
						}
						if(k == this.toWin) { //if we iterated through the whole loop then a player has won
							retMessage = ("Player " + (char)(cur+65) + " has won! Congratulations.");
							return retMessage;
						}
					}
					catch(Exception e) {
						//do nothing, array index out of bounds or negative index exception was thrown
					}
					
					//COL CHECK
					cur = this.board[j][i];
					try {
						for(k = 1; k < this.toWin; k++) {
							prev = this.board[i-k][j];
							if(prev != cur || cur == -1) { //if prev isn't equal to cur or cur = -1 then the SW diag hasn't been won
								break;
							}
						}
						if(k == this.toWin) { //if we iterated through the whole loop then a player has won
							retMessage = "Player " + (char)(cur+65) + " has won! Congratulations.";
							return retMessage;
						}
					}
					catch(Exception e) {
						//do nothing, array index out of bounds or negative index exception was thrown
					}
				}
			}
			return retMessage;
	}
	
	
	/*
	 * GETTERS
	 */
	
	public int getSize() {
		return this.size;
	}
	public int getWidth() {
		return this.width;
	}
	public int[][] getBoard() {
		return this.board;
	}
	public int getTurn() {
		return this.turn;
	}	
	public int getToWin() {
		return this.toWin;
	}
	public int getNumPlayers() {
		return this.numPlayers;
	}
	public int getNumMoves() {
		return this.numMoves;
	}
}
