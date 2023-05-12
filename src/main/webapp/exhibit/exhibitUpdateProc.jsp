<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitUpdateProc.jsp -->
<%	

		try{
			//1)첨부된 파일 저장
			String saveDirectory = application.getRealPath("/storage");
			//String saveDirectory = request.getSession().getServletContext().getRealPath("/storage");
			int maxPostSize = 1024 * 1024 * 10;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			
			//2) 1)에서 저장한 파일의 파일명, 파일크기 가져오기
			String fileName = ""; //파일명
			long fileSize = 0; //파일크기
			File file = null; //실제 파일 담기
			String item = ""; //name="filename"
			
			Enumeration files = mr.getFileNames(); //mr에서 <input type="file">을 전부 수거하기
			
			while(files.hasMoreElements()){ //여러개의 파일을 첨부하는 경우에 한개씩 처리하기
				item = (String)files.nextElement(); //name="filename"
				fileName = mr.getFilesystemName(item);
				if(fileName!=null){ //실제 파일명을 가져왔다면
					file = mr.getFile(item); //mr에서 실제 파일 가져오기
					if(file.exists()){ //파일이 존재한다면
						fileSize = file.length(); //파일 크기 가져오기
					}//if end
				}//if end
			}//while end
			
			//3) exh_info 테이블에 저장하기
			String excode = mr.getParameter("excode").trim();
			String bcode = mr.getParameter("bcode").trim();
			String explace = mr.getParameter("explace").trim();
			String exname = mr.getParameter("exname").trim();
			String author = mr.getParameter("author").trim();
			String exstart = mr.getParameter("exstart").trim();
			String exend = mr.getParameter("exend").trim();
			int excnt = Integer.parseInt(mr.getParameter("excnt"));
			int price = Integer.parseInt(mr.getParameter("price"));
			String tel = mr.getParameter("tel").trim();
			String contents = mr.getParameter("contents");
			String filename = fileName;
			
			dto.setExcode(excode);
			dto.setBcode(bcode);
			dto.setExplace(explace);
			dto.setExname(exname);
			dto.setAuthor(author);
			dto.setExstart(exstart);
			dto.setExend(exend);
			dto.setExcnt(excnt);
			dto.setPrice(price);
			dto.setTel(tel);
			dto.setContents(contents);
			dto.setFilename(filename);
			
			int cnt = dao.update(dto);
			
			if(cnt==0){
				out.println("<p>게시글 수정 실패</p>");
				out.println("<p><a href='javascript:history.back();'>[다시시도]</a></p>");
			}else{
				out.println("<script>");
				out.println(" 	alert('게시글을 수정했습니다.');");
				out.println(" 	location.href='exhibitRead.jsp?excode=" + excode + "';");
				out.println("</script>");
			}
		}catch(Exception e){
			out.print(e);
			out.print("<p>사진 올리기 실패!!</p>");
			out.print("<a href='javascript:history.back();'>[다시시도]</a>");
		}
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>