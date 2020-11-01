<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈핏</title>
<style type="text/css">
.join_custom {
	padding-top: 42px;
	padding-bottom: 22px;
}
.join_custom h3 {
	margin-bottom: 30px;
	font-size: 25px;
	font-family: "Roboto", sans-serif;
	font-weight: 500;
}
#join_btn {
	border: none;
}
.join_btn2 {
	margin-top: 28px;
}
.join_info span {
    font-weight: 600;
    float: left;
    padding: 16px 0 10px 9px;
}
.ex_box {
	padding-left: 9px;
	text-align: left;
}
.ex_check {
	margin: 4px 0 2px;
}
.ex_check label {
	margin: 4px 13px 11px 2px;
}
@media ( min-width : 1100px) {
	.section-margin {
		margin: 100px 0
	}
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function postfind() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('#post').val(data.zonecode);
				$('#addr1').val(data.address);
			}
		}).open();
	}
	function idcheck() {
		window.open("../member/idcheck.do", "idcheck",
				"width=300,height=150,scrollbars=no");
	}
	$(function() {
		$('#joinBtn').click(function() {

			let id = $('#id').val();
			if (id.trim() == "") {
				$('#id').focus();
				return;
			}

			let pwd = $('#pwd').val();
			if (pwd.trim() == "") {
				$('#pwd').focus();
				return;
			}

			let pwd1 = $('#pwd1').val();
			if (pwd1.trim() == "") {
				$('#pwd1').focus();
				return;
			}

			if (pwd !== pwd1) {
				alert("비밀번호를 다시 입력하세요");
				$('#pwd1').val("");
				$('#pwd1').focus();
				return;
			}

			let name = $('#name').val();
			if (name.trim() == "") {
				$('#name').focus();
				return;
			}

			let birthday = $('#birthday').val();
			if (birthday.trim() == "") {
				$('#birthday').focus();
				return;
			}

			let post = $('#post').val();
			if (post.trim() == "") {
				$('#post').focus();
				return;
			}

			let addr1 = $('#addr1').val();
			if (addr1.trim() == "") {
				$('#addr1').focus();
				return;
			}

			// 데이터 전송 
			$('#joinFrm').submit();
		});
	});
</script>
</head>
<body>
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner join_custom">
						<h3>SIGN UP</h3>
						<form method=post class="row login_form"
							action="../member/join_ok.do" name="joinFrm" id="joinFrm">
							<div class="col-md-9 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
							</div>
							<div class="col-md-3 form-group join_check">
								<input type=button value="중복체크" class="btn btn-default btn-sm" id="join_btn" onclick="idcheck()">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" maxlength='8' onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="비밀번호 재확인" maxlength='8' "this.placeholder = ''" onblur="this.placeholder = '비밀번호 재확인'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="이름" maxlength='10' onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
							</div>
							<div class="col-md-4 form-group">
								<input type="text" class="form-control" id="birthday" name="bday1" placeholder="년도" maxlength='4' onfocus="this.placeholder = ''" onblur="this.placeholder = '년도'">
							</div>
							<div class="col-md-4 form-group">
								<input type="text" class="form-control" id="birthday" name="bday2" placeholder="월"  maxlength='2' onfocus="this.placeholder = ''" onblur="this.placeholder = '월'">
							</div>
							<div class="col-md-4 form-group">
								<input type="text" class="form-control" id="birthday" name="bday3" placeholder="일"  maxlength='2' onfocus="this.placeholder = ''" onblur="this.placeholder = '일'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="gender" name="gender" placeholder="성별" onfocus="this.placeholder = ''" onblur="this.placeholder = '성별'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="tel" name="tel" placeholder="휴대전화"  maxlength='11' onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대전화'">
							</div>
							<div class="col-md-9 form-group">
								<input type="text" class="form-control" id="post" name="post" placeholder="우편번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '우편번호'">
							</div>
							<div class="col-md-3 form-group">
								<input type=button value="우편번호" class="btn btn-sm btn-default" id="join_btn" onclick="postfind()">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr2" name="addr2" onfocus="this.placeholder = ''" onblur="this.placeholder = '상세주소'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'">
							</div>
							
							<div class="col-md-12 join_info"><span>추가정보</span></div>
							
							<div class="ex_box">
								<div class="col-md-12">평소 관심있는 운동은 ?</div>
								<div class="ex_check col-md-12">
									<label class="radio-inline"><input type="radio" name="my_exercise" value="근력운동"> 근력운동</label>
									<label class="radio-inline"><input type="radio" name="my_exercise" value="요가"> 요가</label>
									<label class="radio-inline"><input type="radio" name="my_exercise" value="필라테스"> 필라테스</label>
								</div> 
								<div class="col-md-12">당신의 운동 수준은 ?</div>
								<div class="ex_check col-md-12">
									<label class="radio-inline"><input type="radio" name="my_level" value="초급"> 초급</label>
									<label class="radio-inline"><input type="radio" name="my_level" value="중급"> 중급</label>
									<label class="radio-inline"><input type="radio" name="my_level" value="고급"> 고급</label>
								</div>	
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit"
									class="button button-login w-100 join_btn2">가입하기</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-3"></div>
			</div>
		</div>
	</section>
</body>
</html>