<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<div class="content">
	<!-- 본문 시작 exhibition_tab.jsp -->
	    <div class=content_120_3>
           <div class=ex_top_bar>
           	<select class="location_9_113">
              <option class="___9_114">위치</option>
              <option class="___9_114">서울</option>
              <option class="___9_114">과천</option>
              <option class="___9_114">덕수궁</option>
              <option class="___9_114">청주</option>
              <option class="___9_114">어린이미술관</option>
           	</select>
            <div class="continue_9_145">
	            <span  class="__________9_146">
	            	현재 진행중 전시
	            </span>
            </div>
	        <select class="newest_9_143">
            	<option class="____9_144">최신순</option>
            	<option class="____9_144">예매순</option>
	        </select>
           </div>
		<%
		ArrayList<ExhibitDTO> list = dao.listNow();
		if (list == null) {
			out.println("자료없음");
		} else {
		%>

		<div class=scroll_9_139>
			<div class=component_8_121_36>

				<%
				for (int i = 0; i < list.size(); i++) {
					dto = list.get(i);
				%>
				
				<!-- 추가해야 할 설정: 한 줄에 몇 개씩 출력할 건지? -->

				<div class="component_1_121_35">
					
					<img class="img" src="../storage/<%=dto.getFilename()%>">
					
					<div class=frame_8_i121_35_9_93>
						<span class="______________________i121_35_9_100"><a href="exhibitRead.jsp?excode=<%=dto.getExcode()%>"><%=dto.getExname()%></a></span>
					</div>
				</div>

				<%
				} // for end
				} // if end
				%>
			</div>
				<div class="exh_write">
					<a href="exhibitForm.jsp">[게시하기]</a>
				</div>
		</div>
	</div>
	<!-- 본문 끝 -->
</div>
<%@ include file="../footer.jsp"%>