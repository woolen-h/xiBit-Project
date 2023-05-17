<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<h1>DB</h2>
<%
    	Connection conn=null;
    	try{
           	String Url="jdbc:mysql://xibit-database.ceb8v0zy9x56.ap-northeast-2.rds.amazonaws.com";
           	String Id="admin";
               // aws의 초기 계정이름은 ec2-user이다
           	String Pass="admin1234";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(Url,Id,Pass);
           	out.println("xiBit-database Connection Success!");
    	}catch(Exception e) {
           	e.printStackTrace();
}
%>