<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3>전시장 수정</h3>
	
	<%
		String bcode = request.getParameter("bcode");
		dto = dao.read(bcode);
		
		if (dto == null) { 
			out.println("수정 실패");
		}
			else {
	%>
	
	<p>
		<a href="boothForm.jsp">[전시장 관련 글쓰기]</a>
		<a href="boothList.jsp">[전시장 목록]</a>
	</p>
	
	<div class="container">
		<form name="boothfrm" id="boothfrm" method="post" enctype="multipart/form-data" action="boothUpdateProc.jsp" onsubmit="return boothCheck()">
			<input type="hidden" name="bcode" value="<%=bcode%>">
			<table>
				<tr>
					<th>전시장 이름</th>
					<td>
					<%
					String bname = dto.getBname();
					%> 
					<select name="bname" id="bname" onchange="chageExcode(this.value);">
						<option value="Seo" <%if (bname.equals("Seo")) { out.print("selected"); }%>>[서울] 국립현대미술관</option>
						<option value="Gwa" <%if (bname.equals("Gwa")) { out.print("selected"); }%>>[과천] 국립현대미술관</option>
						<option value="Deok" <%if (bname.equals("Deok")) { out.print("selected"); }%>>[덕수궁] 국립현대미술관</option>
						<option value="Cheong" <%if (bname.equals("Cheong")) { out.print("selected"); }%>>[청주] 국립현대미술관</option>
						<option value="Kid" <%if (bname.equals("Kid")) { out.print("selected"); }%>>어린이미술관</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>운영요일</th>
					<td>
						<input type="text" name="bdays" id="bdays" value="<%=dto.getBdays()%>" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>운영시간</th>
					<td>
					<%
					String bhour1 = dto.getBhour().substring(0, 5);
					%>
						<!-- <input type="text" name="bhour" id="bhour" maxlength="50" value="<%=dto.getBhour()%>" required> -->
						<select name="bhour1" id="bhour1">
							<option value="09:00" <%if (bhour1.equals("09:00")) { out.print("selected"); }%>>09:00</option>
							<option value="10:00" <%if (bhour1.equals("10:00")) { out.print("selected"); }%>>10:00</option>
							<option value="11:00" <%if (bhour1.equals("11:00")) { out.print("selected"); }%>>11:00</option>
							<option value="12:00" <%if (bhour1.equals("12:00")) { out.print("selected"); }%>>12:00</option>
							<option value="13:00" <%if (bhour1.equals("13:00")) { out.print("selected"); }%>>13:00</option>
							<option value="14:00" <%if (bhour1.equals("14:00")) { out.print("selected"); }%>>14:00</option>							
						</select>
						-
					<%
					String bhour2 = dto.getBhour().substring(6);
					%>
						<select name="bhour2" id="bhour2">
							<option value="15:00" <%if (bhour2.equals("15:00")) { out.print("selected"); }%>>15:00</option>
							<option value="16:00" <%if (bhour2.equals("16:00")) { out.print("selected"); }%>>16:00</option>
							<option value="17:00" <%if (bhour2.equals("17:00")) { out.print("selected"); }%>>17:00</option>
							<option value="18:00" <%if (bhour2.equals("18:00")) { out.print("selected"); }%>>18:00</option>
							<option value="19:00" <%if (bhour2.equals("19:00")) { out.print("selected"); }%>>19:00</option>
							<option value="20:00" <%if (bhour2.equals("20:00")) { out.print("selected"); }%>>20:00</option>				
						</select>						
					</td>
				</tr>
				<tr>
					<th>휴관일</th>
					<td>
						<input type="text" name="boffday" id="boffday" value="<%=dto.getBoffday()%>" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left">
					<% String btel1 = dto.getBtel(); %>	<!-- 경기도 지역일 경우 substring 값 달라지는거 확인해보기 -->
						
						<input type="text" name="btel1" id="tel1" size="3" value="<%=dto.getBtel().substring(0, 2) %>" maxlength="3">	
						-
						<input type="text" name="btel2" id="tel2" size="4" value="<%=dto.getBtel().substring(3, 7) %>" maxlength="4">
						-
						<input type="text" name="btel3" id="tel3" size="4" value="<%=dto.getBtel().substring(8, 12) %>" maxlength="4">
					</td>
				</tr>
				<tr>
				    <th>첨부파일</th>
				    <td style="text-align: left">
				    	<input type="file" name="bimg" id="bimg">
				    </td>
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정"> 
						<input type="reset" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	<%
		} // if end
	%>		
	</div>
</div>

<script>

	function chageExcode() {
		let bname = $("#bname").val();
		
		if(bname == "Seo" || bname == "Kid") {
			$("#btel").val("02-3701-9500");
		} else if(bname == "Gwa") {
			$("#btel").val("02-2188-6000");
		} else if(bname == "Deok") {
			$("#btel").val("02-2022-0600");
		} else if(bname == "Cheong") {
			$("#btel").val("043-261-1400");
		} // if end
	} // chageExcode() end
	
</script>

<%@ include file="../footer.jsp" %>