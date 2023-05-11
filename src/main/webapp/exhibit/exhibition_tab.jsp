<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibition_tab.jsp -->
		    <div class=content_120_3>
            <div class=location_9_113>
              <button onclick="display_mn()" class="___9_114">위치</button>
              <ul style="display: none;" id="drop_cont">
                <li>서울</li>
                <li>과천</li>
                <li>덕수궁</li>
                <li>청주</li>
                <li>어린이미술관</li>
              </ul>
            </div>
            
            <div class=continue_9_145><span  class="__________9_146">현재 진행중 전시</span></div>
            <div class=newest_9_143><span  class="____9_144">최신순</span></div>
            <% 
            ArrayList<ExhibitDTO> list = dao.list();
            if(list==null){
              out.println("자료없음");
            }
            %>
            <div class=scroll_9_139>
            <a href="exhibitForm.jsp">[게시하기]</a> <!-- 관리자만 보이게 -->
              <div class=component_8_121_36>
                <div class=component_1_121_35>
                  <div class="img"></div>
                  <div class=frame_8_i121_35_9_93><span  class="______________________i121_35_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_2_121_10>
                  <div class="img"></div>
                  <div class=frame_8_i121_10_9_93><span  class="______________________i121_10_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_3_121_14>
                  <div class="img"></div>
                  <div class=frame_8_i121_14_9_93><span  class="______________________i121_14_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_4_121_18>
                  <div class="img"></div>
                  <div class=frame_8_i121_18_9_93><span  class="______________________i121_18_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_5_121_22>
                  <div class="img"></div>
                  <div class=frame_8_i121_22_9_93><span  class="______________________i121_22_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_6_121_26>
                  <div class="img"></div>
                  <div class=frame_8_i121_26_9_93><span  class="______________________i121_26_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
                <div class=component_7_121_30>
                  <div class="img"></div>
                  <div class=frame_8_i121_30_9_93><span  class="______________________i121_30_9_100">전시 제목 : 전시 제목 : 전시 제목</span></div>
                </div>
              </div>
              <div>
                <table>
		          <tr>
		          	<th>전시장소</th>
		          	<th>전시명</th>
		          	<th>전시기간</th>
		          </tr>
<%
					for(int i=0; i<list.size(); i++){
						dto = list.get(i);
%>
				  <tr>
					<td style="text-align: left"><%=dto.getExplace()%></td>
					<td style="text-align: left"><a href="exhibitRead.jsp?excode=<%=dto.getExcode()%>"><%=dto.getExname()%></a></td>
					<td style="text-align: left"><%=dto.getExstart()%> ~ <%=dto.getExend()%></td>
<%
					}
%>
          		</table>   
                </div>
            </div>
          </div>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>