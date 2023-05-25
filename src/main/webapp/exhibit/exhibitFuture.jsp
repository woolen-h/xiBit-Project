<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<div class="content">
	<!-- 본문 시작 exhibition_tab.jsp -->
	<%
	if (s_mlevel.equals("A1")) {
	%>
	<div class="exh_write">
		<input class="button" value="게시하기" onclick="location.href='exhibitForm.jsp'"> 
	</div>
	<%
	}
	%>
	    <div class=content_120_3>
           <div class=ex_top_bar>
           	<div>
           		<input class="button" value="과거 전시" onclick="location.href='exhibitPast.jsp'">
            </div>
            <div class="continue_9_145">
	            <span  class="__________9_146" style="font-weight:bold; font-size:20pt">
	            	예정 전시
	            </span>
            </div>
            
	        <div>
           		<input class="button" value="현재 전시" onclick="location.href='exhibition_tab.jsp'">
            </div>
	        
           </div>
		<%
		ArrayList<ExhibitDTO> list = dao.listFuture();
		if (list == null) {
			out.println("자료없음");
		} else {
		%>

		<div class=scroll_9_139>
			<div class="component_8_121_36">

				<%
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
				%>
				
				<!-- 추가해야 할 설정: 한 줄에 몇 개씩 출력할 건지? -->

				<div class="component_1_121_35" onclick="location.href='exhibitRead.jsp?excode=<%=dto.getExcode()%>'">
					
					<img class="img" src="https://xibit-bucket.s3.ap-northeast-2.amazonaws.com/<%=dto.getFilename()%>">
					
					<div class=frame_8_i121_35_9_93>
						<span class="______________________i121_35_9_100">
						
						[<%if(dto.getBcode().equals("Seo")){out.print("서울");}else
					       if(dto.getBcode().equals("Gwa")){out.print("과천");}else
					       if(dto.getBcode().equals("Deok")){out.print("덕수궁");}else
				           if(dto.getBcode().equals("Cheong")){out.print("청주");}else
				           if(dto.getBcode().equals("Kid")){out.print("어린이박물관");}%>]
						 <%=dto.getExname()%><br>
						 <%=dto.getExstart().substring(2, 11)%> ~ 
						 <%=dto.getExend().substring(2, 11)%>
						
						</span>
					</div>
				</div>
				<%
				} // for end
				} // if end
				%>
				</div>
		</div>
	</div>
	<!-- 본문 끝 -->
</div>
<%@ include file="../footer.jsp"%>