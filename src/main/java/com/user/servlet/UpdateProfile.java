package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

public class UpdateProfile extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res )throws IOException, ServletException{
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f1 = dao.updateProfile(us);
			
			if(f1) {
				session.setAttribute("succMsg", "Profile Updated Successfully...");
				res.sendRedirect("edit_profile.jsp");
				
			}else {
				session.setAttribute("failedMsg", "Something went wrong on server...");
				res.sendRedirect("edit_profile.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
