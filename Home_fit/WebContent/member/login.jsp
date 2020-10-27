<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#logBtn').click(function() {
			let id = $('#log_id').val();
			if (id.trim() == "") {
				$('#log_id').focus();
				return;
			}

			let pwd = $('#log_pwd').val();

			if (pwd.trim() == "") {
				$('#log_pwd').focus();
				return;
			}

			$('#logFrm').submit();
		});
	});
</script>
</head>
<body>
	<div class="jumbotron">
		<c:if test="${sessionScope.id==null }">
			<form method="post" action="../member/login_ok.do" id="logFrm">
				<div class="text-right">
					<input type="text" class="input-sm" name=id size="15" id="log_id"
						placeholder="아이디입력" style="color: black"> <input
						type="password" class="input-sm" name=pwd size="15" id="log_pwd"
						placeholder="비밀번호입력" style="color: black"> <input
						type="button" class="btn btn-danger btn-sm" id="logBtn"
						value="로그인">
				</div>
			</form>
		</c:if>
	</div>
	<div id="dialog" style="display: none">
		<jsp:include page="../member/login_ok.jsp"></jsp:include>
	</div> 
</body>
</html>