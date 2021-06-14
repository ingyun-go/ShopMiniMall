<%@ page import="com.dto.GoodsDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/content.css" />

<div id="container">
	<div id="contentWrap">
		<h3 style="font-size: 24px; font-weight: bold; margin-bottom: 50px; text-align: center;">WEEKLY BEST</h3>
		<table>
			<tr>
				<td>
					<table align="center" width="1200px" cellspacing="0" cellpadding="0" border="0">
						<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
						<%
				    		List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("goodsList");
				    		for(int i=1;i<=list.size();i++){
				    		GoodsDTO dto = list.get(i-1);
				    		String gCode = dto.getgCode();
				    		String gCategory = dto.getgCategory();
				    		String gName = dto.getgName();
				    		String gContent = dto.getgContent();
				    		int gPrice = dto.getgPrice();
				    		String gImage = dto.getgImage();
				 		%>
						<td>
							<table class="gallery" style="table-layout:fixed; width:260px;">
								<tr>
									<td>
										<a href="GoodsRetrieveServlet?gCode=<%=gCode %>">
											<img src="images/items/<%=gImage %>.gif" border="0" align="center" width="260">
										</a>
									</td>
								</tr>
								
								<tr>
									<td height="10">
								</tr>
								
								<tr>
									<td class="td_default" align="center">
										<a class="a_black" href=""> <%= gName%><br></a>
										<font color="gray"> -------------------- </font>
									</td>
								</tr>
								
								<tr>
									<td height="5">
								</tr>
									
								<tr>
									<td class="td_gray" align="center" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:260px"><%= gContent%></td>
								</tr>
									
								<tr>
									<td height="10">
								</tr>
									
								<tr>
									<td class="td_red" align="center">
										<font color="red"><strong><%= gPrice%></strong></font>
									</td>
								</tr>
								</table>
							</td>
							
							<!-- 한줄에 4개씩 보여주기 -->
							<%
				     			if(i%4==0){
				   			%>
						
							<tr>
								<td height="20">
							</tr>
						
							<%
				      			}//end if
				   			%>

							<%
    							}//end for
							%>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="10">
			</tr>
		</table>
	</div>
</div>