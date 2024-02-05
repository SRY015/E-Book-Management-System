package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_dtls;

public class BookDAOImpl implements BookDAO{
	private Connection conn;
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addBooks(Book_dtls b) {
		boolean f = false;
		try {
			String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,email)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}

		}catch(Exception e) {

		}

		return f;
	}

	public List<Book_dtls> getAllBooks(){

		List<Book_dtls> list = new ArrayList<Book_dtls>();
		Book_dtls b = null;

		try {
			String sql = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Book_dtls getBookById(int id) {
		Book_dtls b = null;
		try {
			String sql = "Select * from book_dtls where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {
				b = new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditBooks(Book_dtls b) {
		boolean f = false;
		try {
			String sql = "Update book_dtls set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "Delete from book_dtls where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Book_dtls> getNewBook(){
		List<Book_dtls> list = new ArrayList();
		Book_dtls b = null;
		try {
			String sql = "Select * from book_dtls where bookCategory = ? and status = ? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				b = new Book_dtls();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book_dtls> getRecentBook(){

		List<Book_dtls> list = new ArrayList();
		Book_dtls b = null;
		try {
			String sql = "Select * from book_dtls where status = ? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				b = new Book_dtls();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public List<Book_dtls> getOldBook(){
		
		List<Book_dtls> list = new ArrayList();
		Book_dtls b = null;
		try {
			String sql = "Select * from book_dtls where bookCategory = ? and status = ? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "old Book");
			ps.setString(2,"Active");
			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				b = new Book_dtls();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;	
		
	}


	@Override
	public List<Book_dtls> getOldBookById(String email) {
		List<Book_dtls> list = new ArrayList<Book_dtls>();
		Book_dtls b = null;
		
		try {
			
			String sql = "select * from book_dtls where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs =  ps.executeQuery();
			
			while(rs.next()) {
				b = new Book_dtls();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Book_dtls> getBookBySearch(String ch){
		List<Book_dtls> list = new ArrayList<Book_dtls>();
		Book_dtls b = null;
		try {
			String sql = "Select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new Book_dtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	


}
