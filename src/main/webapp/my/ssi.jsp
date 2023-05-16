<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%-- ssi.jsp 공통페이지 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.member.*" %>

<jsp:useBean id="dao" class="net.order.OrderDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.order.OrderDTO" scope="page"></jsp:useBean>


<%request.setCharacterEncoding("UTF-8"); %>

<%
	//현재페이지----------------------------------------------------
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){ //페이지가 null이 아니면
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
%>