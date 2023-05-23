package net.order;
//주문서
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			sql.append(" SELECT excode, ordernum, amount, price, sdate ");
			sql.append(" FROM exh_order ");
			sql.append(" WHERE mid=? ");
			sql.append(" ORDER BY ordernum DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list=new ArrayList<>();
				do {
					OrderDTO dto = new OrderDTO();
					dto.setExcode(rs.getInt("excode"));
					dto.setOrdernum(rs.getString("ordernum"));
					dto.setAmount(rs.getInt("amount"));
					dto.setPrice(rs.getString("price"));
					dto.setSdate(rs.getString("sdate"));
					list.add(dto);
				}while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("예매내역조회 실패"+e);
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
			sql.append(" INSERT INTO exh_order(mid, ordernum, excode, amount, price, sdate) ");
	        sql.append(" VALUES (?,?,?,?,?,?) ");
	      
	         
	        pstmt=con.prepareStatement(sql.toString());
	        pstmt.setString(1, dto.getMid());
	        pstmt.setString(2, dto.getOrdernum());
	        pstmt.setInt(3, dto.getExcode());
	        pstmt.setInt(4, dto.getAmount());
	        pstmt.setString(5, dto.getPrice());                                                                                                    
	        pstmt.setString(6, dto.getSdate());                                                                                                    
	         
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("행추가 실패 :"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	public OrderDTO read(String ordernum) {
		OrderDTO dto=null;
		
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mid, ordernum, excode, amount, price, sdate ");		
			sql.append(" FROM exh_order ");		
			sql.append(" WHERE ordernum=? ");		
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, ordernum);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new OrderDTO();
				dto.setMid(rs.getString("mid"));
				dto.setOrdernum(rs.getString("ordernum"));
				dto.setExcode(rs.getInt("excode"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getString("price"));
				dto.setSdate(rs.getString("sdate"));
				
			}//if end			
			
		} catch (Exception e) {
			System.out.println("주문서보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end		
		return dto;	
	}//read() end
	
	
	public int delete(OrderDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" DELETE FROM exh_order ");
			sql.append(" WHERE ordernum=? AND mid=?");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getOrdernum());
			pstmt.setString(2, dto.getMid());
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("예매취소 실패 :"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
}
