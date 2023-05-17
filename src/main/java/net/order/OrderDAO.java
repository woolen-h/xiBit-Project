package net.order;
//주문서
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.order.OrderDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class OrderDAO {
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public OrderDAO() { 
		dbopen=new DBOpen();
	}
	
	//예약된 전시 예약최신순으로 조회
	public ArrayList<OrderDTO> list(String mid){
		ArrayList<OrderDTO> list=null;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT excode ");
			sql.append(" FROM exh_order ");
			sql.append(" WHERE mid=? ");
			sql.append(" ORDER BY ordernum DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list=new ArrayList<OrderDTO>();
				do {
					OrderDTO dto = new OrderDTO();
					dto.setExcode(rs.getString("excode"));
					list.add(dto);
				}while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("결제내역조회 실패"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}
	
	public int insert(OrderDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO order(mid, ordernum, excode, amount, price) ");
	        sql.append(" VALUES (?,?,?,?,?) ");
	      
	         
	        pstmt=con.prepareStatement(sql.toString());
	        pstmt.setString(1, dto.getMid());
	        pstmt.setString(2, dto.getOrdernum());
	        pstmt.setString(3, dto.getExcode());
	        pstmt.setInt(4, dto.getAmount());
	        pstmt.setInt(5, dto.getPrice());                                                                                                    
	         
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("행추가 실패 :"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	public OrderDTO read(String mid) {
		OrderDTO dto=null;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mid, passwd, mname, jomin1, jomin2, email, tel, mlevel, mdate ");		
			sql.append(" FROM member ");		
			sql.append(" WHERE mid=? ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new OrderDTO();
				
			}//if end			
			
		} catch (Exception e) {
			System.out.println("회원정보보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return dto;	
	}//read() end
}
