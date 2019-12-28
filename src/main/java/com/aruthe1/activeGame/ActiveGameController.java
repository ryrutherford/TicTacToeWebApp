package com.aruthe1.activeGame;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aruthe1.TicTacToe;

@WebServlet(urlPatterns="/activeGame.do")
public class ActiveGameController extends HttpServlet{
	

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		//if someone landed at this servlet without starting a game we must send them back to the new game page
		if(request.getSession().getAttribute("activeGame") == null) { 
			request.getRequestDispatcher("/WEB-INF/views/newGame.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/activeGame.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		//updating the board with the entered values
		TicTacToe t = (TicTacToe) request.getSession().getAttribute("activeGame");
		String moveMessage = t.moveMade(request.getParameter("row"), request.getParameter("col"));
		String wonMessage = t.gameWon();
		if(wonMessage != null) {
			request.setAttribute("wonMessage", wonMessage); //setting the message for the winner
			request.getRequestDispatcher("/WEB-INF/views/restartGame.jsp").forward(request, response);
		}
		else {
			request.setAttribute("moveMessage", moveMessage);
			request.getRequestDispatcher("/WEB-INF/views/activeGame.jsp").forward(request, response);
		}
		
	}
}
