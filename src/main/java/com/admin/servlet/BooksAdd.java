package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_dtls;

@MultipartConfig
public class BooksAdd extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{

		try {

			String bookName = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
			String category = req.getParameter("bcategory");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			Book_dtls b = new Book_dtls(bookName,author,price,category,status,fileName,"admin");
			System.out.println(b);

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.addBooks(b);
			
			String path = getServletContext().getRealPath("") + "Booksimg";
			//System.out.println(path);

			File file = new File(path);
			part.write(path + File.separator + fileName);

			HttpSession session = req.getSession();

			if(f) {
				session.setAttribute("succMsg", "Book added Successfully !!");
				res.sendRedirect("add_books.jsp");
			}else {
				session.setAttribute("failedMsg", "Somthing went wrong on server !!");
				res.sendRedirect("add_books.jsp");
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
