package net.zzim;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class ZzimDAO {

	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public ZzimDAO() {
		dbopen = new DBOpen();
	} // ZzimDAO() end

	public int create(String mid, int excode) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" INSERT INTO zzim(mid, excode)");
			sql.append(" VALUES(?, ?)");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			pstmt.setInt(2, excode);

			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("찜 추가 실패: " + e);
			
		} finally {
			DBClose.close(con, pstmt);
		} // try end
		
		return cnt;
	} // create() end

	public int delete(String mid, int excode) {
		int cnt = 0;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" DELETE FROM zzim");
			sql.append(" WHERE mid=? AND excode=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			pstmt.setInt(2, excode);

			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("찜 삭제 실패: " + e);
			
		} finally {
			DBClose.close(con, pstmt);
		} // try end
		
		return cnt;
	} // delete() end

	public ArrayList<ZzimDTO> list(String mid, int excode) {
		ArrayList<ZzimDTO> list = null;

		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" SELECT mid, excode");
			sql.append(" FROM zzim");
			sql.append(" WHERE mid=? AND excode=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			pstmt.setInt(2, excode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				// 전체 행을 저장
				do {
					// 커서가 가리키는 한 줄 저장
					ZzimDTO dto = new ZzimDTO();
					dto.setMid(rs.getString("mid"));
					dto.setExcode(rs.getInt("excode"));

					list.add(dto);
				} while (rs.next());
			} // if end

		} catch (Exception e) {
			System.out.println("찜 목록 실패: " + e);
		} // try end
		
		return list;
	} // list() end
	
	public ZzimDTO read(String mid, int excode) {
		ZzimDTO dto = null;
		
		try {
			con = dbopen.getConnection();

			sql = new StringBuilder();
			sql.append(" SELECT mid, excode");
			sql.append(" FROM zzim");
			sql.append(" WHERE mid=? AND excode=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mid);
			pstmt.setInt(2, excode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ZzimDTO();
				dto.setMid(rs.getString("mid"));
				dto.setExcode(rs.getInt("excode"));
			} // if end
		} catch (Exception e) {
			System.out.println("찜 추가11: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return dto;
	} // read() end
} // class end