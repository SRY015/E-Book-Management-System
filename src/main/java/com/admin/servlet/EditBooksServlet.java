package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_dtls;

public class EditBooksServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException{
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
			String status = req.getParameter("bstatus");
			
			Book_dtls b = new Book_dtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Book details updated successfully..");
				res.sendRedirect("all_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Somthing went wrong on server..");
				res.sendRedirect("edit_books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
