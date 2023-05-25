package net.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/idCheckProc.do")
public class IdCheck extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		MemberDAO dao = new MemberDAO();
		String mid = request.getParameter("mid");
		PrintWriter out = response.getWriter();
		
		
		int cnt = dao.duplecateID(mid);
		
		if (cnt==1) {
			System.out.println("존재하는 아이디 입니다");
		}else if (cnt==0) {
			System.out.println("사용 가능한 아이디입니다");
		}//if end
		
		out.write(cnt+"");
	}
}//class end
