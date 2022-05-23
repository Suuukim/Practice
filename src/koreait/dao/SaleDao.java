package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import koreait.OracleConnectUtil;
import koreait.vo.SaleSum;

public class SaleDao {
	private static SaleDao dao = new SaleDao();
	private SaleDao() {
		
	}
	public static SaleDao getInstance() {
		return dao;
	}
	
	public List<SaleSum> selectSale() {
		Connection conn = OracleConnectUtil.connect();
		String sql="SELECT mt.CUSTNO, CUSTNAME," +
					"decode(grade, 'A','VIP','B','일반','C','직원') AS agrade," +
					"(SELECT custno, sum(price) AS asum FROM Money_TBL_02 mt " +
					"GROUP BY CUSTNO" +
					"ORDER BY asum desc) sale" +
					"WHERE mt.CUSTNO = sale.custno ORDER BY asum desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();			//select
			
			while(rs.next()) {
				SaleSum temp = new SaleSum(rs.getInt(1),
								rs.getNString(2), rs.getNString(3), rs.getInt(4));
				sales.add(temp);
			}
			pstmt.close();
		}catch(SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
	
}
