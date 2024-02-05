package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_dtls;
import com.entity.Cart;

public class CartServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		Book_dtls b = dao.getBookById(bid);
		
		Cart c = new Cart();
		c.setBid(bid);
		c.setUserId(uid);
		c.setBookName(b.getBookName());
		c.setAuthor(b.getAuthor());
		c.setPrice(Double.parseDouble(b.getPrice()));
		c.setTotalPrice(Double.parseDouble(b.getPrice()));
		
		CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao2.addCart(c);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book added to cart successfully!!");
			res.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failed", "Something went wrong. Book is not added to cart!!");
			res.sendRedirect("checkout.jsp");
		}
		
	}
	

}
