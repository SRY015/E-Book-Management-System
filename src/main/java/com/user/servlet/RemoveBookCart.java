package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

public class RemoveBookCart extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(cid);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book removed from cart");
			res.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong on server");
			res.sendRedirect("checkout.jsp");
		}
		
	}

}
