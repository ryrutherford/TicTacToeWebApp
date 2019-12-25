package com.aruthe1.newGame;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aruthe1.TicTacToe;

@WebServlet(urlPatterns="/newGame.do")
public class NewGameController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	GameValidationService gVService = new GameValidationService();
	TicTacToe activeGame;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		request.getRequestDispatcher("/WEB-INF/views/newGame.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String width = request.getParameter("width");
		String numPlayers = request.getParameter("numPlayers");
		String toWin = request.getParameter("toWin");
		
		String isValid = gVService.isGameValid(width, numPlayers, toWin);
		if(isValid.equals("false") == false) { //if the user entered an invalid input
			request.setAttribute("error", isValid);
			request.getRequestDispatcher("/WEB-INF/views/newGame.jsp").forward(request, response);
		}
		else {
			int w = Integer.parseInt(width);
			int nP = Integer.parseInt(numPlayers);
			int tW = Integer.parseInt(toWin);
			activeGame = new TicTacToe(w,nP,tW);
			HttpSession session = request.getSession();
			session.setAttribute("activeGame", activeGame);
			response.sendRedirect("/activeGame.do");
		}
	}
}
