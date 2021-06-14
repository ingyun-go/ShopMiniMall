<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/footer.css" />
		<link rel="stylesheet" type="text/css" href="css/swiper.min.css" />
		<link rel="stylesheet" type="text/css" href="js/swiper.min.js" />
	</head>
	<body>
		<%
			String mesg = (String) session.getAttribute("memberAdd");
			if (mesg != null) {
		%>
			<script type="text/javascript">
				alert('<%=mesg%>');
			</script>
		<%
			}
		%>
		<jsp:include page="common/header.jsp" flush="true"></jsp:include>
		<jsp:include page="member/slider.jsp" flush="true"></jsp:include>
		<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include>
		<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
	</body>
</html>