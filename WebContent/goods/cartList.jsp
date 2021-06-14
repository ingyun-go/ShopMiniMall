<%@ page import="com.dto.CartDTO"%>
<%@ page import="com.dto.GoodsDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/content.css" />

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//삭제버튼
		$(".delBtn").on("click", function() {
			var num = $(this).attr("data-xxx");
			location.href="CartDelServlet?num="+num;
		});
		
 		//주문버튼
		$(".orderBtn").on("click", function(){
			var num =$(this).attr("data-xxx");
			location.href="CartOrderConfirmServlet?num="+num;
		});		
	
		//전체선택
		$("#allCheck").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = result;
			});
		});

		//전체삭제
		$("#delAllCart").on("click", function() {
			var num = [];
			$("input:checkbox[name='check']:checked").each(function(idx, ele) {
				num[idx]=$(this).val();
			});
			console.log(num);
			location.href="CartDelAllServlet?data="+num;
		});
			 	
 		//선택삭제
		$("#delAllCart2").on("click", function() {
			$("form").attr("action","CartDelAllServlet2");
			$("form").submit(); //trigger
		});
		
		/*
 		//수정버튼
		$(".updateBtn").on("click", function() {
			var num = $(this).attr("data-xxx");
			var price = $(this).attr("data-price");
			var CountAmount = "#cartAmount" + num;
			var gAmount = $(CountAmount).val();
			console.log(num);
			console.log(price);
			console.log(gAmount);
		})
		*/
		
		//수정버튼
		$(".updateBtn").on("click",function(){
			
				var num = $(this).attr("data-xxx");
	        	var gAmount = $("#cartAmount"+num).val();
	        	var gPrice= $(this).attr("data-price");
				/* 	var price = $(this).attr("data-price");
				var CountAmount = "#cartAmount" + num;
				var gAmount = $(CountAmount).val(); */
				console.log(num);
				console.log(price);
				console.log(gAmount);
				
			$.ajax({
				type:'get',
				url:'CartUpdateServlet',
				dataType:'text',
				data:{
				/* 	num:$(this).attr("data-xxx"),
					gAmount:$(CountAmount).val() */
					num:num,
					gAmount:gAmount
				},
				success : function(data, status, xhr) {
					var sum=gAmount*gPrice;
					$("#sum"+num).text(sum);
				},
				error : function(xhr, status, error) {
				}
			});
		});
	});
</script>

<div id="container">
	<div id="contentWrap">
	
		<table width="1160px" cellspacing="0" cellpadding="0" border="0" style="margin:0 auto;">
			<tr>
				<td height="30">
			</tr>
			<tr>
				<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
					size="5"><b>- 장바구니-</b></font> &nbsp;
				</td>
			</tr>
			<tr>
				<td height="15">
			</tr>
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>
			<tr>
				<td height="7">
			</tr>
			<tr>
				<td class="td_default">
					<input type="checkbox" name="allCheck" id="allCheck">
					<strong>전체선택</strong>
				</td>
				<td class="td_default">
					<strong>주문번호</strong>
				</td>
				<td class="td_default" align="center" colspan="2">
					<strong>상품정보</strong>
				</td>
				<td class="td_default">
					<strong>판매가</strong>
				</td>
				<td class="td_default" colspan="2">
					<strong>수량</strong>
				</td>
				<td class="td_default">
					<strong>합계</strong>
				</td>
				<td></td>
			</tr>
			<tr>
				<td height="7">
			</tr>
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>

			<form name="myForm">
			
				<%
				   List<CartDTO> list = (List<CartDTO>)request.getAttribute("cartList");
				   for(int i=0; i<list.size(); i++) {
					   CartDTO dto = list.get(i); //주문정보 1개 얻기 
					   int num = dto.getNum();
					   String userid = dto.getUserid();
					   String gCode = dto.getgCode();
					   String gName = dto.getgName();
					   int gPrice = dto.getgPrice();
					   String gSize = dto.getgSize();
					   String gColor = dto.getgColor();
					   int gAmount = dto.getgAmount();
					   String gImage = dto.getgImage();
				
				%>
				<tr>
					<td class="td_default" width="100">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
						<input type="checkbox" name="check" id="check81" class="check" value="<%=num %>">
					</td>
					
					<td class="td_default" width="100" style="text-align:center;"><%=num %></td>
					
					<td class="td_default" width="80">
						<img src="images/items/<%=gImage %>.gif" border="0" align="center" width="80" />
					</td>
					
					<td class="td_default" width="350" style='padding-left: 30px'><%=gName %><br>
						<font size="2" color="#665b5f">[옵션 : 사이즈(<%=gSize %>) , 색상(<%=gColor %>)]</font>
					</td>
					
					<td class="td_default" align="center" width="110"><%=gPrice %></td>
					
					<td class="td_default" align="center" width="90">
						<input class="input_default" type="text" name="cartAmount" id="cartAmount<%=num %>" style="text-align: right" maxlength="3" size="2" value="<%=gAmount %>">
						</input>
					</td>
					
					<td>
						<input type="button" value="수정" class="updateBtn" data-xxx="<%=num %>" data-price="<%=gPrice %>">
					</td>
					
					<td class="td_default" align="center" width="80" style='padding-left: 5px'>
						<span id="sum<%=num %>"><%=gPrice*gAmount %></span>
					</td>	
						
					<td>
						<input type="button" value="주문" class="orderBtn" data-xxx="<%=num %>">
					</td>
					
					<td class="td_default" align="center" width="30" style='padding-left: 10px'>
						<input type="button" value="삭제" id="xx<%=i %>" class="delBtn" data-xxx="<%=num %>">
					</td>
						
					<td height="10"></td>
				</tr>
				<%
				   }
				%>
			</form>
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>
			<tr>
				<td height="30">
			</tr>
			<tr>
				<td align="center" colspan="5">
					<a id="" href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="delAllCart" href="javascript:delAllCart(myForm)"> 전체 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="delAllCart2" href="javascript:delAllCart(myForm)"> 선택 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="" href="main"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td height="20">
			</tr>
		
		</table>
		
	</div>
</div>
