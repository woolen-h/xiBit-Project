package net.booth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

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
				sql.append(" INSERT INTO exh_booth(bname, bdays, bhour, boffday, btel, bimg)");
				sql.append(" VALUES(?, ?, ?, ?, ?, ?)");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getBname());
				pstmt.setString(2, dto.getBdays());
				pstmt.setString(3, dto.getBhour());
				pstmt.setString(4, dto.getBoffday());
				pstmt.setString(5, dto.getBtel());
				pstmt.setString(6, dto.getBimg());
				
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
				
				StringBuilder sql = new StringBuilder();
	            sql.append(" SELECT bcode, bname, bdays, bhour, boffday, btel, bimg ");
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
						dto.setBdays(rs.getString("bdays"));
						dto.setBhour(rs.getString("bhour"));
						dto.setBoffday(rs.getString("boffday"));
						dto.setBtel(rs.getString("btel"));
						dto.setBimg(rs.getString("bimg"));
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
				sql.append(" SELECT bname, bdays, bhour, boffday, btel, bimg");
				sql.append(" FROM exh_booth");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, bcode);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new BoothDTO();	//입력한 값 넣어주기
					//dto.setBcode(rs.getString("bcode"));
					dto.setBname(rs.getString("bname"));
					dto.setBdays(rs.getString("bdays"));
					dto.setBhour(rs.getString("bhour"));
					dto.setBoffday(rs.getString("boffday"));
					dto.setBtel(rs.getString("btel"));
					dto.setBimg(rs.getString("bimg"));
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
				sql.append(" SET bname=?, bdays=?, bhour=?, boffday=?, btel=?, bimg=?");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());

				pstmt.setString(1, dto.getBname());
				pstmt.setString(2, dto.getBdays());
				pstmt.setString(3, dto.getBhour());
				pstmt.setString(4, dto.getBoffday());
				pstmt.setString(5, dto.getBtel());
				pstmt.setString(6, dto.getBimg());
				pstmt.setString(7, dto.getBcode());
				
				cnt = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("전시장 정보 수정 실패: " + e);
			} finally {
				DBClose.close(con, pstmt);
			} // end
			return cnt;
		} // update() end
		
		
		public int delete(String bcode, String saveDir) {
			int cnt = 0;

			try {
				
				//테이블의 행 삭제하기 전에, 삭제하고자 하는 파일명 가져온다
				//파일명을 변수에 옮겨두고 storage에서 변수와 동일한 이름을 찾아 이미지까지 삭제~~
				String filename="";
				BoothDTO oldDTO=read(bcode); //만들어둔 함수는 jsp뿐만 아니라 java에서도 쓸 수 있음
				if(oldDTO!=null) { //파일명이 있는 경우
					filename=oldDTO.getBimg();
				}//if end				
				
				con = dbopen.getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append(" DELETE FROM exh_booth");
				sql.append(" WHERE bcode=?");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, bcode);

				cnt = pstmt.executeUpdate();
				
				if(cnt==1) { //테이블에서 행삭제가 성공했으므로 첨부했던 파일도 삭제
					Utility.deleteFile(saveDir, filename);
				}//if end

			} catch (Exception e) {
				System.out.println("전시장 정보 삭제 실패: " + e);
			} finally {
				DBClose.close(con, pstmt);
			} // end
			return cnt;
		} // delete() end
		
	
}//class end