<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibitRead.jsp -->
		<h3 class="booth_title"> 전시 상세보기 </h3>
		<div><a href="javascript:history.back()" class="exh_list_btn1">목록</a></div>
<%
		int excode = Integer.parseInt(request.getParameter("excode"));		
		dto = dao.read(excode);
		if(dto==null){
			out.print("글 없음");
		}else{
%>
		<div class="exh_cont">
			<table>
				<tr>
				<td class="exh_read_flex">
					<div>
						<img class="exh_poster" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dto.getFilename()%>">
					</div>
					<div class="exh_read_tb">
						<table>
							<tr>
								<th>전시명</th>
								<td><%=dto.getExname()%></td>
							</tr>
							<tr>
								<th>전시장소</th>
								<td>
								<%if(dto.getBcode().equals("Seo")){out.print("서울");}else
						       	  if(dto.getBcode().equals("Gwa")){out.print("과천");}else
						       	  if(dto.getBcode().equals("Deok")){out.print("덕수궁");}else
					           	  if(dto.getBcode().equals("Cheong")){out.print("청주");}else
					           	  if(dto.getBcode().equals("Kid")){out.print("어린이박물관");}%>
					           	</td>
							</tr>
							<tr>
								<th>문의번호</th>
								<td><%=dto.getTel()%></td>
							</tr>
							<tr>
								<th>작가</th>
								<td><%=dto.getAuthor()%></td>
							</tr>
							<tr>
								<th>작품수</th>
								<td><%=dto.getExcnt()%> 점</td>
							</tr>
							<tr>
								<th>예매가</th>
								<td>
<%
								DecimalFormat df = new DecimalFormat("#,###");
								String price = df.format(dto.getPrice());
%>
								<%=price%> 원</td>
							</tr>
						</table>
					</div>
				</td>
				</tr>
				<tr>
					<td class="exh_read_content">
<%
					//특수문자 및 엔터 그대로 받을수 있게 문자 치환하기
					String content = Utility.convertChar(dto.getContents());
					out.print(content);
%>
					</td>
				</tr>
			</table>
		</div>
			<!-- 버튼 -->
			<br>
			<div class="zzim_flex">
<%
			if (s_mlevel.equals("A1")) {
%>
			<div class="exh_edit_btn">
			<input type="button" class="exh_list_btn4" value="수정" onclick="location.href='exhibitUpdate.jsp?excode=<%=excode%>'">
			<!-- <input type="button" class="button" value="삭제" onclick="return deleteCheck()">  -->
			<input type="button" class="exh_list_btn3" value="삭제" onclick="location.href='exhibitDel.jsp?excode=<%=excode%>'"> 
			</div>
<%
			}
%>
<%			
			if(!s_mid.equals("guest")) {%><!-- 로그인했을때만 노출 -->	
				<!-- 예매버튼 -->
<%
				//오늘날짜 문자열로 구하기
				String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
				
				// yyyy-mm-dd 포맷으로 변경
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				Date today = new Date(dateFormat.parse(todayfm).getTime()); //오늘날짜
				Date exend = new Date(dateFormat.parse(dto.getExend()).getTime()); //exend 날짜
				Date exstart = new Date(dateFormat.parse(dto.getExstart()).getTime()); //exstart 날짜
				
				int compare1 = exend.compareTo(today); //오늘날짜와 exend날짜 비교 -- exend가 오늘 날짜보다 크면 1 / 같으면 0 / 작으면 -1 출력
				int compare2 = exstart.compareTo(today); //오늘날짜와 exstart날짜 비교 -- exend가 오늘 날짜보다 크면 1 / 같으면 0 / 작으면 -1 출력
				
				if(compare1>=0){ 
			
%>
					<input class="exh_list_btn2" type="button" value="예매하기" onclick="location.href='../order/orderForm.jsp?excode=<%=excode%>'">
					<div class="right_area">
					  <a href="javascript:;" class="icon heart">
							<%if(daoz.read(s_mid, excode) == null) {%>
								<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" onclick="location.href='zzimIns.jsp?excode=<%=excode%>'">
							<%} else {%>
								<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" onclick="location.href='zzimIns.jsp?excode=<%=excode%>'">
							<%}%>
					  </a>
					</div>

			</div>
<%
				}		
			}		
		}
%>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>