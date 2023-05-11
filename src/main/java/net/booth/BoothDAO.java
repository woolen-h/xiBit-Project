package net.booth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.notice.NoticeDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class BoothDAO {
	
		private DBOpen dbopen = null;
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		private StringBuilder sql = null;
		
		public BoothDAO() {
			dbopen = new DBOpen();
		} // end
	
		//쓰기
		public int create(BoothDTO dto) {
			int cnt = 0;

			try {
				con = dbopen.getConnection();

				sql = new StringBuilder();
				sql.append(" INSERT INTO exh_booth(bcode, bname, baddr, bdays, bhour, boffday, btel)");
				sql.append(" VALUES(noticeno_seq.nextval, ?, ?, ?, ?, ?, ?)");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getBname());
				pstmt.setString(2, dto.getBaddr());
				pstmt.setString(3, dto.getBdays());
				pstmt.setString(4, dto.getBhour());
				pstmt.setString(5, dto.getBoffday());
				pstmt.setString(6, dto.getBtel());
				
				cnt = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("전시장 정보 추가 실패: " + e);
			} finally {
				DBClose.close(con, pstmt);
			} // end
			return cnt;
		} // create() end
		
	
		
		public ArrayList<BoothDTO> list() {
			ArrayList<BoothDTO> list = null;
			
			try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
	            sql.append(" SELECT bcode, bname, baddr, bdays, bhour, boffday, btel ");
	            sql.append(" FROM exh_booth ");
	            //sql.append(" ORDER BY noticeno DESC ");
				
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					list=new ArrayList<>();
					do {
						BoothDTO dto=new BoothDTO(); //한줄담기
						dto.setBcode(rs.getString("bcode"));
						dto.setBname(rs.getString("bname"));
						dto.setBaddr(rs.getString("baddr"));
						dto.setBdays(rs.getString("bdays"));
						dto.setBhour(rs.getString("bhour"));
						dto.setBoffday(rs.getString("boffday"));
						dto.setBtel(rs.getString("btel"));
	                    list.add(dto);//list에 모으기
					}while(rs.next());
				}//if end			
			
	        }catch (Exception e) {
	            System.out.println("전시장 목록 실패:"+e);
	        }finally {
	            DBClose.close(con, pstmt, rs);
	        }//end
			return list;
		}//list() end
		
		
		
		public BoothDTO read(String bcode) {
			BoothDTO dto = null;
			try {
				con = dbopen.getConnection();

				sql = new StringBuilder();
				sql.append(" SELECT bname, baddr, bdays, bhour, boffday, btel");
				sql.append(" FROM exh_booth");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, bcode);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new BoothDTO();	//입력한 값 넣어주기
					//dto.setBcode(rs.getString("bcode"));
					dto.setBname(rs.getString("bname"));
					dto.setBaddr(rs.getString("baddr"));
					dto.setBdays(rs.getString("bdays"));
					dto.setBhour(rs.getString("bhour"));
					dto.setBoffday(rs.getString("boffday"));
					dto.setBtel(rs.getString("btel"));
				} // if end
			} catch (Exception e) {
				System.out.println("상세보기 실패: " + e);
			} finally {
				DBClose.close(con, pstmt, rs);
			} // end
			return dto;
		} // read() end
		
		
		
		public int update(BoothDTO dto) {
			int cnt = 0;

			try {
				con = dbopen.getConnection();

				StringBuilder sql = new StringBuilder();
				sql.append(" UPDATE exh_booth");
				sql.append(" SET bname=?, baddr=?, bdays=?, bhour=?, boffday=?, btel=?");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());

				pstmt.setString(1, dto.getBname());
				pstmt.setString(2, dto.getBaddr());
				pstmt.setString(3, dto.getBdays());
				pstmt.setString(4, dto.getBhour());
				pstmt.setString(5, dto.getBoffday());
				pstmt.setString(6, dto.getBtel());
				pstmt.setString(7, dto.getBcode());
				
				cnt = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("전시장 정보 수정 실패: " + e);
			} finally {
				DBClose.close(con, pstmt);
			} // end
			return cnt;
		} // update() end
		
		
		public int delete(BoothDTO dto) {
			int cnt = 0;

			try {
				con = dbopen.getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append(" DELETE FROM exh_booth");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getBcode());

				cnt = pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("전시장 정보 삭제 실패: " + e);
			} finally {
				DBClose.close(con, pstmt);
			} // end
			return cnt;
		} // delete() end
		
	
}//class end