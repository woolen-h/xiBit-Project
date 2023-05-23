<%@page import="javax.swing.JTree.DynamicUtilTreeNode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp --%>
<%-- 공통되는 페이지를 모아둠--%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.utility.*" %>
<%@ page import="net.exhibit.*" %>

<jsp:useBean id="dao" class="net.exhibit.ExhibitDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.exhibit.ExhibitDTO" scope="page"></jsp:useBean>

<jsp:useBean id="daoz" class="net.zzim.ZzimDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dtoz" class="net.zzim.ZzimDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<%
	//검색 (혹시몰라서 ~~)--------------------------------------------------------
	String word = request.getParameter("word"); //검색어 가져오기
	String col = request.getParameter("col"); //검색컬럼 가져오기
	
	//문자열 값이 null이면 빈 문자열로 치환 
	word = Utility.checkNull(word);
	col = Utility.checkNull(col); 
	
	
	//현재페이지----------------------------------------------------
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}//if end
%>