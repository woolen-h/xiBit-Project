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
						<select name="bname" id="bname">
							<option>-- 전시장 --</option>
							<option value="Seo">서울</option>
							<option value="Gwa">과천</option>
							<option value="Deok">덕수궁</option>
							<option value="Cheong">청주</option>
							<option value="Kid">어린이박물관</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>운영요일</th>
					<td>
						<input type="checkbox" name="bdays" value="월">월
						<input type="checkbox" name="bdays" value="화">화
						<input type="checkbox" name="bdays" value="수">수
						<input type="checkbox" name="bdays" value="목">목
						<input type="checkbox" name="bdays" value="금">금
						<input type="checkbox" name="bdays" value="토">토
						<input type="checkbox" name="bdays" value="일">일
					</td>
				</tr>
				<tr>
					<th>운영시간</th> <!-- bhour -->
					<td>
						<select name="bhour1" id="bhour1">
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>							
						</select>
						-
						<select name="bhour2" id="bhour2">
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>							
						</select>
					</td>
				</tr>
				<tr>
					<th>휴관일</th>
					<td>
						<input type="checkbox" name="boffday" value="월">월
						<input type="checkbox" name="boffday" value="화">화
						<input type="checkbox" name="boffday" value="수">수
						<input type="checkbox" name="boffday" value="목">목
						<input type="checkbox" name="boffday" value="금">금
						<input type="checkbox" name="boffday" value="토">토
						<input type="checkbox" name="boffday" value="일">일
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left">
						<input type="text" name="btel1" id="tel1" size="3" maxlength="3" required>
						-
						<input type="text" name="btel2" id="tel2" size="4" maxlength="4" required>
						-
						<input type="text" name="btel3" id="tel3" size="4" maxlength="4" required>
					</td>
				</tr>
				<!-- 
				<tr>
				    <th>첨부파일</th>
				    <td style="text-align: left">
				    	<input type="file" name="bimg" id="bimg" required>
				    </td>
				</tr>
				 --> 
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