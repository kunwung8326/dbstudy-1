package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployeesDao {

	// field
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;

	private EmployeesDao() {}
	private static EmployeesDao dao = new EmployeesDao();
	public static EmployeesDao getInstance() {
		return dao;
	}

	// method
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "hr";
		String password = "1111";
		return DriverManager.getConnection(url, user, password);
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
	
}