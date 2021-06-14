<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	<!-- id, 패스워드 입력 검사 후 진행하도록  작성 -->
	$("form").on("submit",function(event){	
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
			if(userid.length==0){
				alert("userid 필수")
				$("#userid").focus();
				event.preventDefault();
			}else if(passwd.length==0){
				alert("passwd 필수")
				$("#passwd").focus();
				event.preventDefault();
			}
	});
</script>

<div id="container">
	<div id="contentWrap">
		<div class="formBox">
			<h1>LOGIN</h1>
			<br>
			<form action="LoginServlet" method="get">
				아이디: <input type="text" name="userid" id="userid"><br>
				비밀번호: <input type="text" name="passwd" id="passwd"><br>
				<input type="submit" value="로그인">
				<input type="reset" value="취소">
				<a href="MemberIdSearchUIServlet" style="text-decoration:none;">아이디 찾기</a>
			</form>
		</div>
	</div>
</div>
