package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;


public class OrderServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		try {
		
			
			int id = Integer.parseInt(req.getParameter("userId"));
			
			String name = req.getParameter("userName");
			String email = req.getParameter("userEmail");
			String phno = req.getParameter("phoneNo");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landMark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("pin");
			String paymentType = req.getParameter("payment");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pin;
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = dao.getBookByUser(id);
			HttpSession session = req.getSession();
			
			if(blist.isEmpty()) {
				
				res.sendRedirect("checkout.jsp");
				session.setAttribute("succMsg", "Please Add some item.");
				
			}else {
				
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				
				for(Cart c : blist) {
					
					Book_Order o = new Book_Order();
					
					o.setorderId("BOOK-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					
					orderList.add(o);
					i++;
				}
				
				if("noselect".equals(paymentType)) {
					res.sendRedirect("checkout.jsp");
					session.setAttribute("succMsg", "Please Select the Payment type");
					
				}else {
					boolean f = dao2.saveOrder(orderList);
					if(f) {
						res.sendRedirect("order-success.jsp");
					}else {
						System.out.println("fail order...");
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
