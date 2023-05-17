<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>
	
<div class="content">
<!-- 본문 시작 주문서.jsp -->
<% 
   String id    = request.getParameter("id").trim();
   String ordernum    = request.getParameter("ordernum").trim();
   String excode = request.getParameter("excode").trim();
   int amount = Integer.parseInt(request.getParameter("amount").trim());
   int price = Integer.parseInt(request.getParameter("price").trim());

   dto.setMid(id);
   dto.setOrdernum(ordernum);
   dto.setExcode(excode);
   dto.setAmount(amount);
   dto.setPrice(price);
   
   int cnt=dao.insert(dto);
   
   if(cnt==0){
      out.println("<p>예약에 실패했습니다</p>");
      out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
   }else{
      out.println("<script>");
      out.println("   alert('예약이 완료되었습니다.\n 예약내역은 마이페이지에서 확인하실 수 있습니다.');");
      out.println("   location.href='../my/myList.jsp';");
      out.println("</script>");
   }//if end



%>

<!-- 본문 끝 -->
</div>
   	
   	
<%@ include file="../footer.jsp" %>