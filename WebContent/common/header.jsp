<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  메뉴부분 -->
		<div class="wrap main" id="mainWrap">
			<div class="header-wrap top">
				<div class="header">
					<div class="inner">
						<h1><a href="main">Logo</a></h1>
						<div class="header-util">
							<ul>
								<li class="util-join">
									<%
										MemberDTO dto = (MemberDTO)session.getAttribute("login");
										if(dto != null){
										String username = dto.getUsername();
									%>
									<%= username %> 님
									/ <a href="LogoutServlet" onclick="">로그아웃</a>
								</li>
								<li class="util-alarm">
									<a href="MyPageServlet">마이페이지</a>
								</li>
								<li class="util-order">
									<a href="" onclick="">주문/배송</a>
								</li>
								<li class="util-cs">
									<a href="" onclick="">고객센터</a>
								</li>
								<li class="util-cart">
									<a href="CartListServlet" onclick="">
										장바구니 <span id="ibgaCNT">0</span>
										<span class="arrow-bottom bottom1" id="basketDropIcon"></span>
									</a>
									<%
										}else{
									%>
								</li>
								<li class="util-join">
									<a href="LoginUIServlet" onclick="">로그인</a> / <a href="MemberUIServlet" onclick="">회원가입</a>
								</li>
								<li class="util-order">
									<a href="" onclick="">주문/배송</a>
								</li>
								<li class="util-cs">
									<a href="" onclick="">고객센터</a>
								</li>
								<li class="util-cart">
									<a href="CartListServlet" onclick="">
										장바구니 <span id="ibgaCNT">0</span>
										<span class="arrow-bottom bottom1" id="basketDropIcon"></span>
									</a>
									<div class="util-layer" id="lyrHdCartList"></div>
									<%
										}
									%>
								</li>
							</ul>
						</div>
						<div class="header-service">
							<div class="search-form">
								<form name="searchForm" method="get" action="" onSubmit="" style="padding:1px 0 1px 0">
									<input type="hidden" name="rect" value="">
									<input type="hidden" name="cpg" value="">
									<input type="hidden" name="extUrl" value="">
									<input type="hidden" name="tvsTxt" value="">
									<input type="hidden" name="gaparam" value="main_menu_search">
									<input type="search" name="sTtxt" id="sTtxt" value="검색어 입력" onkeyup="" onFocus="this.value='';return true;" autocomplete="off" />
									<button type="submit" class="btn-search" onclick="">
										<span class="search">검색</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="gnb-wrap">
					<div class="nav">
						<ul id="main-menu">
							<li><a href="GoodsListServlet?gCategroy=top">Top</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">반팔티</a></li>
									<li><a href="#" aria-label="subemnu">긴팔티</a></li>
									<li><a href="#" aria-label="subemnu">후드/맨투맨</a></li>
									<li><a href="#" aria-label="subemnu">셔츠</a></li>
								</ul>
							</li>
							<li class="line"><a href="GoodsListServlet?gCategroy=dress">Dress</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">미니</a></li>
									<li><a href="#" aria-label="subemnu">미디</a></li>
									<li><a href="#" aria-label="subemnu">롱</a></li>
									<li><a href="#" aria-label="subemnu">패턴</a></li>
								</ul>
							</li>
							<li class="line"><a href="GoodsListServlet?gCategroy=outer">Outer</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">가디건</a></li>
									<li><a href="#" aria-label="subemnu">자켓</a></li>
									<li><a href="#" aria-label="subemnu">코트</a></li>
									<li><a href="#" aria-label="subemnu">조끼</a></li>
								</ul>
							</li>
							<li class="line"><a href="GoodsListServlet?gCategroy=bottom">Bottom</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">7~9부</a></li>
									<li><a href="#" aria-label="subemnu">반바지</a></li>
									<li><a href="#" aria-label="subemnu">큐롯</a></li>
									<li><a href="#" aria-label="subemnu">데님</a></li>
								</ul>
							</li>
							<li class="line"><a href="#">Skirt</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">H라인</a></li>
									<li><a href="#" aria-label="subemnu">A라인</a></li>
									<li><a href="#" aria-label="subemnu">플레어</a></li>
									<li><a href="#" aria-label="subemnu">프릴</a></li>
								</ul>
							</li>
							<li class="line"><a href="#">Accessories</a>
								<ul id="sub-menu">
									<li><a href="#" aria-label="subemnu">헤어</a></li>
									<li><a href="#" aria-label="subemnu">안경</a></li>
									<li><a href="#" aria-label="subemnu">벨트</a></li>
									<li><a href="#" aria-label="subemnu">장갑</a></li>
								</ul>
							</li>
							<li class="line">
								<a href="#"><span style="color:#ea5d5d">+Sale</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>