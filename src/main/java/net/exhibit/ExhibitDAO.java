package net.exhibit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class ExhibitDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public ExhibitDAO() {
		dbopen = new DBOpen();
	}

	// 목록 조회
	public ArrayList<ExhibitDTO> list() {
		ArrayList<ExhibitDTO> list = null;

		try {
			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT excode, bcode, exname, author, exstart, exend, excnt, price, tel, contents, filename ");
			sql.append(" FROM exh_info ");
			sql.append(" ORDER BY exstart ASC ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					ExhibitDTO dto = new ExhibitDTO();
					dto.setExcode(rs.getInt("excode"));
					dto.setBcode(rs.getString("bcode"));
					dto.setExname(rs.getString("exname"));
					dto.setAuthor(rs.getString("author"));
					dto.setExstart(rs.getString("exstart"));
					dto.setExend(rs.getString("exend"));
					dto.setExcnt(rs.getInt("excnt"));
					dto.setPrice(rs.getInt("price"));
					dto.setTel(rs.getString("tel"));
					dto.setContents(rs.getString("contents"));
					dto.setFilename(rs.getString("filename"));
					list.add(dto);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("목록 조회 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}// list end

	
	public ArrayList<ExhibitDTO> listNow(){
		ArrayList<ExhibitDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT excode, bcode, exname, author, exstart, exend, excnt, price, tel, contents, filename ");
	         sql.append(" FROM exh_info ");
	         sql.append(" WHERE now() <= exend AND now() >= exstart");
	         sql.append(" ORDER BY exstart ASC ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExhibitDTO dto = new ExhibitDTO();
					dto.setExcode(rs.getInt("excode"));
					dto.setBcode(rs.getString("bcode"));
					dto.setExname(rs.getString("exname"));
					dto.setAuthor(rs.getString("author"));
					dto.setExstart(rs.getString("exstart"));
					dto.setExend(rs.getString("exend"));
					dto.setExcnt(rs.getInt("excnt"));
					dto.setPrice(rs.getInt("price"));
					dto.setTel(rs.getString("tel"));
					dto.setContents(rs.getString("contents"));
					dto.setFilename(rs.getString("filename"));
					list.add(dto);					
				}while(rs.next());
			}else {
				list = null;
			}			
		}catch(Exception e) {
			System.out.println("목록 조회 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}//listNow end
	
	public ArrayList<ExhibitDTO> listFuture(){
		ArrayList<ExhibitDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT excode, bcode, exname, author, exstart, exend, excnt, price, tel, contents, filename ");
	         sql.append(" FROM exh_info ");
	         sql.append(" WHERE exstart > now() ");
	         sql.append(" ORDER BY exstart ASC ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExhibitDTO dto = new ExhibitDTO();
					dto.setExcode(rs.getInt("excode"));
					dto.setBcode(rs.getString("bcode"));
					dto.setExname(rs.getString("exname"));
					dto.setAuthor(rs.getString("author"));
					dto.setExstart(rs.getString("exstart"));
					dto.setExend(rs.getString("exend"));
					dto.setExcnt(rs.getInt("excnt"));
					dto.setPrice(rs.getInt("price"));
					dto.setTel(rs.getString("tel"));
					dto.setContents(rs.getString("contents"));
					dto.setFilename(rs.getString("filename"));
					list.add(dto);					
				}while(rs.next());
			}else {
				list = null;
			}			
		}catch(Exception e) {
			System.out.println("목록 조회 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}//listFuture() end
	
	public ArrayList<ExhibitDTO> listPast(){
		ArrayList<ExhibitDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT excode, bcode, exname, author, exstart, exend, excnt, price, tel, contents, filename ");
	         sql.append(" FROM exh_info ");
	         sql.append(" WHERE now() > exend ");
	         sql.append(" ORDER BY exstart ASC ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExhibitDTO dto = new ExhibitDTO();
					dto.setExcode(rs.getInt("excode"));
					dto.setBcode(rs.getString("bcode"));
					dto.setExname(rs.getString("exname"));
					dto.setAuthor(rs.getString("author"));
					dto.setExstart(rs.getString("exstart"));
					dto.setExend(rs.getString("exend"));
					dto.setExcnt(rs.getInt("excnt"));
					dto.setPrice(rs.getInt("price"));
					dto.setTel(rs.getString("tel"));
					dto.setContents(rs.getString("contents"));
					dto.setFilename(rs.getString("filename"));
					list.add(dto);					
				}while(rs.next());
			}else {
				list = null;
			}			
		}catch(Exception e) {
			System.out.println("목록 조회 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}//listFuture() end

	public int create(ExhibitDTO dto) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO exh_info (bcode, exname, author, exstart, exend, excnt, price, tel, contents, filename) ");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getBcode());
      pstmt.setString(2, dto.getExname());
      pstmt.setString(3, dto.getAuthor());
      pstmt.setString(4, dto.getExstart());
      pstmt.setString(5, dto.getExend());
      pstmt.setInt(6, dto.getExcnt());
      pstmt.setInt(7, dto.getPrice());
      pstmt.setString(8, dto.getTel());
      pstmt.setString(9, dto.getContents());
      pstmt.setString(10, dto.getFilename());

			cnt = pstmt.executeUpdate();

			//System.out.println(dto.toString());
		} catch (Exception e) {
			System.out.println("게시 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;

	}//create() end

	// 상세보기
	public ExhibitDTO read(int excode) {
		ExhibitDTO dto = null;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" SELECT excode, bcode, exname, contents, author, exstart, exend, excnt, price, tel, filename ");
			sql.append(" FROM exh_info ");
			sql.append(" WHERE excode = ? ");

			pstmt = con.prepareStatement(sql.toString());
      
			pstmt.setInt(1,excode);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ExhibitDTO();
				dto.setExcode(rs.getInt("excode"));
				dto.setBcode(rs.getString("bcode"));
				dto.setExname(rs.getString("exname"));
				dto.setContents(rs.getString("contents"));
				dto.setAuthor(rs.getString("author"));
				dto.setExstart(rs.getString("exstart"));
				dto.setExend(rs.getString("exend"));
				dto.setExcnt(rs.getInt("excnt"));
				dto.setPrice(rs.getInt("price"));
				dto.setTel(rs.getString("tel"));
				dto.setFilename(rs.getString("filename"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}// read() end

	// 수정
	public int update(ExhibitDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE exh_info ");

			sql.append(" SET bcode = ?, exname=?, contents=?, author=?, exstart=?, exend=?, excnt=?, price=?, tel=? , filename=? ");
			sql.append(" WHERE excode = ? ");

			pstmt = con.prepareStatement(sql.toString());
      
			pstmt.setString(1,dto.getBcode());
			pstmt.setString(2,dto.getExname());
			pstmt.setString(3,dto.getContents());
			pstmt.setString(4,dto.getAuthor());
			pstmt.setString(5,dto.getExstart());
			pstmt.setString(6,dto.getExend());
			pstmt.setInt(7,dto.getExcnt());
			pstmt.setInt(8,dto.getPrice());
			pstmt.setString(9,dto.getTel());
			pstmt.setString(10,dto.getFilename());
			pstmt.setInt(11, dto.getExcode());
			
			cnt = pstmt.executeUpdate();
			
			//System.out.println(dto);
		}catch(Exception e) {

			System.out.println("수정 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}//update() end

	// 삭제
	public int delete(int excode, String saveDir) {

		int cnt = 0;
		try {
			String filename = "";
			ExhibitDTO oldDTO = read(excode);
			if (oldDTO != null) {
				filename = oldDTO.getFilename();
			}

			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append(" DELETE FROM exh_info ");
			sql.append(" WHERE excode = ? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, excode);

			cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				Utility.deleteFile(saveDir, filename);
			}
		} catch (Exception e) {
			System.out.println("삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}// delete() end
}// class end
