<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.check_box {
	padding-top: 40px;
    padding-left: 23px;
}
.id_box {
	padding-top: 3px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// window 
$(function(){
	$('#idcheckBtn').click(function(){
		let id=$('#id').val();
		if(id=="") //id가 입력이 없는 경우
		{
			$('#id').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/idcheck_ok.do',
			data:{"id":id},
			success:function(result)
			{
				let count=result.trim();
				// COUNT (0,1)
				if(count==0) // ID가 없는 상태
				{
					$('#idcheck_result').html("<font color=blue>사용 가능한 아이디입니다.</font>");
					$('#ok').html('<input type=button value=확인 onclick="ok()">')
				}
				else // ID가 있는 상태
				{
					$('#idcheck_result').html("<font color=red>이미 사용중인 아이디입니다.</font>");
				}
			}
		})
	})
});
function ok()
{
	opener.joinFrm.id.value=$('#id').val();
	self.close(); 
}
</script>
</head>
<body>
   <div class="container">
     <div class="row">
       <table class="table">
         <tr>
           <td class="check_box">
            ID : <input type=text id=id class="input-sm id_box" size=15>
            <input type=button value="중복체크" id="idcheckBtn" class="btn btn-sm btn-default">
           </td>
         </tr>
         <tr>
           <td class="text-center" id="idcheck_result"></td><%-- 아이디 체크 결과 --%>
         </tr>
         <tr>
           <td class="text-center" id="ok"></td><%-- 아이디 확인 --%>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>