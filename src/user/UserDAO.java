package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class UserDAO {
	private Connection conn; // 데이터베이스를 연결하기위해 사용
	private PreparedStatement pstmt; //해킹을 방지하기위해사용
	private ResultSet rs; // 결과값을 도출하기위해 사용
	
	public UserDAO() { //Mysql에 접속을 하게해주는 부분
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234!";
			Class.forName("com.mysql.jdbc.Driver"); //자동으로 객체가 생성되고 DriverManager에 등록된다.
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // 접속
		}catch(Exception e) { //예외처리
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT * FROM USER WHERE userID = ?"; //?는 아래 prepareStatement로 처리하기위해 사용
		
		try {
			pstmt = conn.prepareStatement(SQL); // SQL대입
			pstmt.setString(1, userID); // 
			
			rs = pstmt.executeQuery();
	
			  if(rs.next()) { if(rs.getString(1).equals(userPassword)) return 1; else
			  return 0; } return -1;
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate(); //해당 스테이트먼트를 실행한 결과값을 넣습니다. 무조건 0이상의 값이 반환되게됨
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
	}
}
