<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mesg = (String) session.getAttribute("mesg");
	if (mesg != null) {
%>
	<script type="text/javascript">
		alert('<%=mesg%>');
	</script>
<%
	}
%>

<div id="container">
	<div id="contentWrap">
		<div class="formBox">
			<h1>ID/PW SEARCH</h1>
			<br>
			<form action="MemberIdSearchServlet" method="get">
				이름: <input type="text" name="username"><br>
				전화번호:
				<select name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
				</select>
				- <input type="text" name="phone2">
				- <input type="text" name="phone3"><br>
				
				이메일:
				<input type="text" name="email1"> @ <input type="text" name="email2" id="email2" placeholder=" 직접입력">
				<input type="submit" value="Sand Mail">
			</form>
		</div>
	</div>
</div>
