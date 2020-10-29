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
			/* 
			여기서 이거 submit 말고 ajax로 받고 login_ok에서 전부 지우고 msg만 처리하고 
			no id 웅앵은 이미 model에 담겨 있음  / 여기에는 추가할 div 설정해서 if 처리하기  
			*/
		});
	});
</script>
</head>
<body>	
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>New to our website?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="register.html">Create an Account</a>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<c:if test="${sessionScope.id==null }">
							<!--  login form  -->
							<form method="post" class="row login_form" action="../member/login_ok.do" id="logFrm" >
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="log_id" name="id" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
								</div>
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="log_pwd" name="pwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
								</div>
								<div class="col-md-12 form-group">
									<div class="creat_account">
										<input type="checkbox" id="f-option2" name="selector">
										<label for="f-option2">Keep me logged in</label>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<button type="submit" value="submit" class="button button-login w-100" id="logBtn">Log In</button>
									<a href="#">Forgot Password?</a>
								</div>
							</form>
							<!--  login form  -->
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section> 
	<!-- dialog -->
	<div id="dialog" style="display: none">
		<jsp:include page="../member/login_ok.jsp"></jsp:include>
	</div>
	<!-- dialog -->
</body>
</html>