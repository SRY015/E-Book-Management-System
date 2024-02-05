package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

public class BooksDeleteServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res )throws IOException, ServletException{
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBooks(id);

			HttpSession session = req.getSession();

			if(f) {
				session.setAttribute("succMsg", "Book deleted successfully..");
				res.sendRedirect("all_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Somthing went wrong on server..");
				res.sendRedirect("all_books.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
