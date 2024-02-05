package com.DAO;

import java.util.List;

import com.entity.Book_dtls;

public interface BookDAO {
	
	public boolean addBooks(Book_dtls b);
	
	public List<Book_dtls> getAllBooks();
	
	public Book_dtls getBookById(int id);
	
	public boolean updateEditBooks(Book_dtls b);
	
	public boolean deleteBooks(int id);
	
	public List<Book_dtls> getNewBook();
	
	public List<Book_dtls> getRecentBook();
	
	public List<Book_dtls> getOldBook();
	
	public List<Book_dtls> getOldBookById(String email);
	
	public List<Book_dtls> getBookBySearch(String ch);

}
