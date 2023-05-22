<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">
	<h3>전시장 안내</h3>
	<p><a href="boothForm.jsp">[글쓰기]</a></p>
	<div>
		<table>
			<tr>
				<th>전시장 이름</th>
				
				<th>전시장 지역</th>
			
				<th>운영 요일</th>
				
				<th>운영 시간</th>
				
				<th>휴관일</th>
			
				<th>전화번호</th>
		
			</tr>
			
<%	
			
			String bname=request.getParameter("bname");
			String baddr=request.getParameter("baddr");
			String bdays=request.getParameter("bdays");
			String bhour=request.getParameter("bhour");
			String boffday=request.getParameter("boffday");
			String btel=request.getParameter("btel");
		

			//list 가져오기
			ArrayList<BoothDTO> list = dao.list();
			
			
			if (list == null) {
				out.print("<tr>");
				out.print("<td colspan='3'>글 없음</td>");
				out.print("</tr>");
				out.print("</table>");
			} else {
				
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);	
				}//값자기 이걸 넣었더니 null에서 1로 값이 불러져왔어
				
				
				
				
			%>			
		<tr>
			<td>
			<a href="boothRead.jsp?bcode=<%=dto.getBcode()%>"><%=dto.getBname()%></a>			
			</td>	
			<td>
			<%=dto.getBaddr()%>			
			</td>
			<td>
			<%=dto.getBdays()%>			
			</td>
			<td>
			<%=dto.getBhour()%>			
			</td>
			<td>
			<%=dto.getBoffday()%>			
			</td>
			<td>
			<%=dto.getBtel()%>			
			</td>
		</tr>	


			
				
<%
			}
%>			
		
			
		</table>
	</div>
</div>

<%@ include file="../footer.jsp" %>