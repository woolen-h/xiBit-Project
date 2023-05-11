<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<div class="content">

	<h3>전시장</h3>
	<p><a href="boothList.jsp">[목록]</a></p>
	
	<div class="container">
		<form name="boothfrm" id="boothfrm" method="post" action="boothIns.jsp" onsubmit="return boothCheck()">
			<table>
				<tr>
					<th>전시장 이름</th>
					<td>
						 <input type="text" name="bname" id="bname" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>전시장 지역</th>
					<td>
						<input type="text" name="baddr" id="baddr" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>운영요일</th>
					<td>
						<input type="text" name="bdays" id="bdays" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>운영시간</th>
					<td>
						<input type="text" name="bhour" id="bhour" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>휴관일</th>
					<td>
						<input type="text" name="boffday" id="boffday" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left">
						<input type="text" name="btel1" id="tel1" size="3" maxlength="3">
						-
						<input type="text" name="btel2" id="tel2" size="4" maxlength="4">
						-
						<input type="text" name="btel3" id="tel3" size="4" maxlength="4">
					</td>
				</tr> 
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="쓰기"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<%@ include file="../footer.jsp" %>