package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import guestbook.vo.GuestbookVo;

public class GuestbookDao {

	public List<GuestbookVo> findAll() {
		List<GuestbookVo> result = new ArrayList<>();
		
		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement("select id, name, contents, date_format('%Y-%m-%d %h:%i:%s', reg_date) from guestbook order by reg_date desc");
				ResultSet rs = pstmt.executeQuery();
				
		) {
			while (rs.next()) {
				Long id = rs.getLong(1);
				String name = rs.getString(2);
				String contents = rs.getString(3);
				String regDate = rs.getString(4);
				
				GuestbookVo vo = new GuestbookVo();
				vo.setId(id);
				vo.setName(name);
				vo.setContents(contents);
				vo.setRegDate(regDate);
				
				result.add(vo); 
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		return result;
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver 로딩
			Class.forName("org.mariadb.jdbc.Driver");
	
			// 2. 연결하기 
			String url = "jdbc:mariadb://192.168.0.118:3306/webdb";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} 
		
		return conn;
	}

}