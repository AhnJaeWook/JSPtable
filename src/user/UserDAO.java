package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class UserDAO {
	private Connection conn; // �����ͺ��̽��� �����ϱ����� ���
	private PreparedStatement pstmt; //��ŷ�� �����ϱ����ػ��
	private ResultSet rs; // ������� �����ϱ����� ���
	
	public UserDAO() { //Mysql�� ������ �ϰ����ִ� �κ�
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234!";
			Class.forName("com.mysql.jdbc.Driver"); //�ڵ����� ��ü�� �����ǰ� DriverManager�� ��ϵȴ�.
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // ����
		}catch(Exception e) { //����ó��
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //?�� �Ʒ� prepareStatement�� ó���ϱ����� ���
		try {
			pstmt = conn.prepareStatement(SQL); // SQL����
			pstmt.setString(1, userID); // 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1;
				else
					return 0;
			}
			return -1;
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
			return pstmt.executeUpdate(); //�ش� ������Ʈ��Ʈ�� ������ ������� �ֽ��ϴ�. ������ 0�̻��� ���� ��ȯ�ǰԵ�
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //������ ���̽� ����
	}
}