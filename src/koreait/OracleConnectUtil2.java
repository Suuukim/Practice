package koreait;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnectUtil2 {
	
	//오라클 연결 메소드
	public static Connection connect(){
		String url = "jdbc:Oracle:thin:@//localhost:1521/xe";
		String user = "practice";
		String password = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver";
		Connection conn = null;
		
		try {
			Class.forName(driver);		//오라클 서버이름
			conn = DriverManager.getConnection(url,user,password);		//DriverManager로 sql url연동
			
			if(conn == null)
				System.out.println("데이터베이스 서버에 연결되지 못했습니다.");
				System.out.println("연결상태 확인 : " + conn);
		}catch(ClassNotFoundException e) {
			System.out.println("클래스 로드 오류 : " + e.getMessage());
		}catch(SQLException e2) {
			System.out.println("연결 URL,사용자 계정정보 오류 : " + e2.getMessage());
		}
		return conn;
	}		//connect 메소드 끝
	
	
}
