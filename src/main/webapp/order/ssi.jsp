<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%-- ssi.jsp 공통페이지 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>
<%@ page import="net.order.*" %>
<%@ page import="net.member.*" %>
<%@ page import="net.exhibit.*" %>

<jsp:useBean id="dao" class="net.order.OrderDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.order.OrderDTO" scope="page"></jsp:useBean>

<jsp:useBean id="daoE" class="net.exhibit.ExhibitDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dtoE" class="net.exhibit.ExhibitDTO" scope="page"></jsp:useBean>

<jsp:useBean id="daoM" class="net.member.MemberDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dtoM" class="net.member.MemberDTO" scope="page"></jsp:useBean>


<%request.setCharacterEncoding("UTF-8"); %>

<%
	//현재페이지----------------------------------------------------
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){ //페이지가 null이 아니면
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
%>