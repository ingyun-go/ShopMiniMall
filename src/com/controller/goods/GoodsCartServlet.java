package com.controller.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.GoodsService;
import com.service.MemberService;

/**
 * Servlet implementation class GoodsListServlet
 */
@WebServlet("/GoodsCartServlet")
public class GoodsCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션에서 로그인 여부 검사
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String nextPage = null;
		
		//데이터 파싱
		if(dto!=null) {
			String userid = dto.getUserid();
			String gCode = request.getParameter("gCode");
			String gName = request.getParameter("gName");
			String gPrice = request.getParameter("gPrice");
			String gSize = request.getParameter("gSize");
			String gColor = request.getParameter("gColor");
			String gAmount = request.getParameter("gAmount");
			String gImage = request.getParameter("gImage");
			
			//CartDTO생성 
			CartDTO xx = new CartDTO();
			xx.setUserid(userid);
			xx.setgCode(gCode);
			xx.setgName(gName);
			xx.setgPrice(Integer.parseInt(gPrice));
			xx.setgSize(gSize);
			xx.setgColor(gColor);
			xx.setgAmount(Integer.parseInt(gAmount));
			xx.setgImage(gImage);
			
			/* System.out.println("cart 담기 전: " + xx.toString()); */
			
			//CartService.cartAdd사용 데이터  insert 후 
			CartService service = new CartService();
			int n = service.cartAdd(xx);
			
			/* System.out.println("cart 담기 후: " + n); */
			
			//GoodsRetrieve에 gCode요청으로 상품자세히 보기 화면 재출력 (메세지 전송 )
			//경고창에 장바구니 담기 성공 메세지 출력
			nextPage = "GoodsRetrieveServlet?gCode="+gCode;
			session.setAttribute("mesg", gCode + "Cart저장 성공");
		} else {
			nextPage = "LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
