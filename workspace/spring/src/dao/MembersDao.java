package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MembersDao {

	// field
	private Connection con;  // 접속
	private PreparedStatement ps;  // 쿼리 처리
	private ResultSet rs;  // select 결과
	private String sql;
	private int result;  // insert, update, delete 결과
	
	// singleton
	// MembersDao 내부에서 1개의 객체를 미리 생성해 두고,
	// getInstance() 메소드를 통해서 외부에서 사용할 수 있도록 처리
	private MembersDao() {}  // private 생성자(내부에서만 생성이 가능하다.)
	private static MembersDao dao = new MembersDao();  // static : 미리 1개를 만들어 둔다.
	public static MembersDao getInstance() {  // 클래스 필드(static 필드)를 사용은 클래스 메소드(static 메소드)만 가능하다.
		return dao;
	}
	// getInstance() 메소드 호출방법
	// 클래스 메소드는 클래스로 호출한다.
	// MembersDao dao = MembersDao.getInstance();
	
	// method
	
	// 접속과 접속해제
	// MembersDao 내부에서만 사용하기 때문에 private 처리한다.
	private Connection getConnection() throws Exception {  // getConnection() 메소드를 호출하는 곳은 PreparedStatement 클래스를 사용하는 곳으로 어차피 try - catch를 하는 곳이다.
		                                                   // getConnection() 메소드를 호출하는 곳으로 예외를 던져버리자.
		Class.forName("oracle.jdbc.driver.OracleDriver");  // ClassNotFoundException
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "spring";
		String password = "1111";
		return DriverManager.getConnection(url, user, password);  // SQLException
	}
	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) { rs.close(); }
			if (ps != null) { ps.close(); }
			if (con != null) { con.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 가입
	
	// 탈퇴
	
	// 회원정보수정
	
	// 아이디 찾기
	
	// 회원번호에 의한 검색
	
	// 전체 검색
	
	
}







