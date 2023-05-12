<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 UpdateProc.jsp -->
<% 
		String excode = request.getParameter("excode").trim();
		String bcode = request.getParameter("bcode").trim();
		String explace = request.getParameter("explace").trim();
		String exname = request.getParameter("exname").trim();
		String author = request.getParameter("author").trim();
		String exstart = request.getParameter("exstart").trim();
		String exend = request.getParameter("exend").trim();
		int excnt = Integer.parseInt(request.getParameter("excnt"));
		int price = Integer.parseInt(request.getParameter("price"));
		String tel = request.getParameter("tel").trim();
		String contents = request.getParameter("contents");
		String filename = request.getParameter("filename"); 
		
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
			out.println("<p>수정 실패</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else{
			out.println("<script>");
			out.println("		alert('게시글이 수정되었습니다.');");
			out.println(" 	location.href='exhibition_tab.jsp?excode=" + excode + ";");
			out.println("</script>");
		}//if end
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>