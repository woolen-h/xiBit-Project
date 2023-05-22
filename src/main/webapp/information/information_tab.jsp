<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
        <div class="content">
        <!-- 본문 시작 information_table.jsp -->
	        <div class="info_content">
		        <div class="info_tb_list">
		        	<ul>
		        		<li class="fa_qna"><a>자주 묻는 질문</a></li>
		        	</ul>
			        <ul>	
				        <li class="info_qna_h">전시 문의</li>
				        <li class="info_qna_d"><a>전체</a></li>
				        <li class="info_qna_d"><a>전시 1</a></li>
				        <li class="info_qna_d"><a>전시 2</a></li>
			        </ul>
			        <ul>
				        <li class="info_qna_h">예약 문의</li>
				        <li class="info_qna_d"><a>전체</a></li>
				        <li class="info_qna_d"><a>전시 1</a></li>
				        <li class="info_qna_d"><a>전시 2</a></li>
			        </ul>
		        </div>
		        <div class="info_tb_container">
			        <div class="info_tb_search">
		        		<input type="text">
		        	</div>
					<table class="info_tb">
						<thead>
							<tr>
								<th class="tb_num">1.</th>
								<th>[공지]글제목입니다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>[공지]글내용입니다.</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th class="tb_num">2.</th>
								<th>[이벤트]글제목입니다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>[이벤트]글내용입니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
        <!-- 본문 끝 -->
        </div>
    <%@ include file="../footer.jsp" %>