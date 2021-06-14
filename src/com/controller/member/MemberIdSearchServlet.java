package com.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberIdSearchServlet
 */
@WebServlet("/MemberIdSearchServlet")
public class MemberIdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 파싱
		//데이터 파싱, servcie.idSearch(MemberDTO)
		String username = request.getParameter("username").trim();
		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();

		//받는 사람의 메일 주소
		String email1 = request.getParameter("email1").trim();
		String email2 = request.getParameter("email2").trim();
		
		//사용자이름, 폰 1,2,3, 번호가 일치하는 사람의 id값 가져오기(Mapper id= idSearch 사용) 
		MemberDTO dto = new MemberDTO();
		dto.setUsername(username);
		dto.setPhone1(phone1);
		dto.setPhone2(phone2);
		dto.setPhone3(phone3);

		MemberService service = new MemberService();
		String userid = service.idSearch(dto);
		String nextPage = null;
		//가져온 id가 없는 경우  idSearch.jsp로 화면 전환 메세지 전송 "전화번호 확인이 필요합니다."
		if(userid==null) {
			nextPage="MemberIdSearchUIServlet";
			request.setAttribute("mesg", "이름 또는 핸드폰이 등록되지 않은 정보");
		
		//가져온 id가 있을 경우
		} else {
			nextPage="SendMailServlet";
			request.setAttribute("mailTo", email1+"@"+email2); //받을 사람의 email 주소를 mailTo, xxx@naver.com으로 전송
			request.setAttribute("userid", userid); //userid, 사용자 id 전송
			//해당 내용 request에 담아서 전송
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
