package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import koreait.OracleConnectUtil;
import koreait.vo.Member;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	private MemberDao() {
		
	}
	public static MemberDao getInstance() {
		return dao;
	}
	
	public int getNextSeq() {
		Connection conn=OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="select member_tbl_seq.nextval from dual";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt(1);
			pstmt.close();
		}catch(SQLException e) {
			System.out.println("MemberDao next seq 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return  result;
	}
	
	public void insert (Member vo) {
		Connection conn = OracleConnectUtil.connect();
//		String sql = "INSERT INTO MEMBER_TBL_02 (CUSTNO, CUSTNAME, PHONE, ADDRESS, "
//		+ "JOINDATE, GRADE, CITY) "
//		+ "VALUES(member_seq.nextval,?,?,?,sysdate,?,?)";

		String sql = "INSERT INTO MEMBER_TBL_02 (CUSTNO, CUSTNAME, PHONE, ADDRESS, "
				+ "JOINDATE, GRADE, CITY) "
				+ "VALUES(?,?,?,?,sysdate,?,?)";
		try { 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, vo.getCustName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(1, vo.getCustNo());
			
			pstmt.execute();
			System.out.println("회원 등록이 완료되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("MemerDao insert 오류 : " + e.getMessage());
		}
		
		OracleConnectUtil.close(conn);
	}
	
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER_TBL_02 SET phone=?, address=?, city=?"
						+ "WHERE custno = ?";
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustNo());
			pstmt.execute();
			//execute()문은 Boolean 타입의 값을 반환, 모든 구문을 수행할 수 있다.
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("MemberDao update 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	public Member selectOne(int custno) {
		Connection conn=OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="select * from member_tbl_02 where custno = ?";
		Member result = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();		
			//executeQuery()문은 객체의 값을 반환할때 사용, select 구문을 수행할 때 사용되는 함수.
			
			if(rs.next())
				result = new Member(rs.getInt(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getDate(5),
									rs.getString(6),
									rs.getString(7));
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("MemberDao seelctOne 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;
	}
	
	public List<Member> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt=null;
		String sql = "select * from member_tbl_02";
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(sql);
			//매개변수 값이 필요없는 sql : set 메소드 없음.
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//테이블 조회된 컬럼을 자바 객체로 생성해서 저장.(매핑)
				list.add(new Member(rs.getInt(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getDate(5),
									rs.getString(6),
									rs.getString(7)));
			}
		}catch(SQLException e) {
			System.out.println("MemberDao selectAll 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		
		return list;
	}
	
	public List<Member> search(String col, String find) {
		List<Member> list = new ArrayList<Member>();
		String sql = "select * from member_tbl_02";
		switch(col) {
		case "a":
				sql +="where custname like '%; || ? || '%'";
				break;
		case "b":
			sql +="where custname like '%; || ? || '%'";
			break;
		case "c":
			sql +="where custname like '%; || ? || '%'";
			break;
		case "d":
			sql +="where custname like '%; || ? || '%'";
			break;
		}
		return list;
	}
	
	public List<Member> searchName(String name) {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt=null;
		String sql = "select * from member_tbl_02 where custname=?";
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//테이블 조회된 컬럼을 자바 객체로 생성해서 저장.(매핑)
				list.add(new Member(rs.getInt(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getDate(5),
									rs.getString(6),
									rs.getString(7)));
			}
		}catch(SQLException e) {
			System.out.println("MemberDao selectAll 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return list;
	}
	
}
