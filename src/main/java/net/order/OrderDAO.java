package net.order;

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
	
	public OrderDAO() { //기본생성자
		dbopen=new DBOpen();
	}
	
	
	//예약내역
	//전시포스터, 예매번호, 전시명, 관람일시(내가 예약한 날), 관람인원, 가격, 관람장소
	public ArrayList<OrderDTO> list(int nowPage, int recordPerPage, String id){
		ArrayList<OrderDTO> list=null;
		
		//페이지당 출력할 행의 갯수(10개를 기준)
        //1 페이지 : WHERE r>=1  AND r<=10;
        //2 페이지 : WHERE r>=11 AND r<=20;
        //3 페이지 : WHERE r>=21 AND r<=30;
		
		int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
		
        try {
        	con=dbopen.getConnection();
        	sql=new StringBuilder();
    
        	//주문서+주문서상세
        	//sql문작성
        	
        	pstmt=con.prepareStatement(sql.toString());
        	pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list=new ArrayList<>();
				do {
					OrderDTO dto=new OrderDTO();
					//dto 값 넣기
					
					list.add(dto);
				}while(rs.next());
			}
        } catch (Exception e) {
			System.out.println("전체목록실패 :"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}
	
	//예매정보
	//예매자, 휴대폰, 예매일시, 티켓금액
	//취소마감시간
	
}
