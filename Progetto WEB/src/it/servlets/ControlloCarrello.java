package it.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.beans.Carrello;

@WebServlet("/ControlloCarrello")
public class ControlloCarrello extends HttpServlet{
	
	public ControlloCarrello() {
		super();
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession s = request.getSession();

		Carrello carrello= (Carrello)s.getAttribute("carrello1");
		if(carrello==null){
			System.out.println("vuoto");
		}
		
		
		s.setAttribute("carrello1", carrello);
		

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Carrello.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
	
}
