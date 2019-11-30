package file; 

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class FileDAO {
	private Connection conn;
	private ResultSet rs; // 결과값을 도출하기위해 사용
	
	public FileDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/FILE";
			String dbID = "root";
			String dbPassword = "1234!";
			Class.forName("com.mysql.jdbc.Driver"); //자동으로 객체가 생성되고 DriverManager에 등록된다.
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // 접속
		}catch(Exception e) { //예외처리
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO FILE VALUES (?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//pstmt.setInt(1, fileID);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public String[] search_file(String fileRealName) {
		String SQL = "SELECT fileRealName from FILE";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			String temp[] = new String[10];
			int i = 0;
			while(rs.next()) {
				if(rs.getString(1) == fileRealName) {
					temp[i] = rs.getString(1);
				}
				i++;
			}
			return temp; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}