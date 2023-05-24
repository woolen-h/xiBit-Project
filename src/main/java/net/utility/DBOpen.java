package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {

	public Connection getConnection() {
		Connection con = null;

		try {
			// ★ AWS 수정 완료
			String url = "jdbc:mysql://xibit-database.ceb8v0zy9x56.ap-northeast-2.rds.amazonaws.com/xiBit-database";
			String user = "admin";
			String password = "admin1234";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			// System.out.println("database Connection Success");

		} catch (Exception e) {
			System.out.println("DB 연결 실패: " + e);
		} // end
		return con;
	} // getConnection() end
} // class end