package com.controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.GoodsDTO;
import com.service.GoodsService;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		GoodsService service = new GoodsService();
		List<GoodsDTO> list = service.goodsList("top");
		
		request.setAttribute("goodsList", list);
		System.out.println(list.toString());
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);

		//service goodsList("top")으로 카테고리 전송 목록가져오기
		//가져온 GoodsList를 request에 "goodsList"로 자정
		//main.jsp로 포워드 
		//main.jsp에서 gooodsList.jsp include 하도록 수정 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
