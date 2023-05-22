<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="ssi.jsp" %>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 exhibition_tab.jsp -->
		    <div class=content_120_3>
            <div>
              <select class="location_9_113">
	              <option class="___9_114">위치</option>
	              <option class="___9_114">서울</option>
	              <option class="___9_114">과천</option>
	              <option class="___9_114">덕수궁</option>
	              <option class="___9_114">청주</option>
	              <option class="___9_114">어린이미술관</option>
              </select>
            </div>
            <div class="continue_9_145">
	            <span  class="__________9_146">
	            	현재 진행중 전시
	            </span>
            </div>
            <div>
	            <select class="newest_9_143">
	            	<option class="____9_144">최신순</option>
	            	<option class="____9_144">예매순</option>
	            </select>
            </div>
            <% 
            ArrayList<ExhibitDTO> list = dao.listNow(); 
            if(list==null){
              out.println("자료없음");
            }else{
            %>
            
            <div class=scroll_9_139>
            <!-- 
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
              <div>  -->
                <table>
		          <tr>
		          	<th style="text-align: left">전시장소</th>
		          	<th style="text-align: left">전시명</th>
		          	<th style="text-align: left">전시기간</th>
		          </tr>
<%
					for(int i=0; i<list.size(); i++){
						dto = list.get(i);
%>
				  <tr>

					<td style="text-align: left">
            <%if(dto.getBcode().equals("Seo")){out.print("서울");}else
					    if(dto.getBcode().equals("Gwa")){out.print("과천");}else
					    if(dto.getBcode().equals("Deok")){out.print("덕수궁");}else
				      if(dto.getBcode().equals("Cheong")){out.print("청주");}else
				      if(dto.getBcode().equals("Kid")){out.print("어린이박물관");}%>
           </td>
					<td style="text-align: left"><a href="exhibitRead.jsp?excode=<%=dto.getExcode()%>"><%=dto.getExname()%></a></td>
					<td style="text-align: left"><%=dto.getExstart().substring(0, 11)%> ~ <%=dto.getExend().substring(0, 11)%></td>
          </tr>
<%
					}
            }
%>
          		</table>   
            		<div class="exh_write"><a href="exhibitForm.jsp">[게시하기]</a></div>
                </div>
            </div>
          </div>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>