<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<div class="content">

	<%
	try {
		//1)첨부된 파일 저장
		String saveDirectory = application.getRealPath("/storage");
		int maxPostSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
		new DefaultFileRenamePolicy());

		//2) 1)에서 저장한 파일의 파일명, 파일크기 가져오기
		String filename = ""; //파일명
		//long fileSize = 0; //파일크기
		File file = null; //실제 파일 담기
		String item = ""; //name="filename"

		Enumeration files = mr.getFileNames(); //mr에서 <input type="file">을 전부 수거하기

		while (files.hasMoreElements()) { //여러개의 파일을 첨부하는 경우에 한개씩 처리하기
			item = (String) files.nextElement(); //name="filename"
			filename = mr.getFilesystemName(item);
			if (filename != null) { //실제 파일명을 가져왔다면
				file = mr.getFile(item); //mr에서 실제 파일 가져오기
				//if(file.exists()){ //파일이 존재한다면
					//fileSize = file.length(); //파일 크기 가져오기
				//}//if end
			} //if end
		} //while end
		
		
		//bname, bdays, bhour, boffday, btel
		//enctype="multipart/form-data"로 전송 시 request.getParameter가 아닌 multi.getParameter로 값 받아야 함
		String bname = mr.getParameter("bname").trim();

		String[] bdaysarr = mr.getParameterValues("bdays");
		String bdays = "";
		for (int i = 0; i < bdaysarr.length; i++) {
			bdays += bdaysarr[i];
			if (i < bdaysarr.length - 1) {
				bdays += ", ";
			} //if end
		} //for end

		String bhour = mr.getParameter("bhour1").trim() + "-" + mr.getParameter("bhour2").trim();

		String[] boffarr = mr.getParameterValues("boffday");
		String boffday = "";
		for (int i = 0; i < boffarr.length; i++) {
			boffday += boffarr[i];
			if (i < boffarr.length - 1) {
		boffday += ", ";
			} //if end
		} //for end

		String btel = mr.getParameter("btel").trim();

		dto.setBname(bname);
		dto.setBdays(bdays);
		dto.setBhour(bhour);
		dto.setBoffday(boffday);
		dto.setBtel(btel);
		dto.setBimg(filename);

		int cnt = dao.create(dto);

		if (cnt == 0) {
			out.println("<p>전시장 정보 작성을 실패했습니다.</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		} else {
			out.println("<script>");
			out.println("alert('전시장 정보가 추가되었습니다.');");
			out.println("location.href='boothList.jsp';");
			out.println("</script>");
		} // if end
		
	} catch (Exception e) {
		out.print(e);
		out.print("<p>게시 실패!!</p>");
		out.print("<a href='javascript:history.back();'>[다시시도]</a>");
	} //trycatch end
	%>
</div>

<%@ include file="../footer.jsp"%>