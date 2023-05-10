package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeDAO() {
		dbopen = new DBOpen();
	} // end
	
	public int create(NoticeDTO dto) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" INSERT INTO notice(noticeno, category, subject, content)");
			sql.append(" VALUES(noticeno_seq.nextval, ?, ?, ?)");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("공지사항 행 추가 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // create() end
	
	public ArrayList<NoticeDTO> list3(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<NoticeDTO> list = null;

		int startRow = ((nowPage - 1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;

		try {
			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			word = word.trim();

			if (word.length() == 0) {
				sql.append(" SELECT *");
				sql.append(" FROM (");
				sql.append(" SELECT noticeno, category, subject, regdate, rownum AS r");
				sql.append(" FROM (");
				sql.append(" SELECT noticeno, category, subject, regdate");
				sql.append(" FROM notice");
				sql.append(" ORDER BY regdate DESC");
				sql.append(" )");
				sql.append(" )");
				sql.append(" WHERE r >= " + startRow + "AND r <= " + endRow);
			} else {
				sql.append(" SELECT *");
				sql.append(" FROM (");
				sql.append(" SELECT noticeno, category, subject, regdate, rownum as r");
				sql.append(" FROM (");
				sql.append(" SELECT noticeno, category, subject, regdate");
				sql.append(" FROM notice");
				
				String search = "";
				
				if (word.length() >= 1) { // 검색어가 존재한다면
					if (col.equals("subject_content")) {
						search += " WHERE subject LIKE '%" + word + "%'";
						search += " OR content LIKE '%" + word + "%'";
					} else if (col.equals("subject")) {
						search += " WHERE subject LIKE '%" + word + "%'";
					} else if (col.equals("content")) {
						search += " WHERE content LIKE '%" + word + "%'";
					} else if (col.equals("wname")) {
						search += " WHERE wname LIKE '%" + word + "%'";
					}
				} // if end
				
				sql.append(search);
				
				sql.append(" ORDER BY regdate DESC");
				sql.append(" )");
				sql.append(" )");
				sql.append(" WHERE r >= " + startRow + "AND r <= " + endRow);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				// 전체 행을 저장
				do {
					// 커서가 가리키는 한 줄 저장
					NoticeDTO dto = new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setCategory(rs.getString("category"));
					dto.setSubject(rs.getString("subject"));
					dto.setRegdate(rs.getString("regdate"));

					list.add(dto); // list 저장
				} while (rs.next());
			} else {
				list = null;
			} // if end
		} catch (Exception e) {
			System.out.println("공지사항 목록 페이징 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return list;
	} // list3() end
	
	public int count2(String col, String word) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt");
			sql.append(" FROM notice");

			if (word.length() >= 1) { // 검색어가 존재한다면
				String search = "";
				if (col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%'";
					search += " OR content LIKE '%" + word + "%'";
				} else if (col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				} else if (col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%'";
				} else if (col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				}
				sql.append(search);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end

		} catch (Exception e) {
			System.out.println("검색 글 개수 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	} // count2() end
	
	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;
		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" SELECT category, subject, content, regdate");
			sql.append(" FROM notice");
			sql.append(" WHERE noticeno=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new NoticeDTO();
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			} // if end
		} catch (Exception e) {
			System.out.println("상세보기 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return dto;
	} // read() end
	
	public int update(NoticeDTO dto) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE notice");
			sql.append(" SET category=?, subject=?, content=?");
			sql.append(" WHERE noticeno=?");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNoticeno());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("공지사항 수정 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // update() end
	
	public int delete(NoticeDTO dto) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" DELETE FROM notice");
			sql.append(" WHERE Noticeno=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNoticeno());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("공지사항 삭제 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // delete() end
} // class end